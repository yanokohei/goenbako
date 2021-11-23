<template>
  <v-dialog
    max-width="600"
    v-model="isVisibleShareLinkModal"
    @click:outside="handleCloseModal"
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <span class="text-h5 my-5">Myご縁箱をシェアする</span>
      </v-card-title>
      <v-divider></v-divider>
      <v-col class="text-center mt-8">
        <v-btn
          color="blue"
          class="white--text"
          x-large
          :href="twitterShare()"
        >
        <v-icon>mdi-twitter</v-icon>
          ツイートで共有する
        </v-btn>
      </v-col>
      <v-col class="text-center mt-8">
        <v-btn
          color="grey lighten-1"
          x-large
          @click.prevent="copyLink"
          @click="snackbar = true"
        >
          <v-icon>mdi-content-copy</v-icon>
          URLをコピーする
        </v-btn>
        <v-snackbar
          v-model="snackbar"
          top
          timeout="1000"
          light
          scroll-y-transition
          rounded="xl"
        >
          コピーしました。
          <template v-slot:action="{ attrs }">
            <v-btn
              v-bind="attrs"
              @click="snackbar = false"
            >
              <v-icon>mdi-close</v-icon>
            </v-btn>
          </template>
        </v-snackbar>
      </v-col>
        <v-row justify="center" class="ma-8">
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
  name: "ShareLinkModal",
  data() {
    return {
      snackbar: false,
    };
  },
  props: {
    isVisibleShareLinkModal: {
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
    copyLink() {
      const url = `${location.origin}/${this.currentUser.id}`
      navigator.clipboard.writeText(url)
        .then((res) => {
        return;
      })
    },
    twitterShare() {
      const url = `${location.origin}/${this.currentUser.id}`
      return `https://twitter.com/share?text=${this.currentUser.name}さんのご縁箱です！%0aファンレターを書いてみよう！&url=${url}&hashtags=ご縁箱`;
    },
  }
};
</script>

<style scoped>
.modal {
  display: block;
}
.letter-item-input {
  color: rgb(27, 21, 21)
}
</style>
