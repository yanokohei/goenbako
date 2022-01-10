<template>
  <header>
    <v-app-bar
      app
      outlined
      height="60px"
      flat
    >
      <v-toolbar-title>
        <router-link to="/">
          <v-img
            src="/img/logo.svg"
            width="100px"
          />
        </router-link>
      </v-toolbar-title>
      <v-spacer />
    <v-btn
      to="/api/logout"
      data-method="delete"
      @click="logoutUser"
      v-if="currentUser"
      x-small
    >
      <span>ログアウト</span>
    </v-btn>
    </v-app-bar>
  </header>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex"
export default {
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    logoutUser() {
      this.$store.commit('setCurrentUser', { user: null })
      Cookies.remove('vuex');
    },
  }
}
</script>

<style>

</style>
