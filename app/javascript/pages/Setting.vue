<template>
  <v-container v-if="currentUser" class="mb-16">
    <v-row
      class="ma-8"
      justify="center"
    >
      <ProfileCard />
    </v-row>
    <div align="center">
      <v-card max-width="650" class="left" color="transparent" outlined>
        <h3 class="ml-4 mt-6">
          ・メール通知設定
        </h3>
        <v-divider />
      </v-card>
    </div>
    <div align="center" class="mt-4">
      <v-card max-width="310" class="left" color="transparent" outlined>
        <validation-observer
          ref="observer"
          v-slot="{ invalid }"
        >
          <form @submit.prevent="handleUpdateUserSetting(setting)">
            <validation-provider
              v-slot="{ errors }"
              rules="email_required"
            >
              <v-text-field
                v-model="currentUser.email"
                :error-messages="errors"
                label="Email"
                required
                placeholder="例)goenbako1@example.com"
              />
            </validation-provider>
            <div class="xs-font option mb-4">
              <p class="ml-2">※レターを受け取った際にメールでお知らせします。</p>
            </div>
            <div class="justify-center mb-5 pa-4 btn-position">
              <v-btn
                color="green"
                class="white--text m-font"
                rounded
                small
                :disabled="invalid"
                @click="handleUpdateEmail"
              >
                <v-icon>{{ svgPath.mdiCheck }}</v-icon>
                <span class="m-font white--text ml-2">設定を保存する</span>
              </v-btn>
              <v-btn
                rounded
                small
                @click="handleDeleteEmail"
              >
                解除する
              </v-btn>
            </div>
          </form>
        </validation-observer>
      </v-card>
    </div>
    <div align="center">
      <v-card max-width="650" class="left" color="transparent" outlined>
        <h3 class="ml-4 mt-6">
          ・プロフィール情報を更新する
        </h3>
        <v-divider />
      </v-card>
    </div>
    <div align="center" class="mt-4">
      <v-card max-width="310" class="left" color="transparent" outlined>
        <div class="xs-font option mt-4 mb-4">
          <p class="ml-2">・Twitterの最新のプロフィール情報を再取得します。</p>
        </div>
        <div class="justify-center mt-4 mb-4 btn-position">
          <v-btn
            rounded
            small
            color="blue"
            class="white--text m-font"
            @click="handleFetchTwitterData"
          >
            再取得する
          </v-btn>
        </div>
      </v-card>
    </div>
    <div align="center">
      <v-card max-width="650" class="left" color="transparent" outlined>
        <h3 class="ml-4 mt-6">
          ・その他
        </h3>
        <v-divider />
      </v-card>
    </div>
    <div align="center" class="mt-4 mb-16">
      <v-card max-width="310" class="left" color="transparent" outlined>
        <div class="justify-center mt-4 mb-2 btn-position">
          <v-btn
            rounded
            small
            :disabled="!checkbox"
            @click="deleteUser"
          >
            ご縁箱を退会する
          </v-btn>
        </div>
        <div class="xs-font mb-4 check-area ml-4">
          <v-checkbox class="checkbox" v-model="checkbox" />
          <p>退会した場合、全ての情報が削除されます。</p>
        </div>
      </v-card>
    </div>
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";
import ProfileCard from "../components/ProfileCard";
import { mdiCheck } from '@mdi/js'

export default {
  name: "Setting",
  components: {
    ProfileCard,
  },
  data () {
    return {
      svgPath: {
        mdiCheck
      },
      checkbox: false
    }
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  mounted() {
    document.title = "設定ページ - ご縁箱"
  },
  methods: {
    handleUpdateEmail() {
      axios
        .patch(("/api/settings"), { email: this.currentUser.email })
        .then(this.$store.dispatch("flash/setFlash", {
          type: "success",
          message: "設定を更新しました。"
        }))
        .catch((error) => {
          this.$store.dispatch("flash/setFlash", {
            type: 'error',
            message: '設定を更新できませんでした',
          })
        })
    },
    handleDeleteEmail() {
      this.currentUser.email = ""
      axios
        .patch(("/api/settings"), { email: this.currentUser.email })
        .then(this.$store.dispatch("flash/setFlash", {
          type: "success",
          message: "メール通知を解除しました。"
        }))
        .catch((error) => {
          this.$store.dispatch("flash/setFlash", {
            type: 'error',
            message: '設定を更新できませんでした',
          })
        })
    },
    handleFetchTwitterData() {
      axios.patch(("/api/twitter_data"))
      .then((res) => {
        this.$store.dispatch("users/fetchTwitterData", res.data)
      })
      .then(this.$store.dispatch("flash/setFlash", {
        type: "success",
        message: "プロフィールを更新しました。"
      }))
      .catch((error) => {
        this.$store.dispatch("flash/setFlash", {
          type: 'error',
          message: 'プロフィールを更新できませんでした',
        })
      })
    },
    deleteUser() {
      axios.delete("/api/settings")
      .then((res) => {
        this.$store.dispatch("users/deleteCurrentUser")
        this.$router.push({ name: "Top" })
        this.$store.dispatch("flash/setFlash", {
          type: "success",
          message: "退会が完了しました。"
        })
      })
    },
  }
};
</script>

<style scoped>
.xs-font {
  font-size: 0.75em;
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
.checkbox {
  max-width: 3%;
  margin: -5px;
}
.check-area {
  display: flex;
  gap: 30px;
}
.btn-position {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}
</style>
