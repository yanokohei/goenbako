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
        <v-form @submit.prevent="handleCreateLetter(letter)">
          <div class="mt-5">
            <label
              for="past"
            >出会いのきっかけ・当時の印象</label>
            <ShowTextareaButton
              v-show="isShowThisButton"
              @show-textarea="handleShowTextarea"
              :is-show-textarea="isShowTextarea"
              :is-show-this-button="isShowThisButton"
            />
            <v-textarea
              id="past"
              v-show="isShowTextarea"
              v-model="letter.past"
              name="create_letter[past]"
              background-color="white"
            />
          </div>
<!-- フォーム内の１要素の区切り目 -->
          <div class="mt-5">
            <label
              for="current"
            >現在の印象・どんな人？</label>
            <v-textarea
              id="current"
              v-model="letter.current"
              name="create_letter[current]"
              background-color="white"
            />
          </div>
          <div class="mt-5">
            <label
              for="future"
            >聞いてみたいこと／これから話してみたいこと</label>
            <v-textarea
              id="future"
              v-model="letter.future"
              name="create_letter[future]"
              background-color="white"
            />
          </div>
          <div class="mt-5">
            <label
              for="expect"
            >{{ user.name }}さんに期待していること</label>
            <v-textarea
              id="expect"
              v-model="letter.expect"
              name="create_letter[expect]"
              type="text"
              background-color="white"
            />
          </div>
          <div class="mt-5">
            <label
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
import { mapGetters } from "vuex";
import ShowTextareaButton from "./ShowTextareaButton";

export default {
  name: "CreateLetterModal",
  components: {
    ShowTextareaButton,
  },
  props: {
    isVisibleCreateLetterModal: {
      type: Boolean,
      required: true,
    },
    user: {
      type: Object,
      required: true
    },
  },
  data() {
    return {
      letter: {
        sender_id: "",
        receiver_id: "",
        past: "",
        current: "",
        future: "",
        expect: "",
        message: "",
      },
      isShowTextarea: false,
      isShowThisButton: true,
      // isShowTextarea: {
      //   textarea1: false,
      //   textarea2: false,
      //   textarea3: false,
      //   textarea4: false,
      //   textarea5: false
      // }
    }

  },
  computed: {
    ...mapGetters("users", ["currentUser"]),
  },
  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    },
    handleCreateLetter() {
      this.letter.sender_id = this.currentUser.id
      this.letter.receiver_id = this.$route.params.id
      axios
        .post("/api/letters", { letter: this.letter })
        .then((res) => this.$emit("create-letter", res.data));
        this.handleCloseModal();
    },
    handleShowTextarea() {
      this.isShowTextarea = true
      this.isShowThisButton = false;
    }
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
