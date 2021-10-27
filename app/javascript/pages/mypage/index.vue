<template>
  <v-container>
    <v-flex xs8 md8 ma-auto>
    <v-row class="ma-8 mt-12">
      <v-card
        color="amber lighten-5"
        width="500px"
      >
        <v-card-title>
          <v-list-item-avatar>
            <img :src="user.image">
          </v-list-item-avatar>
          <span class="text-h6 font-weight-light">{{ user.name }}</span>
          <v-icon
            right
          >
            mdi-twitter
          </v-icon>
        </v-card-title>

        <v-card-text class="font-weight-bold">
          {{ user.introduce }}テストテストテストテストテストテストテストテストtetetete
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
  <!-- シェアボタン -->
    </v-row>
        </v-flex>
      <v-col class="text-center mb-12">
        <v-btn
          color="blue"
          class="white--text"
          rounded
          x-large
          href="#"
        >
          Myご縁箱をシェアする
        </v-btn>
      </v-col>
  <!-- タブメニュー -->
    <v-card>
      <v-tabs

        background-color="amber lighten-5"
        centered
        icons-and-text
      >
        <v-tabs-slider></v-tabs-slider>

        <v-tab href="#tab-1" class="mr-8">
          <v-icon>mdi-email-fast-outline</v-icon>
          受け取ったファンレター
        </v-tab>

        <v-tab href="#tab-3">
          <v-icon>mdi-email-edit-outline</v-icon>
          送ったファンレター
        </v-tab>
      </v-tabs>
      <!-- <v-tabs-items v-model="tab">
        <v-tab-item
          v-for="i in 3"
          :key="i"
          :value="'tab-' + i"
        >
          <v-card flat>
            <v-card-text>{{ text }}</v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs-items> -->
    </v-card>
  </v-container>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  name: "MypageIndex",
  data() {
    return {
      user: {}
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  mounted() {
    this.$axios.get("/users/me")
    .then((res) => {
      this.user = res.data
      this.$store.commit('users/setCurrentUser', res.data)
    })
  }
};
</script>

<style scoped>
</style>
