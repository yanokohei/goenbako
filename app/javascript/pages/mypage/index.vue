<template>
  <v-container>
    <v-row class="ma-8" justify="center">
      <ProfileCard />
  <!-- シェアボタン -->
    </v-row>
      <v-col class="text-center mb-12">
        <v-btn
          color="blue"
          class="white--text"
          rounded
          x-large
          href="#"
        >
          Myご縁箱をシェアする
        </v-btn>
      </v-col>
    <LetterListTab />
  </v-container>
</template>

<script>
import { mapGetters } from "vuex"
import ProfileCard from "../components/ProfileCard";
import LetterListTab from "../components/LetterListTab";

export default {
  name: "MypageIndex",
  components: {
    ProfileCard,
    LetterListTab
  },
  data() {
    return {
      user: {}
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  mounted() {
    this.$axios.get("/users/me")
    .then((res) => {
      this.user = res.data
      this.$store.commit('users/setCurrentUser', res.data)
    })
  }
};
</script>

<style scoped>
</style>
