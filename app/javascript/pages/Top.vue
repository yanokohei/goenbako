<template>
  <v-container>
    <v-row
      justify="center"
    >
      <div class="text-center s-font mt-12 pb-4">
        あなたには 『素敵なご縁』がある<br>これまでも、これからも
      </div>
      <!-- <v-img max-width="" src="/img/illust.png" /> -->
    </v-row>
      <v-col class="mt-8" align="center">
        <p class="indigo--text">
          ＼ ファンレター公開サービス ／
        </p>
        <v-img max-width="400" src="/img/logo.png" />
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
      justify="center" class="mb-8"
    >
      <v-card
        rounded="xl"
        color="#fff6e4"
        class="mx-4 px-4"
      >
        <v-col align="center">
          <v-card
            color="#F3E5F3"
            rounded="xl"
          >
            どんな人が私にファンレターを？
          </v-card>
        </v-col>
        <v-col class="p-font" align="center">
          <p>あなたとご縁がある人、</p>
          <p>これから縁がありそうな人。</p>
          <p>あなたを応援したいと思っている人。</p>
          <p>あるいは、あなたと仲良くなってみたい。</p>
          <p>そうと思っているのに</p>
          <p>一歩踏み出せていない。</p>
          <p>そんな人もいるかもしれません。</p>
          <p>皆、あなたのファンなのです。</p>
        </v-col>
      </v-card>
    </v-row>
    <v-card color="transparent" outlined ma-2>
      <v-card-actions class="justify-center">
        <v-btn dense text @click="openTermsModal">
          利用規約
        </v-btn>
        <v-btn dense text @click="openPrivacyPolicyModal">
          プライバシーポリシー
        </v-btn>
        <v-btn
          icon
          color="blue"
          href="https://twitter.com/goenbako"
        >
          <v-icon>mdi-twitter</v-icon>
        </v-btn>
      </v-card-actions>
    </v-card>
    <TheTerms
      :is-visible-terms-modal="isVisibleTermsModal"
      @close-terms-modal="closeTermsModal"
    />
    <ThePrivacyPolicy
      :is-visible-privacy-policy-modal="isVisiblePrivacyPolicyModal"
      @close-privacy-policy-modal="closePrivacyPolicyModal"
    />
  </v-container>
</template>

<script>
import { mapGetters } from "vuex"
import TheTerms from "../components/static/TheTerms";
import ThePrivacyPolicy from "../components/static/ThePrivacyPolicy";

export default {
  name: "Top",
  components: {
    TheTerms,
    ThePrivacyPolicy,
  },
  data() {
    return {
      isVisibleTermsModal: false,
      isVisiblePrivacyPolicyModal: false
    }
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    pushLogin() {
      if (this.currentUser) {
        this.$router.push({ name: "User" })
      } else {
        console.log('success');
      }
    },
    openTermsModal() {
      this.isVisibleTermsModal = true;
    },
    openPrivacyPolicyModal() {
      this.isVisiblePrivacyPolicyModal = true;
    },
    closeTermsModal() {
      this.isVisibleTermsModal = false;
    },
    closePrivacyPolicyModal() {
      this.isVisiblePrivacyPolicyModal = false;
    },
  }
}
</script>

<style scoped>
.img{
  mix-blend-mode: multiply;
  z-index: 100;
}
.p-font{
  font-size: 0.9em;
  color: #2c281e;
}
.s-font{
  font-size: 0.9em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
/* .logo {
  mix-blend-mode: multiply;
  width: 250px;
  height: 250px;
  object-fit: cover;
} */
/* .sub-title{
  font-size: 1.8em;
} */
</style>
