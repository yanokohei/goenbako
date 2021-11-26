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
    <div class="corner-title top-sub-title">
      あなたが送ったファンレター
      <v-icon>mdi-email-edit-outline</v-icon>
    </div>
    <v-divider />
    <NotSendLetter />
    <v-row class="justify-center mb-4">
      <v-col align="center">
        <v-btn
          color="blue"
          class="white--text"
          rounded
          x-large
          @click="openCreateLetterModal"
        >
          <v-icon left>
            mdi-plus
          </v-icon>
          書いてみる
        </v-btn>
      </v-col>
    </v-row>
    <transition name="fade">
      <CreateLetterModal
        :is-visible-create-letter-modal="isVisibleCreateLetterModal"
        :user="user"
        @create-letter="fetchReceivedLetters"
        @close-modal="handleCloseCreateLetterModal"
      />
    </transition>
    <MySendLetter
        :user="user"
    />
    <LetterListTab
      :user="user"
      :letter-items="receivedLetters"
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
import MySendLetter from "../components/MySendLetter";
import LetterListTab from '../components/LetterListTab';

export default {
  name: "UserIndex",
  components: {
    UserProfileCard,
    CreateLetterModal,
    NotSendLetter,
    MySendLetter,
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
      await axios.get(`/api/users/${this.$route.params.id}`)
      .then((res) => {
        this.user = res.data
      })
    },
    async fetchReceivedLetters() {
      await axios.get(`/api/users/${this.$route.params.id}/received_letters`)
        .then((res) => {
          this.receivedLetters = res.data
        })
    },
    async fetchSentLetters() {
      await axios.get(`/api/users/${this.$route.params.id}/sent_letters`)
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
