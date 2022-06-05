<template>
  <v-dialog
    v-model="isVisibleFollowListModal"
    persistent
    scrollable
    max-width="400"
    @click:outside="handleCloseModal"
  >
    <v-card color="amber lighten-5" min-height="500">
      <v-card-title>
        <v-icon>{{ svgPath.mdiAccountMultiple }}</v-icon>
        <span class="m-font">フォローリスト</span>
      </v-card-title>
      <v-divider />
      <v-card-text
        class="pa-0 show-scrollbar following-list-wrap"
        style="height: 380px"
      >
        <div v-if="membersZero" class="s-font mt-4">
          フォローしているご縁箱ユーザーが見つかりませんでした。
        </div>
        <div v-for="(friend, index) in followingMembers" :key="index">
          <v-card flat color="transparent" rounded="xl" class="my-1">
            <v-card-title class="mt-0 pt-0 pb-2">
              <v-list-item-avatar
                class="pa-0 mr-2 ml-1"
                size="45"
                @click="moveFriendPage(friend.twitter_id)"
              >
                <img
                  :src="
                    'https://pbs.twimg.com' +
                    friend.image.path.replace('_normal', '')
                  "
                />
              </v-list-item-avatar>
              <v-list-item-content class="pa-0">
                <v-list-item-title class="s-font">
                  {{ friend.name }}
                </v-list-item-title>
                <v-list-item-subtitle>
                  @{{ friend.twitter_id }}
                </v-list-item-subtitle>
              </v-list-item-content>
            </v-card-title>
          </v-card>
        </div>
      </v-card-text>
      <div class="pa-0 mt-3 pb-4" align="center">
        <v-btn small @click="handleCloseModal"> 閉じる </v-btn>
      </div>
      <TheLoading :loading-state="loadingState" v-if="!loadingState" />
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import { mdiMagnify, mdiTwitter, mdiAccountMultiple } from "@mdi/js";
import TheLoading from "./TheLoading";

export default {
  name: "TheFollowListModal",
  components: {
    TheLoading,
  },
  props: {
    isVisibleFollowListModal: {
      type: Boolean,
      required: true,
    },
    followingMembers: {
      type: Array,
      required: true,
    },
    loadingState: {
      type: String,
      required: true,
    },
    membersZero: {
      type: Boolean,
      required: true,
    },
  },
  data() {
    return {
      svgPath: {
        mdiMagnify,
        mdiTwitter,
        mdiAccountMultiple,
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
.following-list-wrap {
  margin: 0 auto;
  width: 95%;
  display: block;
}
</style>
