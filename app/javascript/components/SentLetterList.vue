<template>
  <v-container>
    <div
      v-for="sentLetter in sentLetters"
      :key="sentLetter.id"
    >
      <SentLetterCard
        :user="user"
        :sentLetter="sentLetter"
        @update-letter="handleUpdateLetter"
        @delete-letter="deleteLetter"
      />
    </div>
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import SentLetterCard from './SentLetterCard';

export default {
  name: "SentLetterList",
  components: {
    SentLetterCard
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
