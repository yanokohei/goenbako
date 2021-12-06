<template>
  <v-row justify="center" class="mt-12">
    <v-card
      color="transparent"
      width="800px"
      class="ma-12"
    >
      <v-card-title class="pa-8 mt-16">
        <v-list-item-avatar size="150" class="avatar-position">
          <img :src="currentUser.image">
        </v-list-item-avatar>
        <v-list-item-content>
          <p class="l-font">{{ currentUser.name }}</p>
          <v-list-item-subtitle class="s-font mt-3">
            @{{ currentUser.twitter_id }}
            <v-btn
              icon
              color="blue"
              :href="twitterUrl"
            >
              <v-icon>mdi-twitter</v-icon>
            </v-btn>
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-card-title>
      <v-card-text class="m-font px-8 mb-8">
        {{ currentUser.introduce }}
      </v-card-text>
    </v-card>
  </v-row>
</template>

<script>
import { mapGetters } from "vuex"

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
.l-font{
  font-size: 2.0em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.m-font{
  font-size: 1.2em;
  font-weight: bold;
  line-height: 1.3;
  color: #2c281e;
}
.s-font{
  font-size: 1.1em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.avatar-position {
  position: absolute;
  top: -60px;
  left: 30px;
}
</style>
