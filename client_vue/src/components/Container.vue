<template>
  <div class="q-mr-auto q-ml-auto" :style="style" :class="className">
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
    className: {
      type: String,
      default: () => "",
    },
  },
};
</script>
