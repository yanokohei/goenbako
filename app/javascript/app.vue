<template>
  <div id="app">
    <v-app>
      <TheHeader />
        <v-main>
          <router-view />
          <TheBottomNavigation />
        </v-main>
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

    };
  },
}
</script>


<style scoped>
#app {
  --background-color: #FFFEF6;
  background-color: var(--background-color);
}
.v-application{
  font-family: "Maven Pro" !important;
}
</style>
