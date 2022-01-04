// https://serversideup.net/build-an-api-wrapper-with-vuejs-axios/
export default {
  // apiBaseURL: "http://127.0.0.1:8001/api",
  apiBaseURL:
    process.env.NODE_ENV === "production"
      ? process.env.VUE_APP_API_BASEURL_PROD + "/api"
      : process.env.VUE_APP_API_BASEURL + "/api",
};
