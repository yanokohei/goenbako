<template>
  <v-container>
    <v-row>
      <v-tabs
        v-model="moveTab"
        background-color="amber lighten-5"
        centered
        icons-and-text
      >
        <v-tabs-slider />

        <v-tab
          v-for="tabItem in tabItems"
          :key="tabItem.tabId"
          class="mr-24"
        >
          {{ tabItem.tabName }}
          <v-icon>mdi-email-edit-outline</v-icon>
        </v-tab>
      </v-tabs>
      <v-tabs-items v-model="moveTab">
        <v-tab-item
          v-for="tabItem in tabItems"
          :key="tabItem.tabId"
        >
          <component
            :is="tabItem.content"
            :user="user"
            :letter-items="letterItems"
            :sent-letters="sentLetters"
            @delete-letter="deleteLetter"
          />
        </v-tab-item>
      </v-tabs-items>
    </v-row>
  </v-container>
</template>

<script>
import LetterListReceived from './LetterListReceived';
import LetterListSent from './LetterListSent';

export default {
  components: {
    LetterListReceived,
    LetterListSent
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    letterItems: {
      type: Array,
      required: true
    },
    sentLetters: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      moveTab: "",
      tabItems: [
        { tabId: 0, tabName: '受け取ったレター', content: 'LetterListReceived' },
        { tabId: 1, tabName: '送ったレター', content: 'LetterListSent' }
      ]
    }
  },
  methods: {
    deleteLetter() {
      this.$emit("delete-letter");
    },
  }
}
</script>

<style>

</style>
