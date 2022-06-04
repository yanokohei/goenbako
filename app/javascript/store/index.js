import Vue from "vue";
import Vuex from "vuex";
import users from "./users";
import helpbox from "./helpbox";
import following_members from "./following_members";
import flash from "./flash";
import createPersistedState from "vuex-persistedstate";
import Cookies from "js-cookie";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    users,
    flash,
    helpbox,
    following_members,
  },

  plugins: [
    createPersistedState({
      storage: {
        key: "goenbakoApp",

        paths: ["users.currentUser"],
        getItem: (key) => Cookies.get(key),
        setItem: (key, value) =>
          Cookies.set(key, value, { expires: 14, secure: true }), // 14日間有効
        removeItem: (key) => Cookies.remove(key),
      },
    }),
  ],
});
