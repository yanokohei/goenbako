<template>
  <v-dialog
    v-model="isVisibleShareLetterModal"
    @click:outside="handleCloseModal"
    max-width="500"
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <span class="m-font">レターをシェアする</span>
        <v-icon>mdi-email-edit-outline</v-icon>
      </v-card-title>
      <v-divider />
      <!-- シェア項目1 -->
      <v-col class="text-center mt-4">
        <label
          class="s-font"
          for="past"
        >出会いのきっかけ・当時の印象</label>
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            x-small
            :href="twitterShare()"
          >
            <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
      </v-col>
      <!-- シェア項目2 -->
      <v-col class="text-center">
        <label
          class="s-font"
          for="current"
        >現在の印象・どんな人？</label>
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            x-small
            href="http://127.0.0.1:3000/users/2"
          >
            <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
      </v-col>
      <!-- シェア項目3 -->
      <v-col class="text-center">
        <label
          class="s-font"
          for="future"
        >聞いてみたいこと／これから話してみたいこと</label>
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            x-small
            href="http://127.0.0.1:3000/users/2"
          >
            <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
      </v-col>
      <!-- シェア項目4 -->
      <v-col class="text-center">
        <label
          class="s-font"
          for="expect"
        >〇〇さんに期待していること</label>
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            x-small
            href="http://127.0.0.1:3000/users/2"
          >
            <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
      </v-col>
      <!-- シェア項目5 -->
      <v-col class="text-center">
        <label
          class="s-font"
          for="message"
        >メッセージ</label>
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            x-small
            href="http://127.0.0.1:3000/users/2"
          >
            <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
      </v-col>
      <!-- 閉じる -->
      <v-row
        justify="center"
        class="ma-4"
      >
        <v-card-actions>
          <v-btn
            large
            @click="handleCloseModal"
          >
            閉じる
          </v-btn>
        </v-card-actions>
      </v-row>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex"

export default {
  name: "ShareLetterModal",
  props: {
    isVisibleShareLetterModal: {
      type: Boolean,
      required: true,
    },
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    },
    twitterShare() {
      const url = `${location.origin}/${this.currentUser.twitter_id}`
      return `https://twitter.com/share?text=${this.currentUser.name}さんのご縁箱です！%0aファンレターを書いてみよう！&url=${url}&hashtags=ご縁箱`;
    },
  },
};
</script>

<style scoped>
.modal {
  display: block;
}
.m-font{
  font-size: 1.1em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.s-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
</style>
