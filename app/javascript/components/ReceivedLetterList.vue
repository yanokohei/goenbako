<template>
  <v-container>
    <div
      v-for="receivedLetter in receivedLetters"
      :key="receivedLetter.id"
    >
      <ReceivedLetterCard
        :user="user"
        :received-letter="receivedLetter"
        @delete-letter="deleteLetter"
      />
    </div>
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex"
import ReceivedLetterCard from './ReceivedLetterCard';

export default {
  name: "LetterListReceived",
  components: {
    ReceivedLetterCard
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
  methods: {
    deleteLetter(letter) {
      const letterIndex = this.receivedLetters.findIndex((receivedLetter) => {
        return receivedLetter.letter.id === letter.id
      });
      this.receivedLetters.splice(letterIndex, 1);
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
