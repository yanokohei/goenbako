import Vue from "vue";
import Router from "vue-router";
import TopIndex from "../pages/top/index";
import UserIndex from "../pages/user/index";
import MypageIndex from "../pages/mypage/index";

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: TopIndex,
      name: "TopIndex",
    },
    {
      path: "/mypage",
      component: MypageIndex,
      name: "MypageIndex",
    },
    {
      path: "/:twitter_id",
      component: UserIndex,
      name: "UserIndex",
    },
  ],
  scrollBehavior(to, from, savedPosition) {
    return { x: 0, y: 0 }
  }
})

export default router
