<template>
  <v-card
    color="#FFFFF8"
    flat
  >
    <keep-alive>
      <v-row>
        <v-card
          flat
          color="#f1f1f1"
          rounded="xl"
          class="my-8"
        >
          <v-card-title class="ps-16">
            <router-link :to="{ name: 'UserIndex', params: { twitter_id: sentLetter.receiver.twitter_id }}">
              <v-list-item-avatar size="">
                <img :src="sentLetter.receiver.image">
              </v-list-item-avatar>
            </router-link>
            <v-list-item-content>
              <v-list-item-title>
                {{ sentLetter.receiver.name }}
              </v-list-item-title>
              <v-list-item-subtitle>
                @{{ sentLetter.receiver.twitter_id }}
                <v-btn
                  icon
                  color="blue"
                  :href="`https://twitter.com/${sentLetter.receiver.twitter_id}`"
                >
                  <v-icon>mdi-twitter</v-icon>
                </v-btn>
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-card-title>
          <LetterItem
            :letter-items="sentLetter"
            :user="user"
          />
          <v-row
            justify="end"
            class="ma-4"
          >
            <v-btn
              color="orange"
              class="white--text"
              small
              @click="openEditLetterModal"
            >
              <v-icon>mdi-pencil</v-icon>
              編集
            </v-btn>
            <v-btn
              color="indigo"
              class="white--text"
              small
              @click="hundleDeleteLetter(sentLetter)"
            >削除
            </v-btn>
          </v-row>
        </v-card>
      </v-row>
    </keep-alive>
    <transition name="fade">
      <EditLetterModal
        :is-visible-edit-letter-modal="isVisibleEditLetterModal"
        :user="user"
        :updateLetter="sentLetter.letter"
        @close-modal="handleCloseEditLetterModal"
        @update-letter="handleUpdateLetter"
      />
    </transition>
  </v-card>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import LetterItem from '../components/LetterItem';
import EditLetterModal from "../components/EditLetterModal";

export default {
  components: {
    LetterItem,
    EditLetterModal
  },
  data() {
    return {
      isVisibleEditLetterModal: false,
    }
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    sentLetter: {
      type: Object,
      required: true
    }
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    isCurrentMypage() {
      return this.$route.path === '/mypage'
    }
  },
  methods: {
    openEditLetterModal() {
      this.isVisibleEditLetterModal = true;
    },
    handleCloseEditLetterModal() {
      this.isVisibleEditLetterModal = false;
    },
    hundleDeleteLetter(sentLetter) {
      if (!confirm("削除してよろしいですか?")) return;
      this.deleteLetter(sentLetter);
      this.$store.dispatch("flash/setFlash", {
        type: "success",
        message: "レターを削除しました。"
      });
    },
    deleteLetter(letterItem) {
      axios
        .delete(`/api/letters/${letterItem.letter.id}`)
        .then(() => this.$emit("delete-letter"));
    },
    handleUpdateLetter() {
      this.$emit("update-letter");
    }
  },
};
</script>

<style scoped>
</style>
