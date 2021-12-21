<template>
  <v-container>
    <div
      v-for="receivedLetter in receivedLetters"
      :key="receivedLetter.id"
    >
      <ReceivedLetterCard
        :user="user"
        :received-letter="receivedLetter"
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
  data() {
    return {
      isVisibleShareLetterModal: false,
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    deleteLetter() {
      this.$emit("delete-letter");
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
