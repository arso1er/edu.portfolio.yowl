<template>
  <q-layout view="hHh lpR fFf" class="column">
    <Header />
    <q-page-container>
      <router-view />
    </q-page-container>
    <Footer />
  </q-layout>
</template>

<style lang="scss">
$child: inherit;

a {
  color: $child;
  text-decoration: $child;
}
a.yl-lu:hover {
  text-decoration: underline;
}

.yl-content {
  max-width: 1240px;
  margin: 0 auto;
}

.yl-mw6 {
  max-width: 600px;
}
</style>

<script>
import Header from "@/components/Header/Header";
import Footer from "@/components/Footer";

export default {
  name: "App",
  components: {
    Header,
    Footer,
  },
  async created() {
    this.$store.dispatch("loadUser");
    this.$store.dispatch("loadEnv");
  },
};
</script>
