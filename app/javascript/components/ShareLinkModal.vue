<template>
  <v-dialog
    v-model="isVisibleShareLinkModal"
    max-width="320"
    @click:outside="handleCloseModal"
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <v-img
          max-width="18"
          src="/img/icon_parts.svg"
        />
        <span class="my-2 ml-2 m-font nowrap">  Myご縁箱をシェアする</span>
      </v-card-title>
      <div align="center">
        <v-img
          max-width="270"
          height="5"
          class="tranceparent"
          src="/img/en_line_top.svg"
        />
      </div>
      <v-img
        max-width="55"
        class="letter-position tranceparent"
        src="/img/triple_letter.svg"
      />
      <v-col class="text-center mt-4">
        <v-btn
          color="blue"
          class="white--text s-font"
          small
          :href="twitterShare()"
        >
          <v-icon>mdi-twitter</v-icon>
          ツイートで共有する
        </v-btn>
      </v-col>
      <v-col class="text-center mt-4">
        <v-btn
          class="s-font"
          color="#FFF0E2"
          small
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
        class="ma-4 py-2"
      >
        <v-img
          max-width="270"
          height="6"
          class="tranceparent mb-1"
          src="/img/en_line_under.svg"
        />
        <v-card-actions>
          <v-btn
            small
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
      %0aさっそく遊びに行ってみよう♪%0a°˖✧%23ご縁箱%20%23みんなのご縁箱✧˖°%0a&url=${url}`;
    },
  }
};
</script>

<style scoped>
.modal {
  display: block;
}
.m-font{
  font-size: 0.9em;
  font-weight: bold;
  line-height: 1.0;
  color: #2c281e;
}
.s-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.tranceparent{
  mix-blend-mode: multiply;
}
.letter-position{
  position: absolute;
  top: 190px;
  left: 215px;
}
.nowrap{
  white-space: nowrap
}
</style>
