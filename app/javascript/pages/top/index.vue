<template>
  <v-container>
    <v-row
      justify="center"
    >
      <div class="text-center mt-12 pb-4">
        あなたには 『素敵なご縁』がある<br>これまでも、これからも
      </div>
      <v-img max-width="" src="/img/illust.png" />
    </v-row>
      <v-col align="center">
        <p class="indigo--text">
          ＼ ファンレター公開サービス ／
        </p>
        <v-img max-width="" src="/img/logo.svg" />
      </v-col>
      <v-col align="center">
        <p class="indigo--text">
            <span>
              ご縁箱を開設して<br>ファンレターを交換してみよう
            </span>
          <v-icon>mdi-email-edit-outline</v-icon>
        </p>
        <v-btn
          color="primary"
          large
          href="/api/oauth/twitter"
        >
          Twitter認証して始める
        </v-btn>
      </v-col>
        <v-img
          class="img"
          max-width="60"
          src="/img/letter.png"
        />
    <!-- ここまで -->
    <v-row
      justify="center"
    >
      <v-card
        rounded="xl"
        color="#feebbe"
      >
        <v-col align="center">
          <v-card
            color="#F3E5F3"
            rounded="xl"
          >
            どんな人が私にファンレターを？
          </v-card>
        </v-col>
        <v-col align="center">
          <p>あなたとご縁がある人、</p>
          <p>これから縁がありそうな人。</p>
          <p>あなたを応援したいと思っている人。</p>
          <p>あるいは、あなたと仲良くなってみたい。</p>
          <p>そうと思っているのに</p>
          <p>一歩踏み出せていない人。</p>
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
/* .sub-title{
  font-size: 1.8em;
}
.p-font{
  font-size: 1.3em;
  color: #2c281e;
} */
</style>
