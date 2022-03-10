<template>
  <v-col class="text-center invite-area mb-4 pb-4">
    <v-row justify="end">
      <v-img
        src="/img/writing.png"
        max-width="28px"
      />
    </v-row>
    <div class="xs-font mt-3 mb-2 nowrap">
      \ ご縁箱の開設をお願いしてみませんか? /
    </div>
    <v-btn
      color="#FCF6FF"
      small
      @click="inviteTweetReply()"
    >
      <v-icon color="blue">
        {{ svgPath.mdiTwitter }}
      </v-icon>
      リクエストしてみる
    </v-btn>
    <p
      v-if="!currentUser"
      class="xs-font mt-2 mb-0"
    >
      ※ログインが必要です
    </p>
  </v-col>
</template>

<script>
import { mapGetters } from "vuex"
import { mdiTwitter } from '@mdi/js'

export default {
  name: "ShareLinkModal",
  props: {
    searchID: {
      type: String
    },
  },
  data() {
    return {
      svgPath: {
        mdiTwitter
      },
      snackbar: false,
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    userNameSaveReply() {
      const currentUserName = this.currentUser.name
      return currentUserName.replace(/@/g, '@ ').replace(/＠/g, '＠ ')
    }
  },
  methods: {
    inviteTweetReply() {
      if (this.currentUser) {
        const url = "https://goenbako.com"
        window.open(`https://twitter.com/intent/tweet?text=@${this.searchID}%0a${this.userNameSaveReply}さんがあなたにご縁箱をおすすめしています。%0aご縁箱を開設してファンレターを受け取ってみましょう！%0a°˖✧%23ご縁箱%20%23goenbako_letters✧˖°%0a&url=${url}`, '_blank')
      }
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
  font-size: 0.7em;
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
.nowrap{
  white-space: nowrap
}
</style>
