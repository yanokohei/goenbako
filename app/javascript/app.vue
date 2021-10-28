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
    };
  },
}
</script>

<style>

</style>
