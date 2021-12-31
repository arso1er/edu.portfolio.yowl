<template>
  <div class="q-mr-auto q-ml-auto" :style="style">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: "Container",
  props: {
    style: {
      type: Object,
      default: () => {},
    },
  },
};
</script>
