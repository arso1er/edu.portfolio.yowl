/* add this to Container if using my own Modal instead of quasar dialog =>
style="max-width: 700px; max-height: calc(100vh - 200px); overflow: auto" */

<template>
  <Container>
    <q-card>
      <q-card-section>
        <div class="text-h6">Edit comment</div>
        <q-rating
          size="2em"
          icon="star_border"
          icon-selected="star"
          v-model="rating"
          :max="5"
          color="green"
          :color-selected="ratingColors"
          no-dimming
        />
      </q-card-section>

      <q-separator inset />

      <q-card-section>
        <form @submit.prevent="handleSubmit">
          <q-input
            :rules="[(val) => !!val || 'The site link is required']"
            ref="site_linkRef"
            v-model="site_link"
            class="q-mt-sm"
            outlined
            label="Site Link"
            bottom-slots
            :error-message="errors.site_link.message"
            :error="!errors.site_link.isValid"
          />

          <q-input
            :rules="[(val) => !!val || 'The site name is required']"
            ref="site_nameRef"
            v-model="site_name"
            class="q-mt-sm"
            outlined
            label="Site name"
            bottom-slots
            :error-message="errors.site_name.message"
            :error="!errors.site_name.isValid"
          />

          <q-input
            :rules="[(val) => !!val || 'The title is required']"
            ref="titleRef"
            v-model="title"
            class="q-mt-sm"
            outlined
            label="Title"
            bottom-slots
            :error-message="errors.title.message"
            :error="!errors.title.isValid"
          />

          <div>
            <div>Content</div>
            <q-editor
              v-model="content"
              min-height="15rem"
              placeholder="Your comment"
            />
          </div>

          <div class="q-mt-md">
            <q-btn
              color="grey"
              type="reset"
              :disable="submitting"
              @click="closeModal"
            >
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
              Edit comment
            </q-btn>
          </div>
        </form>
      </q-card-section>
    </q-card>
  </Container>
</template>

<script>
import Container from "@/components/Container.vue";
import CommentsAPI from "@/api/comments";

export default {
  name: "AddCommentComponent",
  data() {
    return {
      rating: this.comment.rating,
      site_link: this.comment.site_link,
      site_name: this.comment.site_name,
      title: this.comment.title,
      content: this.comment.content,
      submitting: false,
      errors: {
        site_link: {
          isValid: true,
          message: "The site_link is required",
        },
        site_name: {
          isValid: true,
          message: "The site_name is required",
        },
        title: {
          isValid: true,
          message: "The title is required.",
        },
      },
    };
  },
  components: {
    Container,
  },
  computed: {
    ratingColors() {
      let out = [
        "light-green-3",
        "light-green-6",
        "green",
        "green-9",
        "green-10",
      ];

      const rate = this.rating;
      const lowerInt = Math.floor(rate);
      if (rate > 4.5) {
        const color = "green-5";
        out = color;
      }
      if (lowerInt === 1) {
        const color = "red-10";
        out = color;
      }
      if (lowerInt === 2) {
        const color = "red-6";
        out = color;
      }
      if (lowerInt === 3) {
        const color = "lime-14";
        out = color;
      }
      if (lowerInt === 4) {
        const color = "light-green-14";
        out = color;
      }

      return out;
    },
  },
  methods: {
    resetHeight(offset) {
      return { minHeight: `calc(100vh - ${(offset || 0) + 70}px)` };
    },
    clientValidation() {
      this.$refs.site_linkRef.validate();
      this.$refs.site_nameRef.validate();
      this.$refs.titleRef.validate();

      let out = true;
      if (
        this.$refs.site_linkRef.hasError ||
        this.$refs.site_nameRef.hasError ||
        this.$refs.titleRef.hasError
      ) {
        out = false;
      }

      if (!this.rating) {
        this.$q.notify({
          progress: true,
          message: "Please choose a rating between 1 and 5.",
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
        out = false;
      }

      if (!this.content) {
        this.$q.notify({
          progress: true,
          message: "Please add a content to your comment.",
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
        out = false;
      }

      return out;
    },
    async handleSubmit() {
      const isValid = this.clientValidation();
      if (!isValid) return false;

      this.submitting = true;

      const data = {
        site_link: this.site_link,
        site_name: this.site_name,
        rating: this.rating,
        title: this.title,
        content: this.content,
      };

      try {
        const res = await CommentsAPI.update(this.$route.params.id, data);
        this.submitting = false;
        this.$q.notify({
          progress: true,
          message: "Your comment has been updated",
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
        this.$emit("updateClient", data);
      } catch (error) {
        let message = "The request failed.";
        // window.err = error;
        // console.log(error);
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
    closeModal() {
      this.$emit("close");
    },
  },
  props: {
    comment: {
      type: Object,
      default: () => {},
    },
  },
};
</script>
