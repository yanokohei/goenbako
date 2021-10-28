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
    </v-card>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from "vuex"

export default {
  name: "UserIndex",
  data() {
    return {
      user: {},
    };
  },
  mounted() {
    this.$axios.get(`http://127.0.0.1:3000/api/users/${this.$route.params.id}`)
    .then((res) => {
      this.user = res.data
    })
  }
};
</script>

<style scoped>
</style>
