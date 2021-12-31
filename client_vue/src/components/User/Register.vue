<template>
  <q-page padding :style-fn="resetHeight">
    <Container style="max-width: 700px">
      <h3>Register</h3>
      <form @submit.prevent="handleSubmit">
        <q-input
          :rules="[(val) => !!val || 'Name is required']"
          ref="nameRef"
          v-model="name"
          class="q-mt-sm"
          outlined
          label="Name"
          bottom-slots
          :error-message="errors.name.message"
          :error="!errors.name.isValid"
        />

        <q-input
          :rules="[(val) => !!val || 'Login is required']"
          ref="loginRef"
          v-model="login"
          class="q-mt-sm"
          outlined
          label="Login/Username"
          bottom-slots
          :error-message="errors.login.message"
          :error="!errors.login.isValid"
        />

        <q-input
          :rules="[
            (val) =>
              /\S+@\S+\.\S+/.test(val) ||
              'Email required. Please add a valid email.',
          ]"
          ref="emailRef"
          v-model="email"
          class="q-mt-sm"
          outlined
          label="Email"
          bottom-slots
          :error-message="errors.email.message"
          :error="!errors.email.isValid"
        />

        <q-input
          :rules="[(val) => !!val || 'Password is required']"
          type="password"
          ref="passwordRef"
          v-model="password"
          class="q-mt-sm"
          outlined
          label="Password"
          bottom-slots
          :error-message="errors.password.message"
          :error="!errors.password.isValid"
        />

        <q-input
          :rules="[(val) => val === password || 'Passwords must match']"
          type="password"
          ref="passwordConfirmationRef"
          v-model="passwordConfirmation"
          class="q-mt-sm"
          outlined
          label="Password confirmation"
        />

        <div class="q-mt-md">
          <q-btn color="grey" to="/" type="reset" :disable="submitting">
            Cancel
          </q-btn>
          <q-btn
            class="q-ml-sm"
            color="positive"
            type="submit"
            :disable="submitting"
          >
            <q-spinner
              v-if="submitting"
              class="q-mr-sm"
              color="white"
              size="1em"
              :thickness="3"
            />
            Register
          </q-btn>
        </div>
      </form>
    </Container>
  </q-page>
</template>

<script>
import Container from "@/components/Container.vue";

export default {
  name: "RegisterComp",
  data() {
    return {
      name: "",
      login: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      submitting: false,
      errors: {
        name: {
          isValid: true,
          message: "The name is required",
        },
        login: {
          isValid: true,
          message: "The login is required",
        },
        email: {
          isValid: true,
          message: "Email required. Please add a valid email.",
        },
        password: {
          isValid: true,
          message: "The password is required",
        },
      },
    };
  },
  components: {
    Container,
  },
  methods: {
    resetHeight() {
      return { minHeight: "auto" };
    },
    async handleSubmit() {
      this.$refs.nameRef.validate();
      this.$refs.loginRef.validate();
      this.$refs.emailRef.validate();
      this.$refs.passwordRef.validate();
      this.$refs.passwordConfirmationRef.validate();

      if (
        this.$refs.nameRef.hasError ||
        this.$refs.loginRef.hasError ||
        this.$refs.emailRef.hasError ||
        this.$refs.passwordRef.hasError ||
        this.$refs.passwordConfirmationRef.hasError
      ) {
        return false;
      }

      this.submitting = true;

      const data = {
        name: this.name,
        login: this.login,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
      };

      try {
        await this.$store.dispatch("register", data);
        this.submitting = false;
        this.$router.push(`/`);
        this.$q.notify({
          progress: true,
          message: "User created. Welcome to the YOWL community.",
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
        // window.err = error;
        // console.log(error);
        this.submitting = false;
        if (error.response) {
          message = error.response.data.message || message;
          if (error.response.data.errors) {
            const obj = error.response.data.errors;
            // console.log(obj);
            for (const key in this.errors) {
              if (obj[key]) {
                this.errors[key] = {
                  isValid: false,
                  message: obj[key][0],
                };
              } else {
                this.errors[key].isValid = true;
              }
            }
          }
        }
        this.$q.notify({
          progress: true,
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
  },
};
</script>
