<template>
  <q-card>
    <q-card-section class="row items-center justify-between">
      <div class="text-h6">{{ user.name }} profile</div>
      <q-btn round color="secondary" icon="close" @click="closeModal" />
    </q-card-section>

    <q-separator />

    <q-card-section>
      <form @submit.prevent="updateUser">
        <q-file
          outlined
          v-model="picture"
          label="Change profile picture"
          accept="image/*"
          max-file-size="524288"
          clearable
        />

        <div class="q-mt-md">
          <div>Email</div>
          <q-input standout v-model="email" disable />
        </div>

        <div class="q-mt-md">
          <label for="login">Login/Username</label>
          <q-input
            for="login"
            outlined
            v-model="login"
            :rules="[(val) => !!val || 'Login is required']"
            ref="loginRef"
          />
        </div>

        <div>
          <label for="name">Name</label>
          <q-input
            for="name"
            outlined
            v-model="name"
            :rules="[(val) => !!val || 'Name is required']"
            ref="nameRef"
          />
        </div>

        <div>
          <label for="role">Role</label>
          <!-- <q-input for="role" outlined v-model="role" /> -->
          <q-select outlined v-model="role" :options="roleOptions" />
        </div>

        <div class="q-mt-md">
          <label for="password">New password</label>
          <q-input type="password" for="password" outlined v-model="password" />
        </div>

        <div class="q-mt-md">
          <label for="password_confirmation"> New password confirmation </label>
          <q-input
            type="password"
            ref="passwordConfirmationRef"
            :rules="[
              (val) => {
                let valid = true;
                if (password !== passwordConfirmation) {
                  valid = 'The password and password confirmation must match';
                }
                return valid;
              },
            ]"
            for="password_confirmation"
            outlined
            v-model="passwordConfirmation"
          />
        </div>

        <div class="q-mt-md">
          <q-btn
            color="primary"
            label="Update profile"
            :disable="submitting"
            :loading="submitting"
            @click="updateUser"
          />
        </div>
      </form>
    </q-card-section>

    <q-separator />

    <q-card-section>
      <div class="text-h6">Delete user</div>
      <div>
        When you delete an user profile, the associated comments are deleted as
        well and can not be restored.
      </div>
      <div class="q-mt-md">
        <q-btn
          color="red"
          label="Delete profile"
          :disable="submitting"
          :loading="submitting"
          @click="removeUser(user.id)"
        />
      </div>
    </q-card-section>
  </q-card>
</template>

<script>
import UsersAPI from "@/api/users";

export default {
  name: "EditUser",
  data() {
    return {
      picture: null,
      email: this.user.email,
      login: this.user.login,
      name: this.user.name,
      role: this.user.role,
      password: "",
      passwordConfirmation: "",
      submitting: false,
      roleOptions: [
        {
          label: "User",
          value: "user",
        },
        {
          label: "Admin",
          value: "admin",
        },
      ],
    };
  },
  props: {
    user: {
      type: Object,
      default: () => {},
    },
  },
  methods: {
    closeModal() {
      this.$emit("close");
    },
    async updateUser() {
      this.$refs.nameRef.validate();
      this.$refs.loginRef.validate();
      this.$refs.passwordConfirmationRef.validate();

      if (
        this.$refs.nameRef.hasError ||
        this.$refs.loginRef.hasError ||
        this.$refs.passwordConfirmationRef.hasError
      ) {
        return false;
      }
      this.submitting = true;

      const data = new FormData();
      data.append("_method", "PUT");
      data.append("name", this.name);
      data.append("login", this.login);
      data.append("role", this.role.value);
      if (this.password) data.append("password", this.password);
      if (this.password)
        data.append("password_confirmation", this.passwordConfirmation);
      if (this.picture) data.append("picture", this.picture);

      try {
        const res = await UsersAPI.update(this.user.id, data);
        const user = { ...this.user, ...res.user };
        this.picture = null;
        this.password = "";
        this.passwordConfirmation = "";
        this.submitting = false;
        this.$emit("updatedUser", user);
        this.$q.notify({
          progress: true,
          message: "User successfuly updated.",
          // color: 'primary',
          type: "positive",
          actions: [
            {
              label: "Dismiss",
              color: "white",
              handler: () => {
                //
              },
            },
          ],
        });
      } catch (error) {
        let message = "The request failed.";
        window.err = error;
        console.log(error);
        this.submitting = false;
        if (error.response) {
          message = error.response.data.message || message;
          if (error.response.data.errors) {
            const obj = error.response.data.errors;
            // console.log(obj);
            // for (const key in this.errors) {
            //   if (obj[key]) {
            //     this.errors[key] = {
            //       isValid: false,
            //       message: obj[key][0],
            //     };
            //   } else {
            //     this.errors[key].isValid = true;
            //   }
            // }
            if (obj.picture) message += `<br/> ${obj.picture[0]}`;
          }
        }
        this.$q.notify({
          progress: true,
          html: true,
          message: message,
          // color: 'primary',
          type: "negative",
          timeout: 10000,
          actions: [
            {
              label: "Dismiss",
              color: "white",
              handler: () => {
                //
              },
            },
          ],
        });
      }
    },
    async removeUser(id) {
      this.submitting = true;
      try {
        await UsersAPI.delete(id);
        this.submitting = false;
        this.$emit("removedUser", this.user);
        this.$q.notify({
          progress: true,
          message: "The user has been deleted!",
          type: "positive",
          actions: [
            {
              label: "Dismiss",
              color: "white",
              handler: () => {
                //
              },
            },
          ],
        });
      } catch (error) {
        let message = "The request failed.";
        window.err = error;
        console.log(error);
        this.submitting = false;
        if (error.response) {
          message = error.response.data.message || message;
        }
        this.$q.notify({
          progress: true,
          message: message,
          html: true,
          type: "negative",
          timeout: 10000,
          actions: [
            {
              label: "Dismiss",
              color: "white",
              handler: () => {
                //
              },
            },
          ],
        });
      }
    },
  },

  mounted() {
    this.role = this.roleOptions.find((el) => el.value === this.user.role);
  },
};
</script>
