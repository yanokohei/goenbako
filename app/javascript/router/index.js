import Vue from "vue";
import Router from "vue-router";
import store from "../store";
import VueGtag from "vue-gtag";
import Top from "../pages/Top";
import User from "../pages/User";
import Mypage from "../pages/Mypage";
import ShowLetter from "../pages/ShowLetter";
import NotFound from "../pages/NotFound";

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
      path: "/letters/:letter_id",
      component: ShowLetter,
      name: "ShowLetter",
    },
    {
      path: "*",
      name: "NotFound",
      component: NotFound,
    },
    { // ログアウト時に一時的にNotFoundに遷移するため配置。
      path: "/api/:logout",
    },
  ];

const router = new Router({
  mode: "history",
  routes,
  scrollBehavior(to, from, savedPosition) {
    return { x: 0, y: 0 }
  },
});

Vue.use(
  VueGtag,
  {
    config: { id: 'UA-217060054-1' },
    appName: 'goenbako',
    pageTrackerScreenviewEnabled: true,
  },
  router
);
router.afterEach((to, from) => {
  if (location.origin.includes('https://goenbako.com'))
  gtag('config', 'UA-217060054-1', { 'page_path': to.path });
})
export default router
