<template>
  <v-dialog
    v-model="isVisibleFollowListModal"
    max-width="315"
    @click:outside="handleCloseModal"
  >
    <v-card color="amber lighten-5" height="380" max-width="400">
      <h3 class="ml-4">フォローリスト</h3>
      <v-divider />
      <v-btn small @click="fetchFollowList()"> 取得 </v-btn>
      <!-- <v-card-text class="mt-4 mb-0 pb-0">
        <v-text-field
          v-model="searchID"
          background-color="#FFFFF0"
          label="TwitterID検索"
          persistent-hint
          outlined
          dense
          placeholder="@を省略して入力してください"
          class="ma-0 mb-0 pb-0"
        />
        <v-card-actions class="justify-center pt-0 pb-1">
          <v-btn small @click="searchUser">
            <v-icon>{{ svgPath.mdiMagnify }}</v-icon
            >検索
          </v-btn>
        </v-card-actions>
      </v-card-text> -->
      <div class="pa-0 mt-3" align="center">
        <v-btn small @click="handleCloseModal"> 閉じる </v-btn>
      </div>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import { mdiMagnify } from "@mdi/js";

export default {
  name: "TheFollowListModal",
  components: {},
  props: {
    isVisibleFollowListModal: {
      type: Boolean,
      required: true,
    },
  },
  data() {
    return {
      svgPath: {
        mdiMagnify,
      },
      searchID: "",
      result: "",
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    handleCloseModal() {
      this.$emit("close-follow-list-modal");
    },
    fetchFollowList() {
      axios
        .get("/api/twitter_follow_list")
        .then((res) => console.log(res.data))
        .catch((error) => console.log(error));
    },
  },
};
</script>

<style scoped>
.xs-font {
  font-size: 0.55em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.s-font {
  font-size: 0.75em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.modal {
  display: block;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
.fade-enter-to,
.fade-leave {
  opacity: 3;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 2s;
}
</style>
