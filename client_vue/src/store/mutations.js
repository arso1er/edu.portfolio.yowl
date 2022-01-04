export default {
  loadUser(state) {
    state.user = JSON.parse(localStorage.getItem("user")) || null;
  },
  login(state, user) {
    localStorage.setItem("user", JSON.stringify(user));
    state.user = user;
  },
  logout(state) {
    state.user = null;
    localStorage.removeItem("user");
  },
  loadEnv(state) {
    state.env = {
      apiBaseUrl:
        process.env.NODE_ENV === "production"
          ? process.env.VUE_APP_API_BASEURL_PROD
          : process.env.VUE_APP_API_BASEURL,
    };
  },
};
