<template>
  <v-dialog
    v-model="isVisibleCreateLetterModal"
    persistent
    max-width="500"
    scrollable
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <v-icon>mdi-email-edit-outline</v-icon>
        <span class="m-font">ファンレター作成</span>
      </v-card-title>
      <v-divider />
      <p class="xs-font mt-2 mb-6 mx-4">
        ※それぞれ100文字以内で自由にご記入ください。
      </p>
      <div class="mx-4">
        <v-form @submit.prevent="handleCreateLetter(letter)">
          <v-card-text
            class="pa-0 show-scrollbar"
            style="height: 340px;"
          >
            <div
              v-for="(letterTitle, index) in letterTitles()"
              :key="index"
            >
              <div class="mt-0 s-font">
                <label
                  for="past"
                >{{ letterTitle.message }}</label>
                <v-card-actions
                  v-if="!ShowTextarea.includes(index)"
                  class="justify-center"
                >
                  <v-btn
                    color="deep-purple lighten-5"
                    x-small
                    @click="addShowTextarea(index)"
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
                    counter
                    :rules="rules"
                    rows="2"
                    auto-grow
                    class="textarea mt-0 pt-0"
                  />
                </v-col>
              </div>
            </div>
          </v-card-text>
          <!-- 登録ボタン -->
          <v-row
            justify="center"
            class="my-0 pb-3"
          >
            <v-card-actions>
              <v-btn
                type="submit"
                large
                color="blue"
                class="white--text pr-3 s-font"
              >
                レターを送る
              </v-btn>
              <v-btn
                large
                class="s-font pr-3"
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
      ShowTextarea: [],
      rules: [v => v.length <= 100 || '100文字以内で入力してください。'],
    }

  },
  computed: {
    ...mapGetters("users", ["currentUser"]),
  },
  methods: {
    letterTitles() {
      return [
        { message: '出会った当時の印象／エピソード', model_name: 'past' },
        { message: '現在の印象／どんな人？', model_name: 'current' },
        { message: '聞いてみたいこと／これから話してみたいこと', model_name: 'future' },
        { message: `${this.user.name}さんに期待していること`, model_name: 'expect' },
        { message: 'メッセージ', model_name: 'message' }
      ]
    },
    addShowTextarea(index) {
      this.ShowTextarea.push(index)
    },
    handleCloseModal() {
      this.clearTextArea()
      this.ShowTextarea = []
      this.isShowTextarea = false
      this.isShowThisButton = true;
      this.$emit("close-modal");
    },
    handleCreateLetter() {
      this.letter.sender_id = this.currentUser.id
      this.letter.receiver_id = this.user.id
      axios
      .post("/api/letters", { letter: this.letter })
      .then((res) => {
          this.$emit("create-letter", res.data);
          this.handleCloseModal();
          this.clearTextArea();
          this.$store.dispatch("flash/setFlash", {
            type: "success",
            message: "レターを作成しました。"
          })
      })
      .catch((error) => {
        this.$store.dispatch("flash/setFlash", {
          type: 'error',
          message: 'レターを作成できませんでした',
        })
      })
    },
    handleShowTextarea() {
      this.isShowTextarea = true
      this.isShowThisButton = false;
    },
    clearTextArea() {
      this.letter.past = "",
      this.letter.current = "",
      this.letter.future = "",
      this.letter.expect = "",
      this.letter.message = ""
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
  font-size: 0.7em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.xs-font{
  font-size: 0.5em;
  font-weight: lighter;
  line-height: 1;
  color: #2c281e;
}
.textarea{
  line-height: 1;
  color: #2c281e;
}
.show-scrollbar {
  overflow-y: scroll !important;
}
.show-scrollbar::-webkit-scrollbar {
  display:none;
}
</style>
