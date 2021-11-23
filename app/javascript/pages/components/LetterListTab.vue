<template>
  <v-container>
    <v-row>
      <v-tabs
        background-color="amber lighten-5"
        centered
        icons-and-text
        v-model="moveTab"
      >
        <v-tabs-slider />

        <v-tab
          v-for="tabItem in tabItems"
          :key="tabItem.tabId"
          class="mr-20"
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
      <div v-for="letter in letterItems" :key="letter.id">
        <v-card flat class="mt-3">
          <keep-alive>
            <component
              :is="tabItem.content"
              :user="user"
              :letter-items="letter"
            ></component>
          </keep-alive>
        </v-card>
      </div>
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
  data() {
    return {
      moveTab: "",
      tabItems: [
        { tabId: 0, tabName: '受け取ったレター', content: 'LetterListReceived' },
        { tabId: 1, tabName: '送ったレター', content: 'LetterListSent' }
      ]
    }
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    letterItems: { // 検証中
      type: Array,
      required: true
    },
  },
  methods: {
    async fetchSentLetters() {
      await axios.get(`/api/users/${this.$route.params.id}/sent_letters`)
        .then((res) => {
          this.sentLetters = res.data
        })
    },
  }
}
</script>

<style>

</style>
