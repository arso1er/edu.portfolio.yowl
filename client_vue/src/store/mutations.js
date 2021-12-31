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
};
