<template>
  <v-card
    color="amber lighten-5"
    width="500px"
  >
    <v-card-title>
      <v-list-item-avatar size="50">
        <img :src="user.image">
      </v-list-item-avatar>

      <v-list-item-content>
        <v-list-item-title>{{ user.name }}</v-list-item-title>
        <v-list-item-subtitle>
          @{{ user.twitter_id }}
          <v-btn icon color="blue" :href="twitterUrl">
            <v-icon>mdi-twitter</v-icon>
          </v-btn>
        </v-list-item-subtitle>
      </v-list-item-content>
    </v-card-title>

    <v-card-text>
      {{ user.introduce }}
    </v-card-text>

    <v-card-actions>
      <v-list-item class="grow">
        <v-list-item-content>
          <v-list-item-title>書いたレター</v-list-item-title>
        </v-list-item-content>
        <v-row
          align="center"
          justify="end"
        >
          <v-icon class="mr-1">
            mdi-pencil
          </v-icon>
          <span class="subheading mr-2">256</span>
        </v-row>
      </v-list-item>
    </v-card-actions>
  </v-card>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  props: {
    user: {
      type: Object,
      required: true
    },
  },
  computed: {
    twitterUrl() {
      return `https://twitter.com/${this.user.twitter_id}`
    }
  },
}
</script>
