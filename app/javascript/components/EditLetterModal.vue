<template>
  <v-dialog
    v-model="isVisibleEditLetterModal"
    persistent
    max-width="500"
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <v-icon>mdi-email-edit-outline</v-icon>
        <span class="m-font">レターの更新</span>
      </v-card-title>
      <v-divider />
      <p class="xs-font mx-4">※それぞれ100文字以内で自由にご記入ください。</p>
      <div class="mx-4 pt-4">
        <v-form @submit.prevent="handleUpdateLetter(letter)">
          <div v-for="(letterTitle, index) in letterTitles()" :key="index">
            <div class="s-font pa-0">
              <label
                for="past"
              >{{ letterTitle.item }}</label>
                <v-textarea
                  :id="`${letterTitle.model_name}`"
                  v-model="letter[letterTitle.model_name]"
                  :name="`letter[${letterTitle.model_name}]`"
                  background-color="white"
                  counter
                  :rules="rules"
                  rows="2"
                />
            </div>
          </div>
          <!-- 登録ボタン -->
          <v-row
            justify="center"
            class="my-4 pb-4"
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
    },
    receiver: {
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
      },
      rules: [v => v.length <= 100 || '100文字以内で入力してください。'],
    }
  },
  computed: {
    ...mapGetters("users", ["currentUser"]),
  },
  methods: {
    letterTitles() {
      return [
        { item: '出会いのきっかけ・当時の印象', model_name: 'past' },
        { item: '現在の印象・どんな人？', model_name: 'current' },
        { item: '聞いてみたいこと／これから話してみたいこと', model_name: 'future' },
        { item: `${this.receiver.name}さんに期待していること`, model_name: 'expect' },
        { item: 'メッセージ', model_name: 'message' }
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
.m-font{
  font-size: 1.1em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.s-font{
  font-size: 0.8em;
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
</style>
