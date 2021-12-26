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
    <v-row class="justify-center mb-8 pa-4">
      <v-btn
        v-if="this.currentUser"
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
import NotSendLetter from "../components/NotSendLetter";
import CreateLetterModal from "../components/CreateLetterModal";
import DoneSendLetter from "../components/DoneSendLetter";
import LetterListTab from '../components/LetterListTab';

export default {
  name: "User",
  components: {
    UserProfileCard,
    CreateLetterModal,
    NotSendLetter,
    DoneSendLetter,
    LetterListTab,
  },

  data() {
    return {
      user: {},
      receivedLetters: [],
      sentLetters: [],
      isVisibleCreateLetterModal: false,
    };
  },
  mounted() {
    this.fetchUser()
    this.fetchReceivedLetters()
    this.fetchSentLetters()
  },
  computed: {
    ...mapGetters("users", ["currentUser"]),
    currentPath() {
      return this.$route.path
    }
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
      this.isVisibleCreateLetterModal = true;
    },
    handleCloseCreateLetterModal() {
      this.isVisibleCreateLetterModal = false;
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
