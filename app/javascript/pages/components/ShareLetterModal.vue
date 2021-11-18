<template>
  <v-dialog
    max-width="600"
    v-model="isVisibleShareLetterModal"
    @click:outside="handleCloseModal"
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <span class="text-h5 my-5 mr-2">レターをシェアする</span>
        <v-icon>mdi-email-edit-outline</v-icon>
      </v-card-title>
      <v-divider></v-divider>
<!-- シェア項目1 -->
      <v-col class="text-center mt-8">
        <label
          class="letter-item-label"
          for="past"
        >出会いのきっかけ・当時の印象</label>
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            small
            href="http://127.0.0.1:3000/users/2"
          >
          <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
      </v-col>
<!-- シェア項目2 -->
      <v-col class="text-center mt-8">
        <label
          class="letter-item-label"
          for="current"
        >現在の印象・どんな人？</label>
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            small
            href="http://127.0.0.1:3000/users/2"
          >
          <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
      </v-col>
<!-- シェア項目3 -->
      <v-col class="text-center mt-8">
        <label
          class="letter-item-label"
          for="future"
        >聞いてみたいこと／これから話してみたいこと</label>
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            small
            href="http://127.0.0.1:3000/users/2"
          >
          <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
      </v-col>
<!-- シェア項目4 -->
      <v-col class="text-center mt-8">
        <label
          class="letter-item-label"
          for="expect"
        >〇〇さんに期待していること</label>
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            small
            href="http://127.0.0.1:3000/users/2"
          >
          <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
      </v-col>
<!-- シェア項目5 -->
      <v-col class="text-center mt-8">
        <label
          class="letter-item-label"
          for="message"
        >メッセージ</label>
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            small
            href="http://127.0.0.1:3000/users/2"
          >
          <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
      </v-col>
<!-- 閉じる -->
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

export default {
  name: "ShareLetterModal",
  props: {
    isVisibleShareLetterModal: {
      type: Boolean,
      required: true,
    },
  },

  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    },
  },
};
</script>

<style scoped>
.modal {
  display: block;
}
.letter-item-label {
  font-size: 20px;
  font-weight: 600;
}
</style>
