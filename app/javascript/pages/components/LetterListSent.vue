<template>
  <v-container>
    <v-row class="ma-8" justify="center">
      <v-card
        flat
        color="amber lighten-5"
        width="800px"
        rounded="xl"
      >
        <v-card-title class="ps-16">
          <router-link :to="{ name: 'UserIndex', params: { id: currentUser.id }}">
            <v-list-item-avatar size="50">
              <img :src="currentUser.image">
            </v-list-item-avatar>
          </router-link>
            <v-list-item-content>
              <v-list-item-title class="font-bold">{{ currentUser.name }}</v-list-item-title>
              <v-list-item-subtitle>
                @{{ currentUser.twitter_id }}
                <v-btn icon color="blue" :href="twitterUrl">
                  <v-icon>mdi-twitter</v-icon>
                </v-btn>
              </v-list-item-subtitle>
            </v-list-item-content>
        </v-card-title>

        <LetterItem
          :letter-items="letterItems"
          :user="user"
        />
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters } from "vuex";
import LetterItem from '../components/LetterItem';

export default {
  components: {
    LetterItem,
  },
  data() {
    return {

    };
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    letterItems: {
      type: Object,
      required: true
    },
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    twitterUrl() {
      return `https://twitter.com/${this.currentUser.twitter_id}`
    }
  },
  methods: {

  },
};
</script>

<style scoped>
</style>
