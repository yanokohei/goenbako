<template>
  <v-row
    align="center"
    justify="center"
  >
    <v-btn
      v-if="!currentUser"
      :to="{ name: 'Top' }"
    >
      <span>Top</span>
        <v-img
          src="/img/favicon.ico"
          max-width="27px"
        />
    </v-btn>

    <v-btn
      v-if="currentUser"
      :to="{ name: 'Mypage' }"
    >
      <span>Home</span>

      <v-icon>mdi-home</v-icon>
    </v-btn>

    <v-btn
      :to="{ name: 'User', params: { twitter_id: this.random_id }}"
    >
      <span>Random</span>

      <v-icon>mdi-paw</v-icon>
    </v-btn>

    <v-btn
      @click="openUserSearchModal"
    >
      <span>Search</span>

      <v-icon>mdi-account-search-outline</v-icon>
    </v-btn>
    <v-menu
      transition="slide-y-transition"
      bottom
      v-if="currentUser"
      top offset-y
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          text
          color="blue"
          v-bind="attrs"
          v-on="on"
          x-small
        >
          <span>Menu</span>

          <v-icon>mdi-menu</v-icon>
        </v-btn>
      </template>
      <v-list class="s-font">
        <v-list-item
          to="/api/logout"
          data-method="delete"
          @click="logoutUser"
          small
          text
        >
          <v-icon>mdi-logout</v-icon>
            ログアウト
        </v-list-item>
      </v-list>
    </v-menu>
    <transition name="fade">
      <TheUserSearchModal
        :is-visible-user-search-modal="isVisibleUserSearchModal"
        @close-modal="handleCloseUserSearchModal"
      />
    </transition>
  </v-row>
</template>

<script>
import Cookies from 'js-cookie';
import axios from "axios";
import TheUserSearchModal from "./TheUserSearchModal";
import { mapGetters } from "vuex"

export default {
  name: "TheBottomNavigation",
  components:{
    TheUserSearchModal
  },
  data() {
    return{
      random_id: '',
      isVisibleUserSearchModal: false,
    }
  },
  mounted() {
    this.fetchRandomUser()
  },
  computed: {
    currentPath() {
      return this.$route.path
    },
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    logoutUser() {
      this.$store.commit('setCurrentUser', { user: null })
      Cookies.remove('vuex');
    },
    async fetchRandomUser() {
      do { await axios.get("/api/random")
        .then((res) => {
          this.random_id = res.data
        })
      } while (this.$route.path === `/${this.random_id}`);
    },
    openUserSearchModal() {
      this.isVisibleUserSearchModal = true;
    },
    handleCloseUserSearchModal() {
      this.isVisibleUserSearchModal = false;
    },
  },
  watch: {
    currentPath: function() {
      this.fetchRandomUser()
    }
  },
}
</script>
<style scoped>
.s-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1;
}
</style>
