<template>
  <v-container>
    <v-row
      justify="center"
    >
      <div class="text-center s-font mt-8 pb-4 nowrap">
        あなたには『素敵なご縁』がある。<br>これまでも、これからも。
      </div>
    </v-row>
    <v-col class="mt-4" align="center">
      <v-img max-width="400" height="130" src="/img/top_logo.png" />
    </v-col>
    <v-col v-if="!currentUser" align="center">
      <p class="indigo--text">
        ご縁箱を開設して<br>＼ファンレターを交換してみよう／
      </p>
      <v-btn
        color="blue"
        class="white--text"
        rounded
        large
        style="text-transform: none"
        href="/api/oauth/twitter"
      >
        <v-icon>mdi-twitter</v-icon>
        <span class="m-font white--text ml-2">Twitter認証して始める</span>
      </v-btn>
      <p class="xs-font mt-2">※下の利用規約・プライバシーポリシーをご確認ください。</p>
    </v-col>
    <v-col v-if="currentUser" align="center">
      <p class="indigo--text l-font">
        WELCOME,
        <v-list-item-avatar size="40">
          <img :src="currentUser.image">
        </v-list-item-avatar>
      </p>
      <v-btn
        color="deep-purple lighten-5"
        rounded
        large
        style="text-transform: none"
        :to="{ name: 'Mypage' }"
      >
        <v-icon>mdi-home</v-icon>
        <span class="m-font ml-2">マイページに戻る</span>
      </v-btn>
    </v-col>
    <v-col align="center">
      <v-img max-width="300" src="/img/dot.svg" />
    </v-col>
    <v-col align="center">
      <v-card max-width="320" color="transparent" outlined>
      <v-card-title class="pl-2 pa-1 pb-3 nowrap">
        <v-icon color="blue">mdi-help-box</v-icon>
        <span class="s-font">ご縁箱の使い方
        </span>
      </v-card-title>
        <v-card>
        <v-carousel
          cycle
          max-width="300"
          height="100%"
          hide-delimiters
          :continuous="false"
        >
          <v-carousel-item
            v-for="(rule_image,i) in rule_images"
            :key="i"
          >
            <img
              :src="rule_image.src"
              width="100%"
              height="100%"
              eager
            />
          </v-carousel-item>
        </v-carousel>
        </v-card>
      </v-card>
    </v-col>
    <v-row
      justify="center" class="mb-8 mt-8"
    >
      <v-card
        rounded="xl"
        color="transparent"
        outlined
        class="mx-4 px-4"
      >
        <v-img max-width="250" src="/img/en_line_top.svg" />
        <v-col align="center" class="m-font">
          どんな人が私にファンレターを？
        </v-col>
        <v-img max-width="45" class="position" src="/img/triple_letter.svg" />
        <v-col class="p-font" align="center">
          <p>あなたと今、ご縁がある人。</p>
          <p>これからご縁がありそうな人。</p>
          <p>あなたを応援したいと思っている人。</p>
          <p>あるいは、あなたと仲良くなってみたい。</p>
          <p>そう思っても、一歩踏み出せていない。</p>
          <p>そんな人もいるかもしれません。</p>
          <p>皆、あなたのファンなのです。</p>
        </v-col>
        <v-img max-width="250" src="/img/en_line_under.svg" />
      </v-card>
    </v-row>
    <v-card color="transparent" outlined ma-2>
      <v-card-actions class="justify-center mb-4">
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
      isVisiblePrivacyPolicyModal: false,
      rule_images: [
        {
          src: "/img/rules/rule_0.jpg"
        },
        {
          src: "/img/rules/rule_1.jpg"
        },
        {
          src: "/img/rules/rule_2.jpg"
        },
        {
          src: "/img/rules/rule_3.jpg"
        },
        {
          src: "/img/rules/rule_4.jpg"
        },
        {
          src: "/img/rules/rule_5.jpg"
        },
        {
          src: "/img/rules/rule_6.jpg"
        },
      ]
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
  font-size: 0.7em;
  color: #2c281e;
}
.l-font{
  font-size: 1.2em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
  letter-spacing: 3px;
}
.m-font{
  font-size: 0.85em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.s-font{
  font-size: 0.75em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.xs-font{
  font-size: 0.6em;
  font-weight: lighter;
  line-height: 1.5;
  color: #2c281e;
}
.nowrap{
  white-space: nowrap
}
.position {
  position: absolute;
  top: 45px;
  left: 15px;
}
</style>
