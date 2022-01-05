<template>
  <v-col class="text-center invite-area mb-4">
    <v-row justify="end">
      <v-img
        src="/img/writing.png"
        max-width="40px"
      />
    </v-row>
    <div class="xs-font mt-4 mb-4">
      \ ご縁箱の開設をリクエストしてみませんか? /
    </div>
    <v-btn
      color="#FCF6FF"
      small
      :href="inviteTweetReply()"
    >
      <v-icon color="blue">mdi-twitter</v-icon>
      リクエストしてみる
    </v-btn>
  </v-col>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  name: "ShareLinkModal",
  props: {
    searchID: {
      type: String
    },
  },
  data() {
    return {
      snackbar: false,
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    inviteTweetReply() {
      const url = "https://goenbako.com"
      return `https://twitter.com/share?text=@${this.searchID}%0a${this.currentUser.name}さんがあなたにご縁箱をおすすめしています。%0aご縁箱を開設してファンレターを受け取ってみましょう！&url=${url}&hashtags=ご縁箱&hashtags=Goenbako-Letters`;
    },
  }
};
</script>

<style scoped>
.xs-font{
  font-size: 0.7em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.s-font{
  font-size: 0.9em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.invite-area{
  background-color: rgb(244, 228, 215);
}
.modal {
  display: block;
}
</style>
