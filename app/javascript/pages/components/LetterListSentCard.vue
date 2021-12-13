<template>
  <v-container>
    <keep-alive>
      <v-card
        flat
        color="#f1f1f1"
        rounded="xl"
      >
        <v-card-title class="pt-6">
          <router-link :to="{ name: 'UserIndex', params: { twitter_id: sentLetter.receiver.twitter_id }}">
            <v-list-item-avatar class="pa-0" size="65">
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
          :user="user"
        />
        <v-row
          v-if="isCurrentMypage"
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
.s-font{
  font-size: 1.0em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
</style>
