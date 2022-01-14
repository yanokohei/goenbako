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
            <span class="s-font nowrap" style="color: #3270B9;">
              <v-icon size="25">{{ tabItem.icon }}</v-icon>
              ({{ tabItem.countLetter }})
            </span>
            <div class="xs-font mt-1 nowrap" background-color="#fff6e4">
              {{ tabItem.tabName }}
            </div>
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
    }
  },
  computed: {
    countReceivedLetter() {
      return this.receivedLetters.length;
    },
    countSentLetter() {
      return this.sentLetters.length;
    },

    tabItems() {
      return [
        { tabId: 0, tabName: '受け取ったレター', content: 'ReceivedLetterList', countLetter: this.countReceivedLetter, icon: 'mdi-email-open-multiple-outline' },
        { tabId: 1, tabName: '送ったレター', content: 'SentLetterList', countLetter: this.countSentLetter, icon: 'mdi-email-edit-outline' }
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
.xs-font{
  font-size: 0.9em;
  font-weight: bold;
  line-height: 1;
}
.s-font{
  font-size: 1.2em;
  font-weight: bold;
  line-height: 2;
}
.nowrap{
  white-space: nowrap
}
</style>
