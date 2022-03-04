<template>
  <v-row justify="center" class="mt-6">
    <v-card
      color="transparent"
      min-width="280"
      max-width="320"
    >
      <v-btn
        v-if="this.$route.path === ('/me/home')"
        x-small
        class="button-position s-font"
        :to="{ name: 'Setting' }"
      >
        <v-icon size="15">{{ svgPath.mdiCog }}</v-icon>
        <span class="ml-1">設定</span>
      </v-btn>
      <v-btn
        v-if="this.$route.path === ('/me/home/setting')"
        x-small
        class="button-position s-font"
        dark
        color="deep-purple lighten-3"
        :to="{ name: 'Mypage' }"
      >
        <v-icon size="15">{{ svgPath.mdiHome }}</v-icon>
        <span class="ml-1">戻る</span>
      </v-btn>
      <v-list-item-avatar size="60" class="avatar-position">
        <img :src="currentUser.image">
      </v-list-item-avatar>
      <v-list-item-content>
        <v-card-title class="m-font mt-2">
          <p class="ma-0 pa-0">{{ currentUser.name }}</p>
        </v-card-title>
        <v-card-subtitle class="pb-1">
          @{{ currentUser.twitter_id }}
          <v-btn
            icon
            color="blue"
            @click="moveTwitterUserPage()"
          >
            <v-icon>{{ svgPath.mdiTwitter }}</v-icon>
          </v-btn>
        </v-card-subtitle>
        <v-card-text class="xs-font px-4 pb-3">
          {{ currentUser.introduce }}
        </v-card-text>
      </v-list-item-content>
    </v-card>
  </v-row>
</template>

<script>
import { mapGetters } from "vuex"
import { mdiCog, mdiHome, mdiTwitter } from '@mdi/js'

export default {
  name: "ProfileCard",
  data() {
    return {
      svgPath: {
        mdiCog,
        mdiTwitter,
        mdiHome
      },
    }
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    moveTwitterUserPage() {
      window.open(`https://twitter.com/${this.currentUser.twitter_id}`, '_blank')
    }
  }
}
</script>

<style scoped>
.m-font{
  font-size: 1.2em;
  font-weight: bold;
  color: #2c281e;
}
.s-font{
  font-size: 1.0em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.xs-font{
  font-size: 0.9em;
  font-weight: bold;
  line-height: 2;
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
.button-position {
  position: absolute;
  top: 5px;
  right: 5px;
}
</style>
