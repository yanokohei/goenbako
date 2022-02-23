<template>
  <div id="app">
    <v-app>
      <TheHeader />
      <v-main>
        <TheFlashMessage v-if="isFlash" />
        <transition
          name="slide"
          mode="out-in"
        >
          <router-view
            :key="$route.fullPath"
          />
        </transition>
        <v-row class="ma-6" />
      </v-main>
      <v-bottom-navigation
        app
        color="primary"
        height="70"
      >
        <TheBottomNavigation />
      </v-bottom-navigation>
      <!-- <TheFooter /> -->
    </v-app>
  </div>
</template>

<script>
import TheHeader from "./components/shared/TheHeader";
import TheFlashMessage from "./components/shared/TheFlashMessage";
import TheBottomNavigation from "./components/shared/TheBottomNavigation";
import { mapGetters } from "vuex"

export default {
  components: {
    TheHeader,
    TheFlashMessage,
    TheBottomNavigation
  },
  computed: {
    ...mapGetters({
      isFlash: "flash/isFlash",
      currentUser: "users/currentUser" }),
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
.slide-enter-active {
  transition: all .5s, opacity .5s;
}
.slide-enter {
  transform: translateY(-20px);
  opacity: 0;
}
</style>
