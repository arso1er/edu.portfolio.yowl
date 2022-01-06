// https://router.vuejs.org/guide/advanced/navigation-guards.html#global-resolve-guards
// https://stackoverflow.com/a/43425049

export const isLoggedIn = () => {
  return !!JSON.parse(localStorage.getItem("user"));
};
export const isAdmin = () => {
  if (!isLoggedIn()) return false;
  else return JSON.parse(localStorage.getItem("user")).role === "admin";
};
