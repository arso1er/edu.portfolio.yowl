import axios from "axios";
import config from "./config";
import getToken from "./token";

const { apiBaseURL } = config;

export default {
  // async index() {
  //   const res = await axios({
  //     method: "GET",
  //     url: apiBaseURL + "?orderby=id&order=asc",
  //     headers: { Authorization: `Bearer ${getToken()}` },
  //   });
  //   // console.log(res.data);
  //   // window.t = res.data;
  //   return res.data;
  // },
  //   async create(data) {
  //     const res = await axios({
  //       method: "POST",
  //       url: `${apiBaseURL}/comments`,
  //       data: new URLSearchParams(data),
  //       headers: {
  //         Accept: "application/json",
  //         "content-type": "application/x-www-form-urlencoded",
  //         Authorization: `Bearer ${getToken()}`,
  //       },
  //     });
  //     // console.log(res.data);
  //     return res.data;
  //   },
  async show(id) {
    const res = await axios({
      method: "GET",
      url: `${apiBaseURL}/users/${id}`,
      headers: {
        Accept: "application/json",
      },
    });
    // console.log(res.data);
    return res.data;
  },
  async update(id, data) {
    // https://stackoverflow.com/a/61768745
    const res = await axios({
      method: "POST",
      url: `${apiBaseURL}/users/${id}`,
      data,
      headers: {
        Accept: "application/json",
        "content-type": "multipart/form-data",
        Authorization: `Bearer ${getToken()}`,
      },
    });
    // console.log(res.data);
    return res.data;
  },
  async delete(id) {
    const res = await axios({
      method: "DELETE",
      url: `${apiBaseURL}/users/${id}`,
      headers: {
        Accept: "application/json",
        Authorization: `Bearer ${getToken()}`,
      },
    });
    // console.log(res.data);
    return res.data;
  },
  async admin() {
    const res = await axios({
      method: "GET",
      url: `${apiBaseURL}/admin`,
      headers: {
        Accept: "application/json",
        Authorization: `Bearer ${getToken()}`,
      },
    });
    // console.log(res.data);
    return res.data;
  },
};
