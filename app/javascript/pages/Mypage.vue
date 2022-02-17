<template>
  <v-container v-if="currentUser">
    <v-row
      class="ma-8"
      justify="center"
    >
      <ProfileCard />
    </v-row>
    <v-row class="justify-center mb-5 pa-4">
      <v-btn
        color="blue"
        class="white--text m-font"
        rounded
        large
        @click="openShareLinkModal"
      >
        <v-icon>mdi-twitter</v-icon>
        <span class="m-font white--text ml-2">Myご縁箱をシェアする</span>
      </v-btn>
    </v-row>
    <transition name="fade">
      <ShareLinkModal
        :is-visible-share-link-modal="isVisibleShareLinkModal"
        @close-modal="handleCloseShareLinkModal"
      />
    </transition>
    <LetterListTab
      :user="user"
      :received-letters="receivedLetters"
      :sent-letters="sentLetters"
      @update-letter="fetchSentLetters"
    />
    <transition name="fade">
      <TheHelpboxModal
        :is-visible-helpbox-modal="isVisibleHelpboxModal"
        @close-modal="handleCloseHelpboxModal"
      />
    </transition>
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import ProfileCard from "../components/ProfileCard";
import ShareLinkModal from "../components/ShareLinkModal";
import LetterListTab from "../components/LetterListTab";
import TheHelpboxModal from "../components/shared/TheHelpboxModal";

export default {
  name: "Mypage",
  components: {
    ProfileCard,
    ShareLinkModal,
    LetterListTab,
    TheHelpboxModal
  },
  data() {
    return {
      user: {},
      receivedLetters: [],
      sentLetters: [],
      isVisibleShareLinkModal: false,
      isVisibleHelpboxModal: false,
    };
  },

  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    ...mapGetters({ needHelpbox: "helpbox/needHelpbox" }),
  },
  mounted() {
    axios.get("/api/users/me")
    .then((res) => {
      this.user = res.data
      this.$store.commit('users/setCurrentUser', res.data)
      this.fetchReceivedLetters(),
      this.fetchSentLetters()
    }),
    document.title = "マイページ - ご縁箱"
  },
  methods: {
    openShareLinkModal() {
      this.isVisibleShareLinkModal = true;
    },
    handleCloseShareLinkModal() {
      this.isVisibleShareLinkModal = false;
    },
    async fetchReceivedLetters() {
      await axios.get(`/api/users/${this.currentUser.twitter_id}/received_letters`)
        .then((res) => {
          this.receivedLetters = res.data
        })
        setTimeout(this.isYetReceivedLetterOpenHelpbox, 1000);
    },
    async fetchSentLetters() {
      await axios.get(`/api/users/${this.currentUser.twitter_id}/sent_letters`)
        .then((res) => {
          this.sentLetters = res.data
        })
    },
    isYetReceivedLetterOpenHelpbox() {
      if (this.receivedLetters.length === 0 && this.needHelpbox) {
        this.openHelpboxModal();
        this.$store.commit('helpbox/onceHelpbox', false)
      }
    },
    openHelpboxModal() {
      this.isVisibleHelpboxModal = true;
    },
    handleCloseHelpboxModal() {
      this.isVisibleHelpboxModal = false;
    },
  }
};
</script>

<style scoped>
.m-font{
  font-size: 1.0em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
