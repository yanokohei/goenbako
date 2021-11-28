<template>
  <v-container class="pa-0">
    <div
      v-for="letter in sentLetters"
      :key="letter.id"
    >
      <v-card
        color="#FFFEF6"
        flat
      >
        <keep-alive>
          <v-row
            class="ma-8"
            justify="center"
          >
            <v-card
              flat
              color="#f5f3f2"
              width="800px"
              rounded="xl"
            >
              <v-card-title class="ps-16">
                <router-link :to="{ name: 'UserIndex', params: { id: letter.receiver.id }}">
                  <v-list-item-avatar size="50">
                    <img :src="letter.receiver.image">
                  </v-list-item-avatar>
                </router-link>
                <v-list-item-content>
                  <v-list-item-title class="font-bold">
                    {{ letter.receiver.name }}
                  </v-list-item-title>
                  <v-list-item-subtitle>
                    @{{ letter.receiver.twitter_id }}
                    <v-btn
                      icon
                      color="blue"
                      :href="`https://twitter.com/${letter.receiver.twitter_id}`"
                    >
                      <v-icon>mdi-twitter</v-icon>
                    </v-btn>
                  </v-list-item-subtitle>
                </v-list-item-content>
              </v-card-title>
              <LetterItem
                :letter-items="letter"
                :sent-letters="letter"
                :user="user"
              />
              <v-row
                justify="end"
                class="ma-4"
              >
              </v-row>
            </v-card>
          </v-row>
        </keep-alive>
      </v-card>
    </div>
  </v-container>
</template>

<script>
import { mapGetters } from "vuex";
import LetterItem from '../components/LetterItem';

export default {
  components: {
    LetterItem,
  },
  props: {
    user: {
      type: Object,
      required: true
    },

    sentLetters: {
      type: Array,
      required: true
    }
},
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {

  },
};
</script>

<style scoped>
</style>
