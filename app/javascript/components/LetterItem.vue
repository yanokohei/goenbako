<template>
  <v-container>
    <v-card
      v-for="letter in createdLetter"
      :key="letter.id"
      color="transparent"
      flat
      class="my-3"
    >
      <v-card-title class="pl-2 pa-1 mb-0 s-font">
        <p class="ma-0 pa-0 text-cap">
          {{ letter.title }}
        </p>
      </v-card-title>
      <v-card
        class="mx-2 mt-0 rounded-lg u-pre-wrap xs-font"
        outlined
        color="#FCFCFC"
        rounded="xl"
      >
        {{ letter.text }}
      </v-card>
    </v-card>
  </v-container>
</template>

<script>
export default {
  name: "LetterItem",
  props: {
    letterItems: {
      type: Object,
      required: true
    },
  },
  computed: {
    createdLetter() {
      return [
        {
          name: "past",
          title: '出会った当時の印象／エピソード',
          text: this.letterItems.letter.past
        },
        {
          name: "current",
          title: '現在の印象／どんな人？',
          text: this.letterItems.letter.current
        },
        {
          name: "future",
          title: "これから話してみたい／聞いてみたいこと",
          text: this.letterItems.letter.future
        },
        {
          name: "expect",
          title: `${ this.letterItems.receiver.name }さんに期待していること`,
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
.s-font{
  font-size: 0.65em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.xs-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
  padding: 8px 2px 0px 3px;
}
.u-pre-wrap {
  white-space: pre-wrap;
}
.text-cap {
    margin: 1em 0;
    color: #63406d;
    background: #FCF6FF;
    border-radius: 10%;
    box-shadow: 0px 0px 0px 3px #FCF6FF;
    text-shadow: 0 0 0.5em #dadab1
}
</style>
