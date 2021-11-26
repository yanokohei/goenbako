<template>
  <v-row
    class="ma-8"
    justify="center"
  >
    <v-card
      flat
      color="brown lighten-5"
      width="800px"
      rounded="xl"
    >
      <v-card-title class="ps-16">
        <v-list-item-content>
          <v-list-item-title class="font-bold">
            {{ currentUser.name }}
          </v-list-item-title>
            <v-btn
              icon
              color="blue"
            >
              <v-icon>mdi-twitter</v-icon>
            </v-btn>
        </v-list-item-content>
      </v-card-title>

      <v-col class="text-center">
        <v-btn
          color="blue"
          class="white--text"
          small
          @click="openUpdateLetterModal"
        >
          <v-icon>mdi-twitter</v-icon>
          レターを修正する
        </v-btn>
      </v-col>

      <!-- <transition name="fade">
        <UpdateLetterModal
          :is-visible-update-letter-modal="isVisibleUpdateLetterModal"
          @close-modal="handleCloseUpdateLetterModal"
        />
      </transition> -->
    </v-card>
  </v-row>
</template>

<script>
import { mapGetters } from "vuex";
// import UpdateLetterModal from "../components/UpdateLetterModal";

export default {
  // components: {
  //   openUpdateLetterModal
  // },
  props: {
    user: {
      type: Object,
      required: true
    },
  },
  data() {
    return {
      isVisibleUpdateLetterModal: false,
    };
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
  },
}
</script>

<style scoped>
</style>
