import AuthAPI from "@/api/auth";
import CommentsAPI from "@/api/comments";

export default {
  loadEnv({ commit }) {
    commit("loadEnv");
    return true;
  },
  loadUser({ commit }) {
    commit("loadUser");
    return true;
  },
  async register({ commit }, data) {
    const res = await AuthAPI.register(data);
    const user = { token: res.token, ...res.user };
    commit("login", user);
    return user;
  },
  async login({ commit }, data) {
    const res = await AuthAPI.login(data);
    const user = { token: res.token, ...res.user };
    commit("login", user);
    return user;
  },
  async logout({ commit }) {
    try {
      await AuthAPI.logout();
    } catch (error) {
      // Silent fail
    }
    commit("logout");
    return true;
  },

  async createComment({ commit }, data) {
    const res = await CommentsAPI.create(data);
    // console.log(res);
    return res;
  },
};
