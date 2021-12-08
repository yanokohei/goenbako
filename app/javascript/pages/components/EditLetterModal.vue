<template>
  <v-dialog
    v-model="isVisibleEditLetterModal"
    max-width="850"
    persistent
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <span class="pa-8 l-font">レターの更新</span>
      </v-card-title>
      <v-divider />
      <div class="pa-10">
        <v-form @submit.prevent="handleUpdateLetter(letter)">
          <div v-for="(letterTitle, index) in letterTitles()" :key="index">
            <div class="mt-8 m-font">
              <label
                for="past"
              >{{ letterTitle.message }}</label>
              <v-col align="center">
                <v-textarea
                  :id="`${letterTitle.model_name}`"
                  v-model="letter[letterTitle.model_name]"
                  :name="`letter[${letterTitle.model_name}]`"
                  background-color="white"
                  class="textarea-style"
                  rows="4"
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
                更新する
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
  name: "EditLetterModal",

  props: {
    isVisibleEditLetterModal: {
      type: Boolean,
      required: true,
    },
    user: {
      type: Object,
      required: true
    },
    updateLetter: {
      type: Object,
      required: true,
    }
  },
  computed: {
    updateLetterItem() {
      return this.updateLetter
    }
  },
  data() {
    return { // propsのオブジェクトをそのまま渡すと参照渡しとなり、propsと連動してしまい、モーダルの外の値が変わってしまう。
      letter: {
        id: this.updateLetter.id,
        sender_id: this.updateLetter.sender_id,
        receiver_id: this.updateLetter.receiver_id,
        past: this.updateLetter.past,
        current: this.updateLetter.current,
        future: this.updateLetter.future,
        expect: this.updateLetter.expect,
        message: this.updateLetter.message
      }
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
    handleCloseModal() {
      this.$emit("close-modal");
    },
    handleUpdateLetter() {
      axios
        .patch((`/api/letters/${this.letter.id}`), { letter: this.letter })
        .then((res) => this.$emit("update-letter", res.data));
        this.handleCloseModal();
        this.$store.dispatch("flash/setFlash", {
          type: "success",
          message: "レターを編集しました。"
        });
    },
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
  letter-spacing: 20px;
  font-size:1.2em;
  width: 90%;
}
</style>
