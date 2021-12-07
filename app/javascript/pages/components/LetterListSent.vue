<template>
  <v-container class="pa-0">
    <div
      v-for="sentLetter in sentLetters"
      :key="sentLetter.id"
    >
<!-- 送ったレターの数だけ更新モーダルの表示が発生して無限に処理が繰り返されるためコンポーネントで処理を分断 -->
      <LetterListSentCard
        :user="user"
        :sentLetter="sentLetter"
      />
    </div>
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import LetterListSentCard from './LetterListSentCard';

export default {
  components: {
    LetterListSentCard
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
    hundleDeleteLetter(sentLetters) {
      if (!confirm("削除してよろしいですか?")) return;
      this.deleteLetter(sentLetters);
      this.$store.dispatch("flash/setFlash", {
        type: "success",
        message: "レターを削除しました。",
      });
    },
    deleteLetter(letterItem) {
      axios
        .delete(`/api/letters/${letterItem.letter.id}`)
        .then(() => this.$emit("delete-letter"));
    },
  },
};
</script>

<style scoped>
</style>
