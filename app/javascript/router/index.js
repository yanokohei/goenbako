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
      path: "/users/:id",
      component: UserIndex,
      name: "UserIndex",
    },
  ],
})

export default router
