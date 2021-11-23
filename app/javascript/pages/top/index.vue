<template>
  <v-container>
    <v-row>
      <v-col
        justify-center
        align-content="center"
      >
        <v-img
          class="mb-16 img"
          alt="goenbako"
          src="/img/logo.png"
        />
        <p class="text-h4 text-center indigo--text mb-16">
          ご縁箱を開設して<br>ファンレターを交換してみよう
        </p>
      </v-col>
      <v-col class="text-center">
        <v-btn
          class="mb-5"
          color="primary"
          rounded
          x-large
          href="/api/oauth/twitter"
        >
          Twitter認証して始める
        </v-btn>
      </v-col>
    </v-row>

    <v-row class="ma-8" justify="center">
      <v-card
        flat
        color="amber lighten-5"
        width="800px"
        rounded="xl"
      >
      <v-img class="img" src="/img/画像サンプル２.jpg"></v-img>
        <v-divider />
        <v-card-title class="ps-16">
          <v-list-item-content>
            <v-list-item-title>１STEP</v-list-item-title>
            <v-list-item-subtitle>
              USER_ID
              <v-btn icon color="blue">
                <v-icon>mdi-twitter</v-icon>
              </v-btn>
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-card-title>
      </v-card>
    </v-row>
  <!-- ここまで -->
    <v-row class="ma-8" justify="center">
      <v-card
        flat
        color="amber lighten-5"
        width="800px"
        rounded="xl"
      >
      <v-col>fafafaa</v-col>
        <v-img class="img" src="/img/画像サンプル.jpg"></v-img>
        <v-divider />
        <v-card-title><h5>あなたが応援したい人へ</h5></v-card-title>
        <v-card-text align="left">
          <div>
            <v-icon>mdi-hexagon-multiple-outline</v-icon>
            <span>
              縁を振り返る
            </span>
          </div>
          <p />
          <div>
            <v-icon>mdi-file-document-multiple-outline</v-icon>
            <span>
              レターを届ける
            </span>
          </div>
          <p />
          <div>
            <v-icon>mdi-bug</v-icon>
            <span>
              楽しく交流を深めたい
            </span>
          </div>
        </v-card-text>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  name: "TopIndex",
  data() {
    return {
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    },

  methods: {
    pushLogin() {
      if (this.currentUser) {
        this.$router.push({ name: "UserIndex" })
      } else {
        console.log('success');
      }
    }
  }
}
</script>

<style scoped>
.img{
  mix-blend-mode: multiply;
}
</style>
