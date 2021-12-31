<template>
  <q-page :style-fn="resetHeight" class="bg-teal">
    <Container>
      <Moto />
      <RecentComments />
    </Container>
  </q-page>
</template>

<script>
// @ is an alias to /src
import Container from "@/components/Container";
import Moto from "@/components/Home/Moto";
import RecentComments from "@/components/Home/RecentComments";

export default {
  name: "Home",
  components: {
    Container,
    Moto,
    RecentComments,
  },
  methods: {
    resetHeight(offset) {
      // console.log(offset);
      return { minHeight: `calc(100vh - ${(offset || 0) + 70}px)` };
    },
  },
};
</script>
