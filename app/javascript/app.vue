<template>
  <div id="app">
    <v-app>
      <TheHeader />
        <v-main>
          <router-view />
        </v-main>
      <TheBottomNavigation />
      <TheFooter />
    </v-app>
  </div>
</template>

<script>
import TheHeader from "./components/shared/TheHeader";
import TheFooter from "./components/shared/TheFooter";
import TheBottomNavigation from "./components/shared/TheBottomNavigation";

export default {
  components: {
    TheHeader,
    TheFooter,
    TheBottomNavigation
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
  font-size: 1.3rem;
  font-weight: bold;
  color: #2e1f1f;
}
</style>
