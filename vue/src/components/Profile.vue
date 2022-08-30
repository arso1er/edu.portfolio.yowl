<template>
  <q-page padding :style-fn="resetHeight" class="bg-secondary">
    <Container style="max-width: 600px" v-if="$store.state.user">
      <q-card>
        <q-card-section>
          <div class="text-h6">Personal profile</div>
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
              <label for="password">New password</label>
              <q-input
                type="password"
                for="password"
                outlined
                v-model="password"
              />
            </div>

            <div class="q-mt-md">
              <label for="password_confirmation">
                New password confirmation
              </label>
              <q-input
                type="password"
                ref="passwordConfirmationRef"
                :rules="[
                  (val) => {
                    let valid = true;
                    if (password !== passwordConfirmation) {
                      valid =
                        'The password and password confirmation must match';
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
      </q-card>

      <q-card class="q-mt-md">
        <q-card-section>
          <div class="text-h6">Delete user</div>
          <div>
            When you delete your user profile, your comments are deleted as well
            and can not be restored.
          </div>
          <div class="q-mt-md">
            <q-btn
              color="red"
              label="Delete my profile"
              :disable="submitting"
              :loading="submitting"
              @click="removeUser($store.state.user.id)"
            />
          </div>
        </q-card-section>
      </q-card>
    </Container>
  </q-page>
</template>

<script>
import Container from "@/components/Container.vue";
import UsersAPI from "@/api/users";

export default {
  name: "MyCommentsComponent",
  data() {
    return {
      picture: null,
      email: "",
      login: "",
      name: "",
      password: "",
      passwordConfirmation: "",
      submitting: false,
    };
  },
  components: {
    Container,
  },
  methods: {
    resetHeight(offset) {
      return { minHeight: `calc(100vh - ${(offset || 0) + 70}px)` };
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
      if (this.password) data.append("password", this.password);
      if (this.password)
        data.append("password_confirmation", this.passwordConfirmation);
      if (this.picture) data.append("picture", this.picture);

      try {
        const res = await UsersAPI.update(this.$store.state.user.id, data);
        const user = { ...this.$store.state.user, ...res.user };
        this.$store.commit("login", user);
        this.picture = null;
        this.password = "";
        this.passwordConfirmation = "";
        this.submitting = false;
        this.$q.notify({
          progress: true,
          message: "User successfuly updated.",
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
            if (obj.picture) message += `<br/> ${obj.picture[0]}`;
          }
        }
        this.$q.notify({
          progress: true,
          html: true,
          message: message,
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
        await this.$store.dispatch("logout");
        this.submitting = false;
        this.$router.push(`/`);
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
    if (this.$store.state.user) {
      this.email = this.$store.state.user.email;
      this.login = this.$store.state.user.login;
      this.name = this.$store.state.user.name;
    }
  },
};
</script>
