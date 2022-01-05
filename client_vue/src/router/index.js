import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/Home.vue";
import { isLoggedIn, isAdmin } from "./guards";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/register",
    name: "Register",
    // route level code-splitting
    // this generates a separate chunk (register.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "register" */ "../views/Register.vue"),
    beforeEnter: (to, from, next) => {
      // console.log(to);
      if (!isLoggedIn()) {
        next(); // make sure to always call next()!
      } else {
        next({
          path: "/",
          // query: { redirect: to.fullPath },
        });
      }
    },
  },
  {
    path: "/login",
    name: "Login",
    component: () => import("../views/Login.vue"),
    beforeEnter: (to, from, next) => {
      // console.log(to);
      if (!isLoggedIn()) {
        next(); // make sure to always call next()!
      } else {
        next({
          path: "/",
          // query: { redirect: to.fullPath },
        });
      }
    },
  },
  {
    path: "/users/:id",
    name: "UserComments",
    component: () => import("../views/Comments/UserComments.vue"),
  },
  {
    path: "/comments/add",
    name: "AddComment",
    component: () => import("../views/Comments/AddComment.vue"),
    beforeEnter: (to, from, next) => {
      // console.log(to);
      if (isLoggedIn()) {
        next(); // make sure to always call next()!
      } else {
        next({
          path: "/login",
          // query: { redirect: to.fullPath },
        });
      }
    },
  },
  {
    path: "/comments/:id",
    name: "ShowComment",
    component: () => import("../views/Comments/ShowComment.vue"),
  },
  {
    path: "/search",
    name: "Search",
    component: () => import("../views/Search.vue"),
  },
  {
    path: "/sites/:link",
    name: "ShowSite",
    component: () => import("../views/Comments/ShowSite.vue"),
  },
  {
    path: "/my-profile",
    name: "Profile",
    component: () => import("../views/Profile.vue"),
    beforeEnter: (to, from, next) => {
      // console.log(to);
      if (isLoggedIn()) {
        next(); // make sure to always call next()!
      } else {
        next({
          path: "/login",
          // query: { redirect: to.fullPath },
        });
      }
    },
  },
  {
    path: "/dashboard/admin",
    name: "AdminDashboard",
    component: () => import("../views/Dashboard/AdminDashboard.vue"),
    beforeEnter: (to, from, next) => {
      // console.log(to);
      if (!isLoggedIn()) {
        next({
          path: "/login",
          // query: { redirect: to.fullPath },
        });
      } else if (!isAdmin()) {
        next({
          path: "/",
          // query: { redirect: to.fullPath },
        });
      } else {
        next();
      }
    },
  },
  {
    path: "/dashboard/admin/users",
    name: "AdminDashboardUsers",
    component: () => import("../views/Dashboard/AdminDashboardUsers.vue"),
    beforeEnter: (to, from, next) => {
      // console.log(to);
      if (!isLoggedIn()) {
        next({
          path: "/login",
          // query: { redirect: to.fullPath },
        });
      } else if (!isAdmin()) {
        next({
          path: "/",
          // query: { redirect: to.fullPath },
        });
      } else {
        next();
      }
    },
  },
  // Always leave this as last one,
  // but you can also remove it
  {
    path: "/:catchAll(.*)*",
    component: () => import("../views/Error404.vue"),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
