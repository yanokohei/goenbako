<template>
  <v-container v-if="currentUser">
    <v-row
      class="ma-8"
      justify="center"
    >
      <ProfileCard />
    </v-row>
    <v-row class="justify-center mb-8 pa-4">
      <v-btn
        color="blue"
        class="white--text"
        rounded
        large
        @click="openShareLinkModal"
      >
        Myご縁箱をシェアする
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
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import ProfileCard from "../components/ProfileCard";
import ShareLinkModal from "../components/ShareLinkModal";
import LetterListTab from "../components/LetterListTab";

export default {
  name: "Mypage",
  components: {
    ProfileCard,
    ShareLinkModal,
    LetterListTab
  },
  data() {
    return {
      user: {},
      receivedLetters: [],
      sentLetters: [],
      isVisibleShareLinkModal: false,
    };
  },

  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  mounted() {
    this.$axios.get("users/me")
    .then((res) => {
      this.user = res.data
      this.$store.commit('users/setCurrentUser', res.data)
      this.fetchReceivedLetters(),
      this.fetchSentLetters()
    })
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
    },
    async fetchSentLetters() {
      await axios.get(`/api/users/${this.currentUser.twitter_id}/sent_letters`)
        .then((res) => {
          this.sentLetters = res.data
        })
    },
  }
};
</script>

<style scoped>
</style>
