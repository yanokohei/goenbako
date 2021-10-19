import Vue from "vue";
import Router from "vue-router";
import TopIndex from "../pages/top/index";
import UserIndex from "../pages/user/index";

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
      path: "/users/:id",
      name: "UserIndex",
      component: UserIndex,
    },
  ],
})

export default router
