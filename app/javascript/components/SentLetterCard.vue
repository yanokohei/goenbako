<template>
  <v-container>
    <keep-alive>
      <v-card
        flat
        color="#f1f1f1"
        rounded="xl"
        max-width="320"
      >
        <v-img
          src="/img/Dear.svg"
          max-width="45px"
          class="dear-position"
        />
        <v-img
          src="/img/Dear.svg"
          max-width="45px"
          class="dear-position"
        />
        <v-card-title class="pt-4 pb-0">
          <router-link :to="{ name: 'User', params: { twitter_id: sentLetter.receiver.twitter_id }}">
            <v-list-item-avatar class="pa-0 mr-2 ml-2" size="60">
              <img :src="sentLetter.receiver.image">
            </v-list-item-avatar>
          </router-link>
          <v-list-item-content class="pa-0">
            <v-list-item-title class="s-font">
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
          class="pt-0"
          :letter-items="sentLetter"
        />
        <v-row
          v-if="isCurrentMypage"
          justify="end"
          class="ma-4 mt-0"
        >
          <v-btn
            color="orange lighten-1"
            class="white--text ma-1"
            small
            @click="openEditLetterModal"
          >
            <v-icon>mdi-pencil</v-icon>
            編集
          </v-btn>
          <v-btn
            color="brown darken-1 ma-1"
            dark
            small
            @click="hundleDeleteLetter(sentLetter)"
          >
            <v-icon> mdi-delete </v-icon>
          </v-btn>
        </v-row>
      </v-card>
    </keep-alive>
    <transition name="fade">
      <EditLetterModal
        :is-visible-edit-letter-modal="isVisibleEditLetterModal"
        :user="user"
        :receiver="sentLetter.receiver"
        :updateLetter="sentLetter.letter"
        @close-modal="handleCloseEditLetterModal"
        @update-letter="handleUpdateLetter"
      />
    </transition>
  </v-container>
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
      letter_case: "sent_case"
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
      if (!confirm("削除してもよろしいですか?")) return;
      this.deleteLetter(sentLetter);
      this.$store.dispatch("flash/setFlash", {
        type: "success",
        message: "レターを削除しました。"
      });
    },
    deleteLetter(letterItem) {
      axios
        .delete(`/api/letters/${letterItem.letter.id}`, { params: { sent_case: this.letter_case } })
        .then((res) => this.$emit("delete-letter", res.data));
    },
    handleUpdateLetter() {
      this.$emit("update-letter");
    }
  },
};
</script>

<style scoped>
.s-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.dear-position {
  position: absolute;
  top: -3px;
  left: -2px;
}
</style>
