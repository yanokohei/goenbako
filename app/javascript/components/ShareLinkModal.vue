<template>
  <v-dialog
    v-model="isVisibleShareLinkModal"
    max-width="320"
    @click:outside="handleCloseModal"
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <span class="my-2 m-font">Myご縁箱をシェアする</span>
      </v-card-title>
      <v-divider />
      <v-col class="text-center mt-8">
        <v-btn
          color="blue"
          class="white--text s-font"
          large
          :href="twitterShare()"
        >
          <v-icon>mdi-twitter</v-icon>
          ツイートで共有する
        </v-btn>
      </v-col>
      <v-col class="text-center mt-6">
        <v-btn
          class="s-font"
          color="#FFF0E2"
          large
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
          <template #action="{ attrs }">
            <v-btn
              v-bind="attrs"
              @click="snackbar = false"
            >
              <v-icon>mdi-close</v-icon>
            </v-btn>
          </template>
        </v-snackbar>
      </v-col>
      <v-row
        justify="center"
        class="ma-8"
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
  name: "ShareLinkModal",
  props: {
    isVisibleShareLinkModal: {
      type: Boolean,
      required: true,
    },
  },
  data() {
    return {
      snackbar: false,
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    },
    copyLink() {
      const url = `${location.origin}/${this.currentUser.twitter_id}`
      navigator.clipboard.writeText(url)
        .then((res) => {
        return;
      })
    },
    twitterShare() {
      const url = `${location.origin}/${this.currentUser.twitter_id}`
      return `https://twitter.com/intent/tweet?text=${this.currentUser.name}さんがご縁箱を開設したよ！
      %0aさっそく遊びに行ってみよう♪&url=${url}%0a°˖✧&hashtags=ご縁箱&hashtags=みんなのご縁箱✧˖°`;
    },
  }
};
</script>

<style scoped>
.modal {
  display: block;
}
.m-font{
  font-size: 1.0em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.s-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
</style>
