<template>
  <div class="bottom-navi">
    <v-btn
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
      :to="{ name: 'Mypage' }"
    >
      <span>Search</span>

      <v-icon>mdi-account-search-outline</v-icon>
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
import axios from "axios";

export default {
  name: "TheBottomNavigation",
  data() {
    return{
      random_id: ''
    }
  },
  mounted() {
    this.fetchRandomUser()
  },
  computed: {
    currentPath() {
      return this.$route.path
    },
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
    }
  },
  watch: {
    currentPath: function() {
      this.fetchRandomUser()
    }
  },
}
</script>
<style scoped>
.bottom-navi{
  padding: 10px;
}
</style>
