<template>
  <v-container>
    <v-row>
      <v-tabs
        v-model="moveTab"
        background-color="#fff6e4"
        centered
        icons-and-text
      >
        <v-tabs-slider />
        <v-tab
          v-for="tabItem in tabItems"
          :key="tabItem.tabId"
        >
          {{ tabItem.tabName }}
          <v-icon>mdi-email-edit-outline</v-icon>
        </v-tab>
      </v-tabs>
      <v-row justify="center" class="py-4">
        <v-tabs-items v-model="moveTab">
          <v-tab-item
            v-for="tabItem in tabItems"
            :key="tabItem.tabId"
          >
            <component
              :is="tabItem.content"
              :user="user"
              :received-letters="receivedLetters"
              :sent-letters="sentLetters"
              @update-letter="handleUpdateLetter"
            />
          </v-tab-item>
        </v-tabs-items>
      </v-row>
    </v-row>
  </v-container>
</template>

<script>
import ReceivedLetterList from './ReceivedLetterList';
import SentLetterList from './SentLetterList';

export default {
  name: "LetterListTab",
  components: {
    ReceivedLetterList,
    SentLetterList
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    receivedLetters: {
      type: Array,
      required: true
    },
    sentLetters: {
      type: Array,
      required: true
    },
  },
  data() {
    return {
      moveTab: "",
      tabItems: [
        { tabId: 0, tabName: '受け取ったレター', content: 'ReceivedLetterList' },
        { tabId: 1, tabName: '送ったレター', content: 'SentLetterList' }
      ]
    }
  },
  methods: {
    handleUpdateLetter() {
      this.$emit("update-letter");
    }
  }
}
</script>

<style>

</style>
