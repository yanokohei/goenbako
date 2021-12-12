<template>
  <v-container>
    <v-card
      v-for="letter in createdLetter"
      :key="letter.id"
      color="transparent"
      flat
      class="my-4"
    >
      <v-card-title class="pa-2 s-font">{{ letter.title }}</v-card-title>
        <v-card
          class="mx-1 px-1 rounded-lg u-pre-wrap"
          outlined
          color="#FCFCFC"
          rounded="xl"
        >{{ letter.text }}
        </v-card>
    </v-card>
  </v-container>
</template>

<script>
export default {
  props: {
    letterItems: {
      type: Object,
      required: true
    },
    user: {
      type: Object,
      required: true
    },
  },
  computed: {
    createdLetter() {
      return [
        {
          name: "past",
          title: "出会いのきっかけ、当時の印象",
          text: this.letterItems.letter.past
        },
        {
          name: "current",
          title: "現在の印象、どんな人？",
          text: this.letterItems.letter.current
        },
        {
          name: "future",
          title: "これから話してみたい／聞いてみたいこと",
          text: this.letterItems.letter.future
        },
        {
          name: "expect",
          title: `${ this.user.name }さんに期待していること`,
          text: this.letterItems.letter.expect
        },
        {
          name: "message",
          title: "メッセージ",
          text: this.letterItems.letter.message
        }
      ]
      .filter(existsLetterItem => existsLetterItem.text)
      .map(existsLetterItem => existsLetterItem)
    }
  },
}
</script>

<style scoped>
.m-font{
  font-size: 1.0em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.s-font{
  font-size: 0.9em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.u-pre-wrap {
  white-space: pre-wrap;
}
</style>
