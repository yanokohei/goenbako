<template>
  <v-container v-if="currentUser">
    <v-row
      class="ma-8"
      justify="center"
    >
      <ProfileCard />
    </v-row>
    <div align="center">
      <v-card max-width="650" class="left" color="transparent" outlined>
        <h3 class="ml-4 mt-4">
          ・メール通知設定
        </h3>
        <v-divider />
      </v-card>
    </div>
    <div align="center">
      <v-card max-width="330" class="left" color="transparent" outlined>
        <div class="xs-font option">
          <p class="mt-4 ml-4">レターを受け取った際に<br>メールを受け取る</p>
          <v-switch
            v-model="nofitication"
            @click="hundleNofiticationSwitch()"
            class="xs-font switch"
          />
        </div>
      </v-card>
    </div>
    <v-row class="justify-center mb-5 pa-4">
      <v-btn
        color="green"
        class="white--text m-font"
        rounded
        large
      >
        <v-icon>mdi-check</v-icon>
        <span class="m-font white--text ml-2">設定を保存する</span>
      </v-btn>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import ProfileCard from "../components/ProfileCard";

export default {
  name: "Setting",
  components: {
    ProfileCard,
  },
  data () {
    return {
      nofitication: true,
    }
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    hundleNofiticationSwitch() {
      console.log(this.nofitication);
    },
  }
};
</script>

<style scoped>
.xs-font {
  font-size: 0.85em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.m-font {
  font-size: 1.0em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
.left {
  text-align: left;
}
.switch {
  max-width: 10%;
}
.option {
  display: flex;
  gap: 80px;
}
</style>
