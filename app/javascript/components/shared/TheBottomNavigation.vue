<template>
  <v-bottom-navigation
    absolute
  >
    <v-btn
      :to="{ name: 'MypageIndex' }"
    >
      <span>Home</span>

      <v-icon>mdi-home</v-icon>
    </v-btn>

    <v-btn>
      <span>Write</span>

      <v-icon>mdi-pencil</v-icon>
    </v-btn>

    <v-btn>
      <span>Share</span>

      <v-icon>mdi-twitter</v-icon>
    </v-btn>

    <v-btn
      to="/api/logout"
      data-method="delete"
      @click="logoutUser"
    >
      <span>Logout</span>

      <v-icon>mdi-home</v-icon>
    </v-btn>
  </v-bottom-navigation>
</template>

<script>
import Cookies from 'js-cookie';

  export default {
  methods: {
    logoutUser() {
      this.$store.commit('setCurrentUser', { user:null })
      Cookies.remove('vuex');
    }
  }
}
</script>
