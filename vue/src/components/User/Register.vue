<template>
  <q-page padding :style-fn="resetHeight" class="bg-secondary">
    <Container style="max-width: 700px">
      <q-card>
        <q-card-section>
          <div class="text-h6">Register</div>
        </q-card-section>

        <q-separator inset />

        <q-card-section>
          <form @submit.prevent="handleSubmit">
            <q-uploader
              class="q-mb-lg"
              style="max-width: 320px; margin-left: auto; margin-right: auto"
              label="Profile picture (Optional)"
              accept="image/*"
              max-file-size="524288"
              hide-upload-btn
              @rejected="onRejected"
              @added="onAdded"
              @removed="onRemoved"
            >
              <template v-slot:header="scope">
                <div class="row no-wrap items-center q-pa-sm q-gutter-xs">
                  <div class="col">
                    <div class="q-uploader__title">
                      Profile picture (Optional)
                    </div>
                    <div class="q-uploader__subtitle">
                      {{ scope.uploadSizeLabel }}
                    </div>
                  </div>
                  <q-btn
                    v-if="scope.canAddFiles"
                    type="a"
                    icon="add_box"
                    @click="scope.pickFiles"
                    round
                    dense
                    flat
                  >
                    <q-uploader-add-trigger />
                    <q-tooltip>Pick File</q-tooltip>
                  </q-btn>
                </div>
              </template>
            </q-uploader>

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
        </q-card-section>
      </q-card>
    </Container>
  </q-page>
</template>

<script>
import Container from "@/components/Container.vue";
// import AuthApi from "@/api/auth";

export default {
  name: "RegisterComp",
  data() {
    return {
      picture: null,
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
    resetHeight(offset) {
      return { minHeight: `calc(100vh - ${(offset || 0) + 70}px)` };
    },
    onRejected(rejectedEntries) {
      // console.log(rejectedEntries);
      this.$q.notify({
        type: "negative",
        message: `Please, choose an image with 512kb maximum size.`,
      });
    },
    onAdded(files) {
      this.picture = files[0];
    },
    onRemoved(files) {
      this.picture = null;
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

      const data = new FormData();
      data.append("name", this.name);
      data.append("login", this.login);
      data.append("email", this.email);
      data.append("password", this.password);
      data.append("password_confirmation", this.passwordConfirmation);
      if (this.picture) data.append("picture", this.picture);

      try {
        // const test = await AuthApi.register(data);
        // console.log(test);
        // this.submitting = false;
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
  },
};
</script>
