<template>
  <AddCommentComponent />
</template>

<script>
// @ is an alias to /src
import AddCommentComponent from "@/components/Comments/Add";

export default {
  name: "AddComment",
  components: {
    AddCommentComponent,
  },
};
</script>
