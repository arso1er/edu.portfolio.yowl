<template>
  <form class="yl-form" @submit.prevent="handleSubmit">
    <q-input
      dark
      dense
      standout
      v-model="text"
      class="q-ml-md"
      placeholder="Search"
      :autofocus="autofocus"
    >
      <template v-slot:append>
        <q-icon v-if="text === ''" name="search" />
        <q-icon v-else name="clear" class="cursor-pointer" @click="text = ''" />
      </template>
    </q-input>
  </form>
</template>

<style lang="scss" scoped>
.yl-form {
  flex: 1;
  max-width: 600px;
}
</style>

<script>
export default {
  name: "HeaderSearch",
  data() {
    return {
      text: "",
    };
  },
  props: {
    autofocus: {
      type: Boolean,
      default: () => false,
    },
  },
  methods: {
    handleSubmit() {
      this.$router.push(`/search?site=${this.text}`);
      document.activeElement.blur();
    },
  },
};
</script>
