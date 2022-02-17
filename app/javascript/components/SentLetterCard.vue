<template>
  <v-container>
    <keep-alive>
      <v-card
        flat
        color="#f1f1f1"
        rounded="xl"
        max-width="320"
        class="sent-letter-card"
      >
        <!-- 画像１枚の場合、SVGの表示が消える。要改善 -->
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
          <v-list-item-avatar class="pa-0 ma-0" />
          <v-list-item-content class="pa-0">
            <v-list-item-title class="s-font">
              {{ sentLetter.receiver.name }}
            </v-list-item-title>
            <v-list-item-subtitle>
              @{{ sentLetter.receiver.twitter_id }}
              <v-btn
                icon
                color="blue"
                @click="moveTwitterUserPage()"
              >
                <v-icon>mdi-twitter</v-icon>
              </v-btn>
            </v-list-item-subtitle>
          </v-list-item-content>
          <v-img
            src="/img/en_line_top.svg"
            max-width="100px"
            height="4px"
            class="en-line-top-position"
          />
        </v-card-title>
        <div class="pa-0 flex-icon">
          <router-link :to="{ name: 'User', params: { twitter_id: sentLetter.sender.twitter_id }}">
            <v-list-item-avatar class="pa-0 pb-0 mr-2 ml-8" size="50">
              <img :src="sentLetter.sender.image">
            </v-list-item-avatar>
          </router-link>
          <v-img
            class="tranceparent mx-3"
            src="/img/to_right_yellow.svg"
            max-width="60px"
          />
          <router-link :to="{ name: 'User', params: { twitter_id: sentLetter.receiver.twitter_id }}">
            <v-list-item-avatar class="pa-0 pb-0 mr-8 ml-2" size="50">
              <img :src="sentLetter.receiver.image">
            </v-list-item-avatar>
          </router-link>
          <v-img
            src="/img/en_line_under.svg"
            max-width="110px"
            height="4px"
            class="en-line-under-position"
          />
        </div>
        <LetterItem
          class="pt-0"
          :letter-items="sentLetter"
        />
        <v-row
          v-if="isCurrentMypage"
          justify="end"
          class="ma-4 mt-0 pb-1"
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
        :update-letter="sentLetter.letter"
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
  data() {
    return {
      isVisibleEditLetterModal: false,
      letter_case: "sent_case"
    }
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    isCurrentMypage() {
      return this.$route.path === '/me/home'
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
    },
    moveTwitterUserPage() {
      window.open(`https://twitter.com/${this.sentLetter.receiver.twitter_id}`, '_blank')
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
.from-font{
  font-size: 0.6em;
}
.sender-area {
  position: absolute;
  top: 90px;
  left: 20px;
  border-radius:10px;
  width: 100px;
  height: 50px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.en-line-top-position {
  mix-blend-mode: multiply;
  position: absolute;
  top: 65px;
  left: 15px;
  opacity: 0.5;
}
.en-line-under-position {
  mix-blend-mode: multiply;
  position: absolute;
  top: 135px;
  left: 160px;
  opacity: 0.5;
}
.sent-letter-card{
  outline: 30px solid#FFFFF8
}
.flex-icon {
  display: flex;
  justify-content: center;
  align-items: center;
}
.tranceparent{
  mix-blend-mode: multiply;
}
</style>
