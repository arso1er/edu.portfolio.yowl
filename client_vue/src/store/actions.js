import AuthAPI from "@/api/auth";

export default {
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
    await AuthAPI.logout();
    commit("logout");
    return true;
  },
};
