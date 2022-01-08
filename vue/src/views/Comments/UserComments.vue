<template>
  <UserCommentsComponent />
</template>

<script>
// @ is an alias to /src
import UserCommentsComponent from "@/components/Comments/UserComments";

export default {
  name: "UserComments",
  components: {
    UserCommentsComponent,
  },
};
</script>
