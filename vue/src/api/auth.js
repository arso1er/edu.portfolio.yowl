import axios from "axios";
import getToken from "./token";
import config from "./config";

const { apiBaseURL } = config;

export default {
  async register(data) {
    const res = await axios({
      method: "POST",
      url: `${apiBaseURL}/register`,
      data,
      headers: {
        Accept: "application/json",
        "content-type": "multipart/form-data",
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
