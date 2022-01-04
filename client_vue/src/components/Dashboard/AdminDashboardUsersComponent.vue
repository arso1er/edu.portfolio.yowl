<template>
  <q-page padding :style-fn="resetHeight" class="bg-secondary">
    <Container>
      <div class="yl-content">
        <div class="text-center q-pa-lg text-bold text-h5">
          Users management
        </div>
        <!-- <div class="row justify-center" v-if="!mounted">
          <q-spinner-audio color="white" size="4em" />
        </div> -->
      </div>
    </Container>
  </q-page>
</template>

<style lang="scss" scoped>
.yl-h-100 {
  height: 100%;
}
</style>

<script>
import Container from "@/components/Container.vue";

export default {
  name: "AdminDashboardComp",
  data() {
    return {
      mounted: true,
    };
  },
  //   computed: {
  //     negativeCommentsLabel() {
  //       return +(this.negativeComments * 100).toFixed(2) + "%";
  //     },
  //     positiveCommentsLabel() {
  //       return +(this.positiveComments * 100).toFixed(2) + "%";
  //     },
  //   },
  components: {
    Container,
  },
  methods: {
    resetHeight(offset) {
      return { minHeight: `calc(100vh - ${(offset || 0) + 70}px)` };
    },
  },
};
</script>
