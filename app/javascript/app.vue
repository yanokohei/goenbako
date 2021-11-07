<template>
  <div id="app">
    <v-app>
      <TheHeader />
      <router-view />
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
  components: { TheHeader, TheFooter, TheBottomNavigation },
  data() {
    return {
      style: {
        'background-color': '#ffffff'
      }
    };
  },
}
</script>


<style scoped>
#app {
  --background-color: #F7F6F2;
  background-color: var(--background-color);
}

.v-application{
  font-family: "Maven Pro" !important;
}
/* .default {
  background-color: #feeedc;
} */
</style>
