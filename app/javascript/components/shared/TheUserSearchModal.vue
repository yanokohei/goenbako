<template>
  <v-row jusify-center>
    <v-dialog
      v-model="isVisibleUserSearchModal"
      max-width="500"
      @click:outside="handleCloseModal"
    >
      <v-card color="amber lighten-5">
        <h3 class="ma-4">
          <span class="my-5">ユーザー検索</span>
          <v-divider />
        </h3>
        <v-card-text class="mt-5">
          <v-text-field
            background-color="#FFFFF0"
            v-model="searchID"
            label="TwitterID検索"
            persistent-hint
            outlined
            dense
            placeholder="@を省略して入力ください"
            class="ma-0 mb-0 pb-0"
          />
          <v-card-actions class="justify-center pt-0">
            <v-btn
              small
              @click="searchUser"
            >
              <v-icon>mdi-magnify</v-icon>検索
            </v-btn>
          </v-card-actions>
        </v-card-text>
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
  </v-row>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex"

export default {
  name: "TheUserSearchModal",
  props: {
    isVisibleUserSearchModal: {
      type: Boolean,
      required: true,
    },
  },
  data() {
    return {
      searchID: "",
      resultData: "",
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    searchUser() {
      await axios.get(`/api/letters/${this.$route.params.letter_id}`)
      .then((res) => {
        this.resultData = res.data
      })
    },
    handleCloseModal() {
      this.$emit("close-modal");
    },
    twitterShare() {
      const url = `${location.origin}/${this.currentUser.twitter_id}`
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
