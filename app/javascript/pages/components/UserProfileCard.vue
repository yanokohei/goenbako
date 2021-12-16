<template>
  <v-row justify="center" class="mt-8">
    <v-card
      color="transparent"
      min-width="320"
    >
      <v-card-title class="mt-4">
        <v-list-item-avatar size="60" class="avatar-position">
          <img :src="user.image">
        </v-list-item-avatar>
        <v-list-item-content class="s-font">
          {{ user.name }}
          <v-list-item-subtitle>
            @{{ user.twitter_id }}
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
      <v-card-text class="s-font px-4 mb-8">
        {{ user.introduce }}
      </v-card-text>
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

.s-font{
  font-size: 1.1em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.avatar-position {
  position: absolute;
  top: -40px;
  left: 20px;
}
</style>
