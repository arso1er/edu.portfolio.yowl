<template>
  <q-header elevated class="bg-primary text-white">
    <q-toolbar class="q-mr-auto q-ml-auto" style="max-width: 1240px">
      <HeaderDesktop @logout="logout" :shortUserName="shortUserName" />
      <HeaderMobile @logout="logout" :shortUserName="shortUserName" />
    </q-toolbar>
  </q-header>
</template>

<script>
import HeaderDesktop from "./HeaderDesktop.vue";
import HeaderMobile from "./HeaderMobile.vue";

export default {
  name: "Header",
  components: {
    HeaderDesktop,
    HeaderMobile,
  },
  methods: {
    async logout() {
      try {
        await this.$store.dispatch("logout");
        this.$router.push("/");
        this.$q.notify({
          progress: true,
          message: "You are logged out.",
          type: "positive",
          actions: [
            {
              label: "Dismiss",
              color: "white",
              handler: () => {
                //
              },
            },
          ],
        });
      } catch (error) {
        let message = "The request failed.";
        window.err = error;
        console.log(error);
        this.submitting = false;
        if (error.response) {
          message = error.response.data.message || message;
        }
        this.$q.notify({
          progress: true,
          message: message,
          html: true,
          type: "negative",
          timeout: 10000,
          actions: [
            {
              label: "Dismiss",
              color: "white",
              handler: () => {
                //
              },
            },
          ],
        });
      }
    },
  },
  computed: {
    shortUserName() {
      if (!this.$store.state.user) return "";

      const name = this.$store.state.user.name;
      let out;
      if (name.length <= 9) {
        out = name;
      } else {
        out = name.slice(0, 6) + "...";
      }
      return out;
    },
  },
};
</script>
