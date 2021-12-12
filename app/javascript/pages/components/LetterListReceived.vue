<template>
  <v-container>
    <div
      v-for="receivedLetter in receivedLetters"
      :key="receivedLetter.id"
    >
      <keep-alive>
        <v-card
          flat
          color="#f1f1f1"
          rounded="xl"
          class="mb-8 mt-4 mx-3"
        >
          <v-card-title class="pb-0">
            <router-link :to="{ name: 'UserIndex', params: { twitter_id: receivedLetter.sender.twitter_id }}">
              <v-list-item-avatar size="65">
                <img :src="receivedLetter.sender.image">
              </v-list-item-avatar>
            </router-link>
            <v-list-item-content class="pa-0">
              <v-card-title class="s-font">
                {{ receivedLetter.sender.name }}
              </v-card-title>
              <v-card-subtitle>
                @{{ receivedLetter.sender.twitter_id }}
                <v-btn
                  icon
                  color="blue"
                  :href="`https://twitter.com/${receivedLetter.sender.twitter_id}`"
                >
                  <v-icon>mdi-twitter</v-icon>
                </v-btn>
              </v-card-subtitle>
            </v-list-item-content>
          </v-card-title>
          <LetterItem
            class="pt-0"
            :letter-items="receivedLetter"
            :user="user"
          />
          <v-row
            justify="end"
            class="ma-4"
          >
            <v-btn
              v-if="isCurrentMypage"
              color="blue"
              class="white--text"
              small
              @click="openShareLetterModal"
            >
              <v-icon>mdi-twitter</v-icon>
              シェア
            </v-btn>
            <v-btn
              v-if="isCurrentMypage"
              tile
              small
              color="brown darken-1"
              dark
              @click="hundleDeleteLetter(receivedLetter)"
            >
              <v-icon> mdi-delete </v-icon>
            </v-btn>
          </v-row>
        </v-card>
      </keep-alive>
    </div>
    <transition name="fade">
      <ShareLetterModal
        :is-visible-share-letter-modal="isVisibleShareLetterModal"
        @close-modal="handleCloseShareLetterModal"
      />
    </transition>
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex"
import LetterItem from '../components/LetterItem';
import ShareLetterModal from "./ShareLetterModal";

export default {
  components: {
    ShareLetterModal,
    LetterItem
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    receivedLetters: {
      type: Array,
      required: true
    },
  },
  data() {
    return {
      isVisibleShareLetterModal: false,
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    isCurrentMypage() {
      return this.$route.path === '/mypage'
    }
  },
  methods: {
    openShareLetterModal() {
      this.isVisibleShareLetterModal = true;
    },
    handleCloseShareLetterModal() {
      this.isVisibleShareLetterModal = false;
    },
    hundleDeleteLetter(receivedLetter) {
      if (!confirm("削除してよろしいですか?")) return;
      this.deleteLetter(receivedLetter);
      this.$store.dispatch("flash/setFlash", {
        type: "success",
        message: "レターを削除しました。",
      });
    },
    deleteLetter(receivedLetter) {
      axios
        .delete(`/api/letters/${receivedLetter.letter.id}`)
        .then(() => this.$emit("delete-letter"));
    },

  },
};
</script>

<style scoped>
.s-font{
  font-size: 1.0em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
</style>
