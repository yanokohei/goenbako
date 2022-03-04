<template>
  <v-container>
    <v-row
      class="ma-8"
      justify="center"
    >
      <UserProfileCard
        :user="user"
      />
    </v-row>
    <v-row class="justify-center mb-5 pa-4">
      <v-btn
        v-if="isOtherCurrentUser"
        color="deep-purple lighten-5"
        rounded
        large
        @click="openCreateLetterModal"
      >
        <v-icon left>
          {{ svgPath.mdiPlus }}
        </v-icon>
        ファンレターを書く
      </v-btn>
    </v-row>
    <transition name="fade">
      <TheLoginGuidanceModal
        :is-visible-login-guidance-modal="isVisibleLoginGuidanceModal"
        @close-modal="handleCloseLoginGuidanceModal"
      />
    </transition>
    <transition name="fade">
      <CreateLetterModal
        :is-visible-create-letter-modal="isVisibleCreateLetterModal"
        :user="user"
        @create-letter="fetchReceivedLetters"
        @close-modal="handleCloseCreateLetterModal"
      />
    </transition>
    <LetterListTab
      :user="user"
      :received-letters="receivedLetters"
      :sent-letters="sentLetters"
    />
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import UserProfileCard from "../components/UserProfileCard";
import CreateLetterModal from "../components/CreateLetterModal";
import LetterListTab from "../components/LetterListTab";
import TheLoginGuidanceModal from "../components/shared/TheLoginGuidanceModal";
import { mdiPlus } from '@mdi/js'

export default {
  name: "User",
  metaInfo() {
    return {
      title: `${this.user.name}さんのご縁箱ページ`,
      titleTemplate: '%s | °˖✧ご縁箱✧˖°',
      meta: [
        {
          property: 'og:image',
          content: 'https://goenbako.com/img/MYLINK_OGP.jpg',
        },
      ]
    }
  },
  components: {
    UserProfileCard,
    CreateLetterModal,
    LetterListTab,
    TheLoginGuidanceModal
  },

  data() {
    return {
      svgPath: {
        mdiPlus
      },
      user: {},
      notExistUserPage: false,
      receivedLetters: [],
      sentLetters: [],
      isVisibleCreateLetterModal: false,
      isVisibleLoginGuidanceModal: false
    };
  },
  computed: {
    ...mapGetters("users", ["currentUser"]),
    ...mapGetters("users", ["isAuthenticatedUser"]),
    currentPath() {
      return this.$route.path
    },
    isOtherCurrentUser() {
      return this.$route.path !== `/${this.currentUser.twitter_id}` && this.$route.path !== `/${this.currentUser.twitter_id}/`
    },
  },
  watch: {
    currentPath: function() {
      this.fetchUserAndLetters()
    }
  },
  mounted() {
    this.fetchUserAndLetters()
  },
  methods: {
    async fetchUserAndLetters() {
      await this.fetchUser()
      if (!this.notExistUserPage) {
        this.fetchReceivedLetters()
        this.fetchSentLetters()
        // this.metaInfo.title = `${this.user.name}さんのご縁箱ページ`
      }
    },
    async fetchUser() {
      const result = await axios.get(`/api/users/${this.$route.params.twitter_id}`)
      if (result.data === null) {
        this.notExistUserPage = true
        this.$router.push({ name: "NotFound" })
      } else {
        this.user = result.data
      }
    },
    fetchReceivedLetters() {
      axios.get(`/api/users/${this.$route.params.twitter_id}/received_letters`)
        .then((res) => {
          this.receivedLetters = res.data
        })
    },
    fetchSentLetters() {
      axios.get(`/api/users/${this.$route.params.twitter_id}/sent_letters`)
        .then((res) => {
          this.sentLetters = res.data
        })
    },
    openCreateLetterModal() {
      if (this.isAuthenticatedUser) {
        this.isVisibleCreateLetterModal = true
      }
      else {
        this.isVisibleLoginGuidanceModal = true;
        this.$store.dispatch("flash/setFlash", {
          type: "info",
          message: "ログインが必要です。"
        })
      }
    },
    handleCloseCreateLetterModal() {
      this.isVisibleCreateLetterModal = false;
    },
    handleCloseLoginGuidanceModal() {
      this.isVisibleLoginGuidanceModal = false;
    }
  },
};
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
