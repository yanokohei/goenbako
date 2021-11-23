<template>
  <v-container>
    <v-list-item v-for="letter in createdLetter" :key="letter.id">
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>{{ letter.title }}</v-list-item-title>
          <v-list-item-subtitle>{{ letter.text }}</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
    </v-list-item>
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
          text: this.letterItems.past
        },
        {
          name: "current",
          title: "現在の印象、どんな人？",
          text: this.letterItems.current
        },
        {
          name: "future",
          title: "これから話してみたい／聞いてみたいこと",
          text: this.letterItems.future
        },
        {
          name: "expect",
          title: `${ this.user.name }さんに期待していること`,
          text: this.letterItems.expect
        },
        {
          name: "message",
          title: "メッセージ",
          text: this.letterItems.message
        }
      ]
      .filter(existsLetterItem => existsLetterItem.text)
      .map(existsLetterItem => existsLetterItem)
    }
  },
}
</script>


<style scoped>

</style>
