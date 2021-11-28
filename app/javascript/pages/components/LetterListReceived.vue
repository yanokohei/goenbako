<template>
  <v-container class="pa-0">
    <div
      v-for="letterItem in letterItems"
      :key="letterItem.id"
    >
      <v-card
        color="#FFFEF6"
        flat
      >
        <keep-alive>
          <v-row
            class="ma-8"
            justify="center"
          >
            <v-card
              flat
              color="#f5f3f2"
              width="800px"
              rounded="xl"
            >
              <v-card-title class="ps-16">
                <router-link :to="{ name: 'UserIndex', params: { id: letterItem.sender.id }}">
                  <v-list-item-avatar size="50">
                    <img :src="letterItem.sender.image">
                  </v-list-item-avatar>
                </router-link>
                <v-list-item-content>
                  <v-list-item-title class="font-bold">
                    {{ letterItem.sender.name }}
                  </v-list-item-title>
                  <v-list-item-subtitle>
                    @{{ letterItem.sender.twitter_id }}
                    <v-btn
                      icon
                      color="blue"
                      :href="`https://twitter.com/${letterItem.sender.twitter_id}`"
                    >
                      <v-icon>mdi-twitter</v-icon>
                    </v-btn>
                  </v-list-item-subtitle>
                </v-list-item-content>
              </v-card-title>
              <LetterItem
                :letter-items="letterItem"
                :sent-letters="letterItem"
                :user="user"
              />
              <v-row
                justify="end"
                class="ma-4"
              >
                <v-btn
                  v-if="isCurrentMypage"
                  color="blue"
                  class="white--text"
                  small
                  @click="openShareLetterModal"
                >
                  <v-icon>mdi-twitter</v-icon>
                  シェア
                </v-btn>
                <v-btn
                  v-if="isCurrentMypage"
                  tile
                  small
                  color="brown darken-1"
                  dark
                  @click="hundleDeleteLetter(letterItem)"
                >
                  <v-icon> mdi-delete </v-icon>
                </v-btn>
              </v-row>
            </v-card>
          </v-row>
        </keep-alive>
      </v-card>
    </div>
    <transition name="fade">
      <ShareLetterModal
        :is-visible-share-letter-modal="isVisibleShareLetterModal"
        @close-modal="handleCloseShareLetterModal"
      />
    </transition>
  </v-container>
</template>

<script>
import axios from "axios";
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
    isCurrentMypage() {
      return this.$route.path === '/mypage'
    }
  },
  methods: {
    openShareLetterModal() {
      this.isVisibleShareLetterModal = true;
    },
    handleCloseShareLetterModal() {
      this.isVisibleShareLetterModal = false;
    },
    hundleDeleteLetter(letterItem) {
      if (!confirm("削除してよろしいですか?")) return;
      this.deleteLetter(letterItem);
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
