<template>
  <v-container>
    <keep-alive>
      <v-card
        flat
        color="#f1f1f1"
        rounded="xl"
        width="330"
      >
        <v-img
          src="/img/From.svg"
          max-width="45px"
          class="from-position"
        />
        <v-card-title class="pt-4 pb-0">
          <router-link :to="{ name: 'User', params: { twitter_id: receivedLetter.sender.twitter_id }}">
            <v-list-item-avatar class="pa-0 mr-2 ml-2" size="60">
              <img :src="receivedLetter.sender.image">
            </v-list-item-avatar>
          </router-link>
          <v-list-item-content class="pa-0">
            <v-list-item-title class="s-font">
              {{ receivedLetter.sender.name }}
            </v-list-item-title>
            <v-list-item-subtitle>
              @{{ receivedLetter.sender.twitter_id }}
              <v-btn
                icon
                color="blue"
                :href="`https://twitter.com/${receivedLetter.sender.twitter_id}`"
              >
                <v-icon>mdi-twitter</v-icon>
              </v-btn>
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-card-title>
        <LetterItem
          class="pt-0"
          :letter-items="receivedLetter"
        />
        <v-row
          v-if="isCurrentMypage"
          justify="end"
          class="ma-4"
        >
          <v-btn
            color="blue"
            class="white--text ma-1"

            small
            @click="openShareLetterModal"
          >
            <v-icon>mdi-twitter</v-icon>
            シェア
          </v-btn>
          <v-btn
            color="brown darken-1"
            class="white--text ma-1"
            dark
            small
            @click="hundleDeleteLetter(receivedLetter)"
          >
            <v-icon> mdi-delete </v-icon>
          </v-btn>
        </v-row>
      </v-card>
    </keep-alive>
    <transition name="fade">
      <ShareLetterModal
        :is-visible-share-letter-modal="isVisibleShareLetterModal"
        @close-modal="handleCloseShareLetterModal"
        :received-letter="receivedLetter"
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
  name: "LetterListReceived",
  components: {
    ShareLetterModal,
    LetterItem
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    receivedLetter: {
      type: Object,
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
      if (!confirm("削除してもよろしいですか?")) return;
      this.deleteLetter(receivedLetter);
      this.$store.dispatch("flash/setFlash", {
        type: "success",
        message: "レターを削除しました。",
      });
    },
    deleteLetter(receivedLetter) {
      axios
        .delete(`/api/letters/${receivedLetter.letter.id}`)
        .then((res) => this.$emit("delete-letter", res.data));
    },

  },
};
</script>

<style scoped>
.s-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.from-position {
  position: absolute;
  top: -3px;
  left: -2px;
}
</style>
