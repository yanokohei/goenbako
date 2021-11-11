<template>
  <v-dialog
    max-width="600"
    v-model="isVisibleCreateLetterModal"
    persistent
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <span class="text-h5 my-5">ファンレター作成</span>
      </v-card-title>
      <v-divider></v-divider>
<!-- // フォーム全体をHTML要素で統括 -->
      <div
        id="create-letter-form"
        class="pa-10"
      >
<!-- formタグでフォームデータを一括管理 -->
        <v-form>
          <div class="mt-5">
            <label
              class="letter-item-label"
              for="past"
            >出会いのきっかけ・当時の印象</label>
            <v-textarea
              id="past"
              v-model="letter.past"
              class="letter-item-input"
              name="create_letter[past]"
              background-color="white"
            />
          </div>
<!-- フォーム内の１要素の区切り目 -->
          <div class="mt-5">
            <label
              class="letter-item-label"
              for="current"
            >現在の印象・どんな人？</label>
            <v-textarea
              id="current"
              v-model="letter.current"
              class="letter-item-input"
              name="create_letter[current]"
              background-color="white"
            />
          </div>
          <div class="mt-5">
            <label
              class="letter-item-label"
              for="future"
            >聞いてみたいこと／これから話してみたいこと</label>
            <v-textarea
              id="future"
              v-model="letter.future"
              class="letter-item-input"
              name="create_letter[future]"
              background-color="white"
            />
          </div>
          <div class="mt-5">
            <label
              class="letter-item-label"
              for="expect"
            >`${user.name}さんに期待していること`</label>
            <v-textarea
              id="expect"
              v-model="letter.expect"
              class="letter-item-input"
              name="create_letter[expect]"
              type="text"
              background-color="white"
            />
          </div>
          <div class="mt-5">
            <label
              class="letter-item-label"
              for="message"
            >メッセージ</label>
            <v-textarea
              id="message"
              v-model="letter.message"
              name="create_letter[message]"
              background-color="white"
            />
          </div>
<!-- 登録ボタン -->
          <v-row justify="center" class="ma-8">
            <v-card-actions>
              <v-btn
                type="submit"
                elevation="4"
                x-large
                color="blue"
                class="white--text"
                @click="handleCreateLetter"
              >
                登録する
              </v-btn>
              <v-btn
                large
                @click="handleCloseModal"
              >
                閉じる
              </v-btn>
            </v-card-actions>
          </v-row>
        </v-form>
      </div>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "axios";
import { mapActions, mapState } from "vuex";

export default {
  name: "CreateLetterModal",
  props: {
    isVisibleCreateLetterModal: {
      type: Boolean,
      required: true,
    },
  },
  data() {
    return {
      letter: {
        past: "",
        current: "",
        future: "",
        expect: "",
        message: "",
      },
    };
  },
  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    },

    handleCreateLetter() {
      this.$emit("create-letter", this.letter);
    },
  },
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
