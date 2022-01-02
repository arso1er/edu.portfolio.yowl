<template>
  <q-page padding :style-fn="resetHeight" class="bg-secondary">
    <q-spinner-audio
      v-if="!mounted"
      class="fixed-center"
      color="white"
      size="4em"
    />
    <Container style="max-width: 700px" v-if="mounted && comment">
      <!-- <Modal v-if="showEdit" @close="toggleEdit"> -->
      <q-dialog
        v-model="showEdit"
        transition-show="scale"
        transition-hide="scale"
      >
        <Edit
          @close="toggleEdit"
          :comment="comment"
          @updateClient="updateClient"
        />
      </q-dialog>
      <!-- </Modal> -->
      <q-card bordered>
        <div class="row items-center justify-between">
          <q-item class="q-py-md">
            <q-item-section avatar>
              <q-avatar>
                <img :src="$store.state.env.apiBaseUrl + comment.userPicture" />
              </q-avatar>
            </q-item-section>

            <q-item-section>
              <q-item-label class="text-bold">
                <router-link :to="`/users/${comment.user_id}`" class="yl-lu">
                  {{ comment.userName }}
                </router-link>
              </q-item-label>
              <q-item-label>
                Review of
                <router-link
                  :to="`/sites/${comment.site_link}`"
                  class="text-bold yl-lu"
                >
                  {{ comment.site_name }}
                </router-link>
              </q-item-label>
            </q-item-section>
          </q-item>
          <div
            class="q-px-md"
            v-if="
              $store.state.user &&
              ($store.state.user.id === comment.user_id ||
                $store.state.user.role === 'admin')
            "
          >
            <q-btn
              round
              color="secondary"
              icon="edit"
              :disable="submitting"
              @click="toggleEdit"
            />
            <q-btn
              class="q-ml-sm"
              round
              color="red"
              icon="delete"
              :disable="submitting"
              :loading="submitting"
              @click="removeComment(comment.id)"
            />
          </div>
        </div>

        <q-separator inset />

        <q-card-section class="q-pt-sm">
          <div class="row items-center justify-between q-mb-sm">
            <q-rating
              size="2em"
              icon="star_border"
              icon-selected="star"
              readonly
              :modelValue="comment.rating"
              :color="getColor(comment.rating)"
            />
            <div class="text-grey">{{ getDate(comment.created_at) }}</div>
          </div>
          <div class="text-bold q-pb-sm">
            {{ comment.title }}
          </div>
          <div v-html="comment.content" />
        </q-card-section>
      </q-card>
    </Container>
    <Error404 v-if="mounted && !comment" />
  </q-page>
</template>

<script>
import Container from "@/components/Container.vue";
import { getRatingColor } from "@/utils";
import CommentsAPI from "@/api/comments";
import Error404 from "@/views/Error404.vue";
// import Modal from "@/components/Modal.vue";
import Edit from "@/components/Comments/Edit.vue";

export default {
  name: "ShowCommentComponent",
  data() {
    return {
      mounted: false,
      comment: null,
      submitting: false,
      showEdit: false,
    };
  },
  components: {
    Container,
    Error404,
    // Modal,
    Edit,
  },
  methods: {
    resetHeight(offset) {
      return { minHeight: `calc(100vh - ${(offset || 0) + 70}px)` };
    },
    getColor(rate) {
      return getRatingColor(rate);
    },
    getDate(str) {
      const date = new Date(str);
      const dateOptions = {
        // weekday: "long",
        year: "numeric",
        month: "short",
        day: "numeric",
      };
      return date.toLocaleDateString("en-US", dateOptions);
    },
    async removeComment(id) {
      this.submitting = true;
      try {
        await CommentsAPI.delete(id);
        this.submitting = false;
        this.$router.push(`/`);
        this.$q.notify({
          progress: true,
          message: "The comment has been deleted!",
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
    toggleEdit() {
      this.showEdit = !this.showEdit;
    },
    updateClient(comment) {
      this.comment = { ...this.comment, ...comment };
      this.toggleEdit();
    },
  },

  async mounted() {
    try {
      const res = await CommentsAPI.show(this.$route.params.id);
      this.comment = res.comment;
      this.mounted = true;
      //   console.log(this.comment);
    } catch (error) {
      // window.err = error;
      this.mounted = true;
    }
  },
};
</script>
