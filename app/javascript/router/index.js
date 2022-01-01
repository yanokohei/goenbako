import Vue from "vue";
import Router from "vue-router";
import store from "../store";
import Top from "../pages/Top";
import User from "../pages/User";
import Mypage from "../pages/Mypage";
import ShowLetter from "../pages/ShowLetter";

Vue.use(Router)

  const routes = [
    {
      path: "/",
      component: Top,
      name: "Top",
    },
    {
      path: "/mypage",
      component: Mypage,
      name: "Mypage",
      meta: { requiredLogin: true }
    },
    {
      path: "/:twitter_id",
      component: User,
      name: "User",
    },
    {
      path: "/:twitter_id/letters/:letter_id",
      component: ShowLetter,
      name: "ShowLetter",
    },
  ];

const router = new Router({
  mode: "history",
  routes,
  scrollBehavior(to, from, savedPosition) {
    return { x: 0, y: 0 }
  },
});

export default router
