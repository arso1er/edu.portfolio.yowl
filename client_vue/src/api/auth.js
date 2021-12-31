import axios from "axios";
import getToken from "./token";

// https://serversideup.net/build-an-api-wrapper-with-vuejs-axios/
const apiBaseURL = "http://127.0.0.1:8001/api";

export default {
  async register(data) {
    const res = await axios({
      method: "POST",
      url: `${apiBaseURL}/register`,
      data: new URLSearchParams(data),
      headers: {
        Accept: "application/json",
        "content-type": "application/x-www-form-urlencoded",
      },
    });

    return res.data;
  },
  async login(data) {
    const res = await axios({
      method: "POST",
      url: `${apiBaseURL}/login`,
      data: new URLSearchParams(data),
      headers: {
        Accept: "application/json",
        "content-type": "application/x-www-form-urlencoded",
      },
    });

    return res.data;
  },
  async logout() {
    await axios({
      method: "POST",
      url: `${apiBaseURL}/logout`,
      headers: {
        Accept: "application/json",
        Authorization: `Bearer ${getToken()}`,
      },
    });
  },
};
