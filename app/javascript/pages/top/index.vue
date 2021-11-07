<template>
  <v-container>
    <v-row>
      <v-col
        justify-center
        align-content="center"
      >
        <v-img
          class="mb-16"
          alt="goenbako"
          src="/img/logo.png"
        />
        <p class="text-h4 text-center indigo--text mb-16">
          ご縁箱を開設して<br>ファンレターを交換してみよう
        </p>
      </v-col>
      <v-col class="text-center">
        <v-btn
          class="mb-5"
          color="primary"
          rounded
          x-large
          href="/api/oauth/twitter"
        >
          Twitter認証して始める
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  name: "TopIndex",
  data() {
    return {
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
    },

  methods: {
    pushLogin() {
      if (this.currentUser) {
        this.$router.push({ name: "UserIndex" })
      } else {
        console.log('success');
      }
    }
  }
}
</script>

<style scoped>
</style>
