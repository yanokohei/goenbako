<template>
<v-container>
    <v-row class="ma-12" justify="center">
      <v-card
        flat

        width="800px"
        rounded="xl"
      >
        <v-card-title class="ps-16">
         受け取ったレター／送ったレター
        </v-card-title>

      </v-card>
<!-- お試し設置--------------------------->
      <v-col class="text-center mt-8">
        <v-btn
          color="blue"
          class="white--text"
          x-large
          @click="openShareLetterModal"
        >
        <v-icon>mdi-twitter</v-icon>
          ツイートで共有する
        </v-btn>
      </v-col>
    </v-row>
    <transition name="fade">
        <ShareLetterModal
          :is-visible-share-letter-modal="isVisibleShareLetterModal"
          @close-modal="handleCloseShareLetterModal"
      />
    </transition>
  </v-container>
</template>

<script>
import { mapGetters } from "vuex"
import ShareLetterModal from "./ShareLetterModal";

export default {
  components: {
    ShareLetterModal,
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
    openShareLetterModal() {
      this.isVisibleShareLetterModal = true;
    },
    handleCloseShareLetterModal() {
      this.isVisibleShareLetterModal = false;
    },
  },
};
</script>

<style scoped>
</style>
