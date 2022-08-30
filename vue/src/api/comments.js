import axios from "axios";
import getToken from "./token";
import config from "./config";

const { apiBaseURL } = config;

export default {
  async index(params) {
    const { site, stars, user, sort, page, per_page } = params;

    const res = await axios({
      method: "GET",
      url: `${apiBaseURL}/comments`,
      headers: {
        Accept: "application/json",
      },
      params: {
        site: site || "",
        stars: stars || "",
        user: user || "",
        sort: sort || "",
        page: page || 1,
        per_page: per_page || 10,
      },
    });
    return res.data;
  },
  async create(data) {
    const res = await axios({
      method: "POST",
      url: `${apiBaseURL}/comments`,
      data: new URLSearchParams(data),
      headers: {
        Accept: "application/json",
        "content-type": "application/x-www-form-urlencoded",
        Authorization: `Bearer ${getToken()}`,
      },
    });
    return res.data;
  },
  async show(id) {
    const res = await axios({
      method: "GET",
      url: `${apiBaseURL}/comments/${id}`,
      headers: { Accept: "application/json" },
    });
    return res.data;
  },
  async update(id, data) {
    const res = await axios({
      method: "PUT",
      url: `${apiBaseURL}/comments/${id}`,
      data: new URLSearchParams(data),
      headers: {
        Accept: "application/json",
        "content-type": "application/x-www-form-urlencoded",
        Authorization: `Bearer ${getToken()}`,
      },
    });
    return res.data;
  },
  async delete(id) {
    const res = await axios({
      method: "DELETE",
      url: `${apiBaseURL}/comments/${id}`,
      headers: {
        Accept: "application/json",
        Authorization: `Bearer ${getToken()}`,
      },
    });
    return res.data;
  },
  async search(params) {
    const { site, stars, sort, page, per_page } = params;

    const res = await axios({
      method: "GET",
      url: `${apiBaseURL}/comments/search`,
      headers: {
        Accept: "application/json",
      },
      params: {
        site: site || "",
        stars: stars || "",
        sort: sort || "",
        page: page || 1,
        per_page: per_page || 10,
      },
    });
    return res.data;
  },
};
