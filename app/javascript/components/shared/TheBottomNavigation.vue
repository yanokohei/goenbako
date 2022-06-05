<template>
  <v-row align="center" justify="center" class="mb-0 mt-0">
    <v-btn v-if="!currentUser" :to="{ name: 'Top' }">
      <span>Top</span>
      <v-img src="/img/icon_parts.svg" max-width="17px" />
    </v-btn>

    <v-btn v-if="currentUser" :to="{ name: 'Mypage' }">
      <span>Home</span>

      <v-icon>{{ svgPath.mdiHome }}</v-icon>
    </v-btn>

    <v-btn id="random" @click="hundleRandomButton" :disabled="isRandomButton">
      <span>Random</span>

      <v-icon>{{ svgPath.mdiPaw }}</v-icon>
    </v-btn>

    <v-btn v-if="!currentUser" @click="openUserSearchModal">
      <span>Search</span>

      <v-icon>{{ svgPath.mdiAccountSearchOutline }}</v-icon>
    </v-btn>
    <v-btn v-if="currentUser" @click="openFollowListModal">
      <span>Friends</span>

      <v-icon>{{ svgPath.mdiAccountMultiple }}</v-icon>
    </v-btn>
    <v-menu
      v-if="currentUser"
      transition="slide-y-transition"
      bottom
      top
      offset-y
    >
      <template #activator="{ on, attrs }">
        <v-btn text color="blue" v-bind="attrs" x-small v-on="on">
          <span>Menu</span>

          <v-icon>{{ svgPath.mdiMenu }}</v-icon>
        </v-btn>
      </template>
      <v-list class="s-font nowrap" v-if="currentUser">
        <v-list-item @click="openUserSearchModal" small text>
          <v-icon>{{ svgPath.mdiAccountMultiple }}</v-icon>
          <span class="pl-1">ユーザー検索</span>
        </v-list-item>
      </v-list>
      <v-list class="s-font nowrap" v-if="currentUser.role === 'admin'">
        <v-list-item href="/admin" small text>
          <v-icon>{{ svgPath.mdiAccountStar }}</v-icon>
          <span class="pl-1">管理画面</span>
        </v-list-item>
      </v-list>
      <v-list class="s-font nowrap">
        <v-list-item :to="{ name: 'Setting' }" small text>
          <v-icon>{{ svgPath.mdiCog }}</v-icon>
          <span class="pl-1">設定</span>
        </v-list-item>
      </v-list>
      <v-list class="s-font nowrap">
        <v-list-item
          to="/api/logout"
          data-method="delete"
          small
          text
          @click="logoutUser"
        >
          <v-icon>{{ svgPath.mdiLogout }}</v-icon>
          ログアウト
        </v-list-item>
      </v-list>
    </v-menu>
    <transition name="fade">
      <TheUserSearchModal
        :is-visible-user-search-modal="isVisibleUserSearchModal"
        @close-modal="handleCloseUserSearchModal"
      />
    </transition>
    <transition name="fade">
      <TheFollowListModal
        :following-members="followingMembers"
        :is-visible-follow-list-modal="isVisibleFollowListModal"
        @close-follow-list-modal="handleCloseFollowListModal"
        :loading-state="loadingState"
        :members-zero="membersZero"
      />
    </transition>
  </v-row>
</template>

<script>
import Cookies from "js-cookie";
import axios from "axios";
import TheUserSearchModal from "./TheUserSearchModal";
import TheFollowListModal from "./TheFollowListModal";
import { mapGetters } from "vuex";
import {
  mdiHome,
  mdiPaw,
  mdiAccountSearchOutline,
  mdiMenu,
  mdiAccountStar,
  mdiCog,
  mdiLogout,
  mdiAccountMultiple,
} from "@mdi/js";

export default {
  name: "TheBottomNavigation",
  components: {
    TheUserSearchModal,
    TheFollowListModal,
  },
  data() {
    return {
      svgPath: {
        mdiHome,
        mdiPaw,
        mdiAccountSearchOutline,
        mdiMenu,
        mdiAccountStar,
        mdiCog,
        mdiLogout,
        mdiAccountMultiple,
      },
      random_id: "",
      isVisibleUserSearchModal: false,
      isVisibleFollowListModal: false,
      isRandomButton: false,
      followingMembers: [],
      loadingState: "",
      membersZero: false,
    };
  },
  computed: {
    currentPath() {
      return this.$route.path;
    },
    ...mapGetters({
      currentUser: "users/currentUser",
      fetchedFollowingMembers: "following_members/fetchedFollowingMembers",
    }),
  },
  watch: {
    currentPath: function () {
      this.fetchRandomUser();
    },
  },
  mounted() {
    this.fetchRandomUser();
  },
  methods: {
    hundleRandomButton() {
      this.$router.push({
        name: "User",
        params: { twitter_id: this.random_id },
      });
      this.isRandomButton = true;
      setTimeout(() => (this.isRandomButton = false), 300);
    },
    logoutUser() {
      this.$store.commit("setCurrentUser", { user: null });
      Cookies.remove("vuex");
    },
    async fetchRandomUser() {
      do {
        await axios.get("/api/random").then((res) => {
          this.random_id = res.data;
        });
      } while (this.$route.path === `/${this.random_id}`);
    },
    openUserSearchModal() {
      this.isVisibleUserSearchModal = true;
    },
    openFollowListModal() {
      this.fetchFollowList();
      this.isVisibleFollowListModal = true;
    },
    handleCloseUserSearchModal() {
      this.isVisibleUserSearchModal = false;
    },
    handleCloseFollowListModal() {
      this.isVisibleFollowListModal = false;
    },
    fetchFollowList() {
      if (this.fetchedFollowingMembers) {
        this.loadingState = "finished";
        this.followingMembers = this.fetchedFollowingMembers;
        return;
      }
      axios
        .get("/api/twitter_follow_list")
        .then((res) => {
          res.data.length == 0
            ? (this.membersZero = true)
            : (this.followingMembers = res.data);
          this.$store.commit(
            "following_members/setFollowingMembers",
            this.followingMembers
          );
        })
        .catch((error) =>
          alert("フォロー数の取得上限を超えている可能性があります。")
        )
        .finally(() => (this.loadingState = "finished"));
    },
  },
};
</script>
<style scoped>
.s-font {
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1;
}
.nowrap {
  white-space: nowrap;
}
</style>
