<template>
    <v-row class="ma-8" justify="center">
      <v-card
        flat
        color="brown lighten-5"
        width="800px"
        rounded="xl"
      >
        <v-card-title class="ps-16">
          <v-list-item-avatar size="50">
            <img :src="currentUser.image">
           </v-list-item-avatar>
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

        <v-card-title>
          自分のレターはここにレターの内容が反映される
        </v-card-title>
      </v-card>
    </v-row>
</template>

<script>
import { mapGetters, mapActions } from "vuex"

export default {
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    twitterUrl() {
      return `https://twitter.com/${this.currentUser.twitter_id}`
    }
  },
}
</script>

<style scoped>
p.from-dear {
  background:rgb(249、 179、 191);
  vertical-align: top;
  }
</style>
