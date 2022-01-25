<template>
  <v-container>
    <div v-if="isNotYetSentLetter">
      <div
        v-for="sentLetter in sentLetters"
        :key="sentLetter.id"
      >
        <SentLetterCard
          :user="user"
          :sent-letter="sentLetter"
          @update-letter="handleUpdateLetter"
          @delete-letter="deleteLetter"
        />
      </div>
    </div>
    <IsNotYetLetter v-else />
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import SentLetterCard from './SentLetterCard';
import IsNotYetLetter from './IsNotYetLetter';

export default {
  name: "SentLetterList",
  components: {
    SentLetterCard,
    IsNotYetLetter
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    sentLetters: {
      type: Array,
      required: true
    },
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    isNotYetSentLetter() {
      return this.sentLetters.length !== 0 ? true : false;
    }
  },
  methods: {
    openUpdateLetterModal() {
      this.isVisibleUpdateLetterModal = true;
    },
    handleCloseUpdateLetterModal() {
      this.isVisibleUpdateLetterModal = false;
    },
    deleteLetter(letter) {
      const letterIndex = this.sentLetters.findIndex((sentLetter) => {
        return sentLetter.letter.id === letter.id
      });
      this.sentLetters.splice(letterIndex, 1);
    },
    handleUpdateLetter() {
      this.$emit("update-letter");
    }
  },
};
</script>

<style scoped>
</style>
