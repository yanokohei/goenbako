<template>
  <v-container>
    <v-row
      class="ma-8"
      justify="center"
    >
      <UserProfileCard
        :user="user"
      />
    </v-row>
    <v-row class="justify-center mb-5 pa-4">
      <v-btn
        v-if="isOtherCurrentUser"
        color="deep-purple lighten-5"
        rounded
        large
        @click="openCreateLetterModal"
      >
        <v-icon left>
          mdi-plus
        </v-icon>
        ファンレターを書く
      </v-btn>
    </v-row>
    <transition name="fade">
      <TheLoginGuidanceModal
        :is-visible-login-guidance-modal="isVisibleLoginGuidanceModal"
        @close-modal="handleCloseLoginGuidanceModal"
      />
    </transition>
    <transition name="fade">
      <CreateLetterModal
        :is-visible-create-letter-modal="isVisibleCreateLetterModal"
        :user="user"
        @create-letter="fetchReceivedLetters"
        @close-modal="handleCloseCreateLetterModal"
      />
    </transition>
    <LetterListTab
      :user="user"
      :received-letters="receivedLetters"
      :sent-letters="sentLetters"
    />
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import UserProfileCard from "../components/UserProfileCard";
import CreateLetterModal from "../components/CreateLetterModal";
import DoneSendLetter from "../components/DoneSendLetter";
import LetterListTab from "../components/LetterListTab";
import TheLoginGuidanceModal from "../components/shared/TheLoginGuidanceModal";

export default {
  name: "User",
  components: {
    UserProfileCard,
    CreateLetterModal,
    DoneSendLetter,
    LetterListTab,
    TheLoginGuidanceModal
  },

  data() {
    return {
      user: {},
      receivedLetters: [],
      sentLetters: [],
      isVisibleCreateLetterModal: false,
      isVisibleLoginGuidanceModal: false
    };
  },
  mounted() {
    this.fetchUser()
    this.fetchReceivedLetters()
    this.fetchSentLetters()
  },
  computed: {
    ...mapGetters("users", ["currentUser"]),
    ...mapGetters("users", ["isAuthenticatedUser"]),
    currentPath() {
      return this.$route.path
    },
    isOtherCurrentUser() {
      return this.$route.path !== `/${this.currentUser.twitter_id}` && this.$route.path !== `/${this.currentUser.twitter_id}/`
    },
  },
  methods: {
    async fetchUser() {
      await axios.get(`/api/users/${this.$route.params.twitter_id}`)
      .then((res) => {
        this.user = res.data
      })
    },
    async fetchReceivedLetters() {
      await axios.get(`/api/users/${this.$route.params.twitter_id}/received_letters`)
        .then((res) => {
          this.receivedLetters = res.data
        })
    },
    async fetchSentLetters() {
      await axios.get(`/api/users/${this.$route.params.twitter_id}/sent_letters`)
        .then((res) => {
          this.sentLetters = res.data
        })
    },
    openCreateLetterModal() {
      if (this.isAuthenticatedUser) {
        this.isVisibleCreateLetterModal = true
      }
      else {
        this.isVisibleLoginGuidanceModal = true;
        this.$store.dispatch("flash/setFlash", {
          type: "info",
          message: "ログインが必要です。"
        })
      }
    },
    handleCloseCreateLetterModal() {
      this.isVisibleCreateLetterModal = false;
    },
    handleCloseLoginGuidanceModal() {
      this.isVisibleLoginGuidanceModal = false;
    }
  },
  watch: {
    currentPath: function() {
      this.fetchUser()
      this.fetchReceivedLetters()
      this.fetchSentLetters()
    }
  },
};
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
