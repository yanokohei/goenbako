<template>
  <v-row
    justify="center"
    class="mt-6"
  >
    <v-card
      color="transparent"
      min-width="300"
      max-width="320"
    >
      <v-list-item-avatar
        size="60"
        class="avatar-position"
      >
        <img :src="user.image">
      </v-list-item-avatar>
      <v-list-item-content>
        <v-card-title class="m-font mt-2">
          <p class="ma-0 pa-0">{{ user.name }}</p>
        </v-card-title>
        <v-card-subtitle class="pb-1">
          @{{ user.twitter_id }}
          <v-btn
            icon
            color="blue"
            :href="twitterUrl"
          >
            <v-icon>mdi-twitter</v-icon>
          </v-btn>
        </v-card-subtitle>
        <v-card-text class="xs-font px-4 pb-3">
          {{ user.introduce }}
        </v-card-text>
      </v-list-item-content>
    </v-card>
  </v-row>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  name: "UserProfileCard",
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
<style scoped>
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
.xs-font{
  font-size: 0.9em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.avatar-position {
  position: absolute;
  top: -40px;
  left: 20px;
}
.nowrap{
  white-space: nowrap
}
</style>
