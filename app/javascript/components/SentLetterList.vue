<template>
  <v-container>
    <div
      v-for="sentLetter in sentLetters"
      :key="sentLetter.id"
    >
<!-- 送ったレターの数だけ更新モーダルの表示が発生して無限に処理が繰り返されるためコンポーネントで処理を分断 -->
      <SentLetterCard
        :user="user"
        :sentLetter="sentLetter"
        @update-letter="handleUpdateLetter"
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
    deleteLetter() {
      this.$emit("delete-letter");
    },
    handleUpdateLetter() {
      this.$emit("update-letter");
    }
  },
};
</script>

<style scoped>
</style>
