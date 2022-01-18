<template>
  <v-dialog
    v-model="isVisibleLoginGuidanceModal"
    max-width="315"
    @click:outside="handleCloseModal"
  >
    <v-card color="amber lighten-5" max-width="300" >
      <div>
        <v-col align="center" class="">
          <p class="s-font">＼ W E L C O M E !! ／</p>
          <p> まずはご縁箱を開設してみましょう !</p>
          <v-img
            src="/img/goenbako_main_illust.png"
            max-width="130px"
            height="45"
          />
        </v-col>
      <v-col class="text-center">
        <v-btn
          color="orange lighten-1"
          class="white--text s-font"
          small
          :to="{ name: 'Top' }"
        >
          <v-img
            src="/img/favicon.ico"
            max-width="27px"
          />
          トップページからログインする
        </v-btn>
      </v-col>
      <v-col class="text-center mt-2">
        <v-btn
          color="blue"
          class="white--text s-font"
          small
          style="text-transform: none"
          href="/api/oauth/twitter"
        >
          <v-icon>mdi-twitter</v-icon>
          Twitter認証してすぐに始める
        </v-btn>
      </v-col>
        <v-col align="center" justify="center" class="pa-6">
          <v-btn
            @click="handleCloseModal"
          >
            閉じる
          </v-btn>
        </v-col>
      </div>
    </v-card>
  </v-dialog>
</template>

<script>

export default {
  name: "TheLoginGuidanceModal",
  props: {
    isVisibleLoginGuidanceModal: {
      type: Boolean,
      required: true,
    },
  },
  data() {
    return {

    };
  },
  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    },
  }
};
</script>

<style scoped>
.s-font{
  font-size: 0.9em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
p {
  font-size: 0.7em;
  font-weight: bold;
  color: #2c281e;

}
.nowrap{
  white-space: nowrap
}
</style>
