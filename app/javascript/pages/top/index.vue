<template>
  <v-container>
    <v-row
      justify="center"
    >
      <div class="text-center mt-16">
        <p class="sub-title">あなたが素敵なご縁に恵まれる おまじない</p>
      </div>
      <v-img max-width="600" src="/img/illust.png" />
    </v-row>
      <v-col class="mt-16" align="center">
        <p class="indigo--text mb-8">
          ＼ ファンレター公開サービス ／
        </p>
        <v-img max-width="250" src="/img/logo.svg" />
      </v-col>
      <v-col class="mt-8" align="center">
        <p class="indigo--text mb-8">
            <span>
              ご縁箱を開設して<br>ファンレターを交換してみよう
            </span>
          <v-icon>mdi-email-edit-outline</v-icon>
        </p>
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
        <v-img
          class="img"
          max-width="100"
          src="/img/letter.png"
        />
    <!-- ここまで -->
    <v-row
      class="ma-16"
      justify="center"
    >
      <v-card
        width="700px"
        rounded="xl"
        color="#feebbe"
      >
        <v-col align="center">
          <v-card
            color="#F3E5F3"
            width="500px"
            rounded="xl"
          >
            <p class="p-font">どんな人が私にファンレターを？</p>
          </v-card>
        </v-col>
        <v-col align="center">
          <div class></div>
          <p>あなたとご縁がある人、</p>
          <p>これから縁がありそうな人。</p>
          <p>あなたを応援したいと思っている人。</p>
          <p>あるいは、あなたと仲良くしたいと思っているのに<br>
            一歩踏み出せていない人。</p>
          <p>そんな人もいるかもしれません。</p>
          <p>皆、あなたのファンなのです。</p>
        </v-col>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters } from "vuex"
export default {
  name: "TopIndex",
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
.sub-title{
  font-size: 1.8em;
}
.p-font{
  font-size: 1.3em;
  color: #2c281e;
}
</style>
