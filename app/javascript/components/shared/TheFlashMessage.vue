<template>
  <v-fade-transition>
    <div class="flash">
      <v-alert
        dense
        outlined
        :type="flash.type"
      >
        {{ flash.message }}
      </v-alert>
    </div>
  </v-fade-transition>
</template>

<script>
import { mapGetters } from "vuex"
export default {
  data() {
    return {
      isShow: true
    }
  },
  computed: {
    ...mapGetters({ flash: "flash/flash" })
  },
  mounted() {
    setTimeout(() => {
      this.$store.dispatch("flash/setFlash", {
        type: "",
        message: ""
      })
    }, 2000)
  }
}
</script>

<style scoped>
.flash {
  position: fixed;
  top: 60px;
  left: 20px;
  max-width: 500px;
  z-index: 10000;
}
.v-alert--outlined {
  background: rgb(255, 255, 255) !important;
}
.v-alert {
  font-size: 1.1em;
}
</style>
