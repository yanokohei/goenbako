<template>
  <v-dialog
    v-model="isVisibleUserSearchModal"
    max-width="315"
    @click:outside="handleCloseModal"
  >
    <v-card
      color="amber lighten-5"
      height="380"
      max-width="400"
    >
      <h3 class="ml-4">
        ユーザー検索
      </h3>
      <v-divider />
      <v-card-text class="mt-4 mb-0 pb-0">
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
          <v-btn
            small
            @click="searchUser"
          >
            <v-icon>mdi-magnify</v-icon>検索
          </v-btn>
        </v-card-actions>
      </v-card-text>
      <v-card
        color="amber lighten-5"
        outlined
        height="160"
        max-width="300"
      >
        <v-card-text class="pb-0 mb-0">
          <transition name="fade">
            <div
              v-if="missingUserSearch"
              class="xs-font mb-2 mt-1 text-center"
            >
              入力内容に誤りがあるか、<br>
              まだご縁箱を開設していないユーザーのようです。
            </div>
          </transition>
          <transition name="fade">
            <TheInviteUser
              v-if="theInviteUser"
              :search-i-d="searchID"
            />
          </transition>
          <div v-if="beforeUserSearch">
            <div class="mt-1 s-font text-center">
              あなたがファンレターを書きたい<br>
              \ ユーザーを検索してみましょう！ /
            </div>
            <v-col class="ma-0 pa-0" align="center">
              <v-img
                src="/img/goenbako_main_illust.png"
                max-width="200px"
              />
            </v-col>
          </div>
        </v-card-text>
      </v-card>
      <div class="pa-0 mt-3" align="center">
        <v-btn
          small
          @click="handleCloseModal"
        >
          閉じる
        </v-btn>
      </div>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex"
import TheInviteUser from "./TheInviteUser";

export default {
  name: "TheUserSearchModal",
  components: {
    TheInviteUser
  },
  props: {
    isVisibleUserSearchModal: {
      type: Boolean,
      required: true,
    },
  },
  data() {
    return {
      searchID: "",
      result: "",
      beforeUserSearch: true,
      missingUserSearch: false,
      theInviteUser: false
    };
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    async searchUser() {
      if (this.searchID != null && this.searchID.length >= 1) {
        await axios.get('/api/search', {
          params: {
            id: this.searchID
          }
        })
        .then((res) => {
          this.result = res.data
          if (this.result === true) {
            this.$router.push({ name: 'User', params: { twitter_id: this.searchID }});
            this.handleCloseModal();
            this.$store.dispatch("flash/setFlash", {
              type: "success",
              message: "検索に成功しました。"
            })
          }
          else {
            this.$store.dispatch("flash/setFlash", {
              type: "error",
              message: "検索に失敗しました。"
            })
            this.beforeUserSearch = false
            this.missingUserSearch = true
            this.theInviteUser = true
          }
        })
      }
    },
    handleCloseModal() {
      this.searchID = "";
      this.beforeUserSearch = true
      this.missingUserSearch = false
      this.theInviteUser = false
      this.$emit("close-modal");
    },
  }
};
</script>

<style scoped>
.xs-font{
  font-size: 0.55em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.s-font{
  font-size: 0.75em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.modal {
  display: block;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
.fade-enter-to, .fade-leave {
  opacity: 3;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity 2s;
}
</style>
