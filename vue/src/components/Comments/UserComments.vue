<template>
  <q-page padding :style-fn="resetHeight" class="bg-secondary">
    <q-spinner-audio
      v-if="!mounted"
      class="fixed-center"
      color="white"
      size="4em"
    />
    <Container style="max-width: 700px" v-if="mounted && user">
      <q-card bordered class="yl-mc-card">
        <q-item>
          <q-item-section avatar>
            <q-avatar>
              <img :src="$store.state.env.apiBaseUrl + user.picture" />
            </q-avatar>
          </q-item-section>

          <q-item-section>
            <q-item-label class="text-bold">{{ user.name }}</q-item-label>
            <q-item-label>
              {{ total }} comment<span v-if="total > 1">s</span>
            </q-item-label>
          </q-item-section>
        </q-item>
      </q-card>

      <q-card class="q-mt-lg" v-for="comment in comments" :key="comment.id">
        <q-card-section>
          <div>
            Comment on
            <router-link
              :to="`/sites/${encodeURIComponent(comment.site_link)}`"
              class="text-bold yl-lu"
              >{{ comment.site_name }}</router-link
            >
          </div>
          <div class="row items-center justify-between q-mt-sm">
            <q-rating
              size="2em"
              icon="star_border"
              icon-selected="star"
              icon-half="star_half"
              readonly
              :modelValue="comment.rating"
              :color="getColor(comment.rating)"
            />
            <div class="text-grey">{{ getDate(comment.created_at) }}</div>
          </div>
        </q-card-section>

        <q-separator inset />

        <q-card-section>
          <router-link
            :to="`/comments/${comment.id}`"
            class="text-bold q-pb-sm yl-lu"
          >
            {{ comment.title }}
          </router-link>
          <div v-html="comment.content" />
        </q-card-section>
      </q-card>

      <Pagination
        v-if="totalPages > 1"
        :page="+page"
        :totalPages="totalPages"
        :limit="5"
        :link="`/users/${$route.params.id}`"
      />
    </Container>
    <Error404 v-if="mounted && !user" />
  </q-page>
</template>

<style lang="scss" scoped>
.yl-mc-card {
  width: fit-content;
  margin: 0 auto;
}
</style>

<script>
import Container from "@/components/Container.vue";
import { getRatingColor } from "@/utils";
import UsersAPI from "@/api/users";
import CommentsAPI from "@/api/comments";
import Error404 from "@/views/Error404.vue";
import Pagination from "@/components/Comments/Pagination";

export default {
  name: "MyCommentsComponent",
  data() {
    return {
      mounted: false,
      user: null,
      comments: [],
      page: 1,
      perPage: 10,
      total: 0,
      totalPages: 0,
    };
  },
  components: {
    Container,
    Error404,
    Pagination,
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
  },
  watch: {
    // https://stackoverflow.com/a/50981093
    "$route.query.page": {
      handler: async function (page) {
        if (this.$route.name !== "UserComments") return; // to prevent error when quitting this page.

        this.mounted = false;
        try {
          const userId = this.$route.params.id;
          const userRes = await UsersAPI.show(userId);
          this.user = userRes.user;

          this.page = page || 1;
          const commentRes = await CommentsAPI.index({
            user: userId,
            page: this.page,
          });
          this.comments = commentRes.comments;
          this.perPage = commentRes.perPage;
          this.total = commentRes.total;
          this.totalPages = commentRes.totalPages;

          this.mounted = true;
        } catch (error) {
          // window.err = error;
          this.mounted = true;
        }
      },
      deep: true,
      immediate: true,
    },
  },
};
</script>
