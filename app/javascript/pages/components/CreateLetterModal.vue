<template>
  <v-dialog
    v-model="isVisibleCreateLetterModal"
    max-width="850"
    persistent
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <span class="pa-8 l-font">ファンレター作成</span>
      </v-card-title>
      <v-divider />
      <!-- フォーム全体をHTML要素で統括 -->
      <div class="pa-10">
        <!-- formタグでフォームデータを一括管理 -->
        <v-form @submit.prevent="handleCreateLetter(letter)">
          <div v-for="(letterTitle, index) in letterTitles()" :key="index">
            <div class="mt-8 m-font">
              <label
                for="past"
              >{{ letterTitle.message }}</label>
              <v-card-actions class="justify-center">
                <v-btn
                  v-if="!ShowTextarea.includes(index)"
                  @click="addShowTextarea(index)"
                  color="deep-purple lighten-5"
                  class="mt-4"
                >
                  <v-icon>mdi-pencil</v-icon>
                  書いてみる
                </v-btn>
              </v-card-actions>
              <v-col align="center">
                <v-textarea
                  v-show="ShowTextarea.includes(index)"
                  :id="`${letterTitle.model_name}`"
                  v-model="letter[letterTitle.model_name]"
                  :name="`create_letter[${letterTitle.model_name}]`"
                  background-color="white"
                  class="textarea-style"
                />
              </v-col>
            </div>
          </div>
          <!-- 登録ボタン -->
          <v-row
            justify="center"
            class="ma-8"
          >
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

export default {
  name: "CreateLetterModal",

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
      ShowTextarea: []
    }

  },
  computed: {
    ...mapGetters("users", ["currentUser"]),
  },
  methods: {
    letterTitles() {
      return [
        { message: '出会いのきっかけ・当時の印象', model_name: 'past' },
        { message: '現在の印象・どんな人？', model_name: 'current' },
        { message: '聞いてみたいこと／これから話してみたいこと', model_name: 'future' },
        { message: `${this.user.name}さんに期待していること`, model_name: 'expect' },
        { message: 'メッセージ', model_name: 'message' }
      ]
    },
    addShowTextarea(index) {
      this.ShowTextarea.push(index)
    },
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
.l-font{
  font-size: 1.8em;
  font-weight: bold;
  color: #2c281e;
}
.m-font{
  font-size: 1.2em;
  font-weight: bold;
  color: #2c281e;
}
.s-font{
  font-size: 1.1em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.textarea-style{
  line-height: 1.7;
  font-size:1.2em;
  width: 90%;
}
</style>
