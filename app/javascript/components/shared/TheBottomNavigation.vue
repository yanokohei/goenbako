<template>
  <div class="bottom-navi">
    <v-btn
      :to="{ name: 'MypageIndex' }"
    >
      <span>Home</span>

      <v-icon>mdi-home</v-icon>
    </v-btn>

    <v-btn
      to="/api/logout"
      data-method="delete"
      @click="logoutUser"
    >
      <span>Logout</span>

      <v-icon>mdi-logout</v-icon>
    </v-btn>
  </div>
</template>

<script>
import Cookies from 'js-cookie';

export default {
  name: "TheBottomNavigation",
  methods: {
    logoutUser() {
      this.$store.commit('setCurrentUser', { user:null })
      Cookies.remove('vuex');
    },
  }
}
</script>
<style scoped>
.bottom-navi{
  padding: 10px;
}
</style>
