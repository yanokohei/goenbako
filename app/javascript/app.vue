<template>
  <div id="app">
    <v-app>
      <TheHeader />
      <v-main>
        <TheFlashMessage v-if="isFlash" />
        <router-view />
        <v-row class="ma-8" />
      </v-main>
      <v-bottom-navigation app color="primary">
        <TheBottomNavigation
          v-if="currentUser"
        />
      </v-bottom-navigation>
      <TheFooter />
    </v-app>
  </div>
</template>

<script>
import TheHeader from "./components/shared/TheHeader";
import TheFooter from "./components/shared/TheFooter";
import TheFlashMessage from "./components/shared/TheFlashMessage";
import TheBottomNavigation from "./components/shared/TheBottomNavigation";
import { mapGetters } from "vuex"

export default {
  components: {
    TheHeader,
    TheFooter,
    TheFlashMessage,
    TheBottomNavigation
  },
  computed: {
    ...mapGetters({
      isFlash: "flash/isFlash",
      currentUser: "users/currentUser" }),
    // isCurrentUser() {
    // return this.currentUser === true
    // }
  },
}
</script>


<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Comforter+Brush&family=Yomogi&display=swap');
#app {
  --background-color: #FFFFF8;
  background-color: var(--background-color);
  font-family: 'Comforter Brush', cursive;
  font-family: 'Yomogi', cursive;
  font-size: 1.0rem;
  font-weight: bold;
  color: #2e1f1f;
}
</style>
