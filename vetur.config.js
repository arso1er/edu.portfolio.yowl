// https://github.com/vuejs/vetur/issues/815#issuecomment-755275073
module.exports = {
  projects: [
    {
      root: "./client_vue", //root of subproject
      package: "./package.json", // It is relative to root property.
      jsconfig: "./jsconfig.json", // It is relative to root property.
    },
  ],
};
