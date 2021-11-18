<template>
  <v-container>
    <v-list-item v-for="letter in notNullLetterItems" :key="letter.id">
      <v-list-item-content>
        <v-list-item-subtitle>{{ letter.title }}</v-list-item-subtitle>
        <v-list-item-title>{{ letter.text }}</v-list-item-title>
      </v-list-item-content>
    </v-list-item>
  </v-container>
</template>

<script>
export default {
  /////////////////////// 作成されたレターデータを受け取る
  props: {
    createdLetter: {
      type: Object,
      default: () => {},
      required: true
    }
  },
  //////////////////////// レターの中身詳細
  computed: {
    notNullLetterItems: {},
    createdLetter() {
      return [
        {
          name: "past",
          title: "出会いのきっかけ、当時の印象",
          text: this.createdLetter.past
        },
        {
          name: "current",
          title: "現在の印象、どんな人？",
          text: this.createdLetter.current
        },
        {
          name: "tweetedDayCount",
          title: "これから話してみたい／聞いてみたいこと",
          text: this.createdLetter.future
        },
        {
          name: "firstTweetedAt",
          title: `${user.name}さんに期待していること`,
          text: this.createdLetter.expect
        },
        {
          name: "lastTweetedAt",
          title: "メッセージ",
          text: this.createdLetter.message
        }
      ]
    }
  },
}
</script>
