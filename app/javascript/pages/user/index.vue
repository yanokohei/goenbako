<template>
  <v-container>
    <v-row class="ma-8" justify="center">
      <UserProfileCard
        :user="user"
      />
    </v-row>
    <div class="corner-title top-sub-title">
      あなたが送ったファンレター
      <v-icon>mdi-email-edit-outline</v-icon>
    </div>
    <v-divider></v-divider>
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
        @create-modal="createLetter"
        @close-modal="handleCloseCreateLetterModal"
        :user="user"
      />
    </transition>
      <MySendLetter
        :letter-items="letterItems"
        :user="user"
      />
      <LetterListTab />
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
      letterItems: { // 検証中
        id: this.$route.params.id,//
        receiver_id: this.$route.params.id,
        past: "test",
        current: "test",
        future: "",
        expect: "",
        message: "test",
      },
      isVisibleCreateLetterModal: false,
    };
  },
  mounted() {
    this.fetchUser()
    // this.fetchletterItems()
  },
  computed: {
    ...mapGetters("users", ["currentUser"]),
  },
  methods: {
    async fetchUser() {
      await axios.get(`/api/users/${this.$route.params.id}`)
      .then((res) => {
        this.user = res.data
      })
    },
    // async fetchletterItems() {
    //   await axios.get('/api/users/received_letters')
    //     .then((res) => {
    //       this.letterItems = res.data
    //       console.log(res.data);
    //     })
    // },
    openCreateLetterModal() {
      this.isVisibleCreateLetterModal = true;
    },
    handleCloseCreateLetterModal() {
      this.isVisibleCreateLetterModal = false;
    },
    createLetter(letter) {
        this.letterItems.push(letter);
    },
  }
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
