<template>
  <header>
    <v-app-bar
      app
      outlined
      height="60px"
      flat
    >
      <v-toolbar-title>
        <router-link to="/">
          <v-img
            src="/img/logo.svg"
            width="100px"
          />
        </router-link>
      </v-toolbar-title>
      <v-spacer />
      <v-btn
        text
        color="blue"
        x-small
        name="help-box"
        @click="openHelpboxModal"
      >
        <v-icon>{{ svgPath.mdiHelpBox }}</v-icon>
      </v-btn>
      <transition name="fade">
        <TheHelpboxModal
          :is-visible-helpbox-modal="isVisibleHelpboxModal"
          @close-modal="handleCloseHelpboxModal"
        />
      </transition>
    </v-app-bar>
  </header>
</template>

<script>
import { mapGetters } from "vuex"
import TheHelpboxModal from "./TheHelpboxModal";
import { mdiHelpBox } from '@mdi/js'

export default {
  name: "TheHeader",
  components:{
    TheHelpboxModal
  },
  data() {
    return{
      svgPath: {
        mdiHelpBox
      },
      isVisibleHelpboxModal: false,
    }
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    openHelpboxModal() {
      this.isVisibleHelpboxModal = true;
    },
    handleCloseHelpboxModal() {
      this.isVisibleHelpboxModal = false;
    },
  }
}
</script>

<style>
.s-font{
  font-size: 1.2em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
</style>
