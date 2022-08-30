<template>
  <q-page :style-fn="resetHeight" class="bg-teal">
    <Container>
      <ProfileComponent />
    </Container>
  </q-page>
</template>

<script>
// @ is an alias to /src
import Container from "@/components/Container";
import ProfileComponent from "@/components/Profile";

export default {
  name: "Profile",
  components: {
    Container,
    ProfileComponent,
  },
  methods: {
    resetHeight(offset) {
      return { minHeight: `calc(100vh - ${(offset || 0) + 70}px)` };
    },
  },
};
</script>
