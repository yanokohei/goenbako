<template>
  <div v-show="loading">
    <div class="fullview">
      <div class="loading-spacer"></div>
      <vue-loading
        type="spiningDubbles"
        color="#aaa"
        :size="{ width: '30px', height: '30px' }"
      >
      </vue-loading>
    </div>
  </div>
</template>

<script>
import { VueLoading } from "vue-loading-template";

export default {
  name: "loading",
  components: {
    VueLoading,
  },
  props: {
    loadingState: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      loading: true,
    };
  },
  watch: {
    loadingState: function () {
      if (this.loadingState === "finished") {
        this.loading = false;
      }
    },
  },
};
</script>

<style>
.fullview {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
}
.loading-spacer {
  height: 30%;
}
</style>
