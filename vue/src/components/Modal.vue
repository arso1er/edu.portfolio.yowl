<template>
  <div class="backdrop" @click.self="closeModal">
    <div class="modal">
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    closeModal() {
      this.$emit("close");
    },
  },
};
</script>

<style lang="scss" scoped>
$init: 0;
.backdrop {
  position: fixed;
  top: $init;
  left: $init;
  right: $init;
  bottom: $init;
  z-index: 10000;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
}
.modal {
  width: 90%;
  max-width: 500px;
  padding: 20px;
  margin: 100px auto;
  background: #fff;
  border-radius: 10px;
}
</style>
