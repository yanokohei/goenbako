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
      @click="logoutUser"
      to="/api/logout"
      data-method="delete"
    >
      <span>Logout</span>

      <v-icon>mdi-home</v-icon>
    </v-btn>
  </v-bottom-navigation>
</template>

<script>
  export default {
  methods: {
    logoutUser() {
      this.$store.dispatch('users/logoutUser');
    }
  }
  }
</script>