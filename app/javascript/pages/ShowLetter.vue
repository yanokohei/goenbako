<template>
  <v-container v-if="loadData">
    <v-row justify="center">
      <h3 class="mt-4 pb-2">レター詳細ページ</h3>
    </v-row>
      <v-row justify="center">
        <v-card
          flat
          color="#FCF6FF"
          rounded="xl"
          width="330"
        >
          <v-card-title class="pt-6">
            <router-link :to="{ name: 'User', params: { twitter_id: letterData.receiver.twitter_id }}">
              <v-list-item-avatar class="pa-0" size="65">
                <img :src="letterData.receiver.image">
              </v-list-item-avatar>
            </router-link>
            <v-list-item-content class="pa-0">
              <v-list-item-title class="s-font">
                {{ letterData.receiver.name }}
              </v-list-item-title>
              <v-list-item-subtitle>
                @{{ letterData.receiver.twitter_id }}
                <v-btn
                  icon
                  color="blue"
                  :href="`https://twitter.com/${letterData.receiver.twitter_id}`"
                >
                  <v-icon>mdi-twitter</v-icon>
                </v-btn>
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-card-title>
        </v-card>
      </v-row>
      <v-row justify="center">
        <v-img
          src="/img/thank_you.svg"
          max-width="130px"
        />
      </v-row>
      <div class="text-center mt-12 pb-4">
        {{ letterData.sender.name }} さんより<br>
        ........ 届いたファンレターです ........
      </div>
      <v-row justify="center">
        <v-card
          flat
          color="#f1f1f1"
          rounded="xl"
          width="330"
          class="mt-4 mb-4"
        >
          <v-card-title class="pt-6">
            <router-link :to="{ name: 'User', params: { twitter_id: letterData.sender.twitter_id }}">
              <v-list-item-avatar class="pa-0" size="65">
                <img :src="letterData.sender.image">
              </v-list-item-avatar>
            </router-link>
            <v-list-item-content class="pa-0">
              <v-list-item-title class="s-font">
                {{ letterData.sender.name }}
              </v-list-item-title>
              <v-list-item-subtitle>
                @{{ letterData.sender.twitter_id }}
                <v-btn
                  icon
                  color="blue"
                  :href="`https://twitter.com/${letterData.sender.twitter_id}`"
                >
                  <v-icon>mdi-twitter</v-icon>
                </v-btn>
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-card-title>
          <LetterItem
            class="pt-0"
            :letter-items="letterData"
          />
        </v-card>
      </v-row>
      <v-row class="justify-center mt-4 pa-4">
        <v-btn
          color="deep-purple lighten-5"
          rounded
          small
        >
          <v-icon left>
            mdi-account-arrow-left-outline
          </v-icon>
          {{ letterData.receiver.name }}さんのご縁箱ページへ
        </v-btn>
      </v-row>
      <v-row class="justify-center mb-8 pa-4">
        <v-btn
          color="#f1f1f1"
          rounded
          small
        >
          <v-icon left>
            mdi-account-arrow-left-outline
          </v-icon>
          {{ letterData.sender.name }}さんのご縁箱ページへ
        </v-btn>
      </v-row>
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex"
import LetterItem from '../components/LetterItem';

export default {
  name: "ShowLetter",
  components: {
    LetterItem
  },
  data() {
    return {
      user: {},
      letterData: [],
      loadData: false
    };
  },
  mounted() {
    this.fetchLetter()
  },
  computed: {
    ...mapGetters("users", ["currentUser"]),
  },
  methods: {
    async fetchLetter() {
      await axios.get(`/api/letters/${this.$route.params.letter_id}`)
      .then((res) => {
        this.letterData = res.data
        this.loadData = true
      })
    }
  }
};
</script>

<style scoped>

</style>
