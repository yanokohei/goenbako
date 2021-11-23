<template>
    <v-row class="ma-8" justify="center">
      <v-card
        flat
        color="brown lighten-5"
        width="800px"
        rounded="xl"
      >
        <v-card-title class="ps-16">
          <router-link :to="{ name: 'UserIndex', params: { id: currentUser.id }}">
            <v-list-item-avatar size="50">
              <img :src="currentUser.image">
            </v-list-item-avatar>
          </router-link>
            <v-list-item-content>
              <v-list-item-title class="font-bold">{{ currentUser.name }}</v-list-item-title>
              <v-list-item-subtitle>
                @{{ currentUser.twitter_id }}
                <v-btn icon color="blue" :href="twitterUrl">
                  <v-icon>mdi-twitter</v-icon>
                </v-btn>
              </v-list-item-subtitle>
            </v-list-item-content>
        </v-card-title>

        <LetterItem
          :letter-items="letterItems"
          :user="user"
        />
      <v-col class="text-center">
        <v-btn
          color="blue"
          class="white--text"
          small
          @click="openShareLetterModal"
        >
        <v-icon>mdi-twitter</v-icon>
          レターを共有する
        </v-btn>
      </v-col>

    <transition name="fade">
        <ShareLetterModal
          :is-visible-share-letter-modal="isVisibleShareLetterModal"
          @close-modal="handleCloseShareLetterModal"
      />
    </transition>
      </v-card>
    </v-row>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import LetterItem from '../components/LetterItem';
import ShareLetterModal from "../components/ShareLetterModal";

export default {
  components: {
    LetterItem,
    ShareLetterModal,
  },
  data() {
    return {
      isVisibleShareLetterModal: false,
    };
  },
  props: {
    letterItems: {
      type: Object,
      required: true
    },
    user: {
      type: Object,
      required: true
    },
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    twitterUrl() {
      return `https://twitter.com/${this.currentUser.twitter_id}`
    }
  },
  methods: {
    openShareLetterModal() {
      this.isVisibleShareLetterModal = true;
    },
    handleCloseShareLetterModal() {
      this.isVisibleShareLetterModal = false;
    },
  },
}
</script>

<style scoped>
</style>
