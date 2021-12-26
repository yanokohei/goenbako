import Vue from "vue";
import Router from "vue-router";
import Top from "../pages/Top";
import User from "../pages/User";
import Mypage from "../pages/Mypage";

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: Top,
      name: "Top",
    },
    {
      path: "/mypage",
      component: Mypage,
      name: "Mypage",
    },
    {
      path: "/:twitter_id",
      component: User,
      name: "User",
    },
  ],
  scrollBehavior(to, from, savedPosition) {
    return { x: 0, y: 0 }
  }
})

export default router
