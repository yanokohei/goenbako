<template>
  <v-container>
    <v-row
      class="ma-8"
      justify="center"
    >
      <v-card
        flat
        color="amber lighten-5"
        width="800px"
        rounded="xl"
      >
        <v-card-title class="ps-16">
          <router-link :to="{ name: 'UserIndex', params: { id: user.id }}">
            <v-list-item-avatar size="50">
              <img :src="user.image">
            </v-list-item-avatar>
          </router-link>
          <v-list-item-content>
            <v-list-item-title class="font-bold">
              {{ user.name }}
            </v-list-item-title>
            <v-list-item-subtitle>
              @{{ user.twitter_id }}
              <v-btn
                icon
                color="blue"
                :href="twitterUrl"
              >
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
            シェア
          </v-btn>
        </v-col>
      </v-card>
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
import LetterItem from '../components/LetterItem';
import ShareLetterModal from "./ShareLetterModal";

export default {
  components: {
    ShareLetterModal,
    LetterItem
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    letterItems: {
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
};
</script>

<style scoped>
</style>
