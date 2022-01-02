<template>
  <q-page padding :style-fn="resetHeight" class="bg-white">
    <q-spinner-audio
      v-if="!mounted"
      class="fixed-center"
      color="primary"
      size="4em"
    />
    <Container style="max-width: 700px" v-if="mounted && comments.length">
      <div class="text-bold text-h5 q-mb-md" v-if="$route.query.site">
        Here are your results for "{{ $route.query.site }}"
      </div>
      <div
        class="column items-start q-mb-lg"
        v-for="comment in comments"
        :key="comment.max_id"
      >
        <router-link
          class="row yl-lu text-bold text-h6 text-accent"
          :to="`/sites/${comment.site_link}`"
        >
          {{ comment.site_name }}&nbsp;|&nbsp;{{ comment.site_link }}
        </router-link>
        <div class="row items-center q-mt-xs">
          <q-rating
            size="2em"
            icon="star_border"
            icon-selected="star"
            readonly
            :modelValue="+comment.rating_avg"
            :color="getColor(+comment.rating_avg)"
          />
          <span class="yl-divider"></span>
          {{ comment.comments_total }} comment<span
            v-if="comment.comments_total > 1"
          >
            s
          </span>
          <span class="yl-divider">|</span> YowlScore
          {{ +(+comment.rating_avg).toFixed(1) }}
          <!-- https://stackoverflow.com/a/12830454 -->
          <span class="yl-divider">|</span>
          <router-link
            :to="`/comments/add?site_link=${comment.site_link}&site_name=${comment.site_name}`"
            class="yl-lu text-accent"
          >
            Write a review
          </router-link>
        </div>
      </div>

      <Pagination
        v-if="totalPages > 1"
        :page="+page"
        :totalPages="totalPages"
        :limit="5"
        :link="`/search`"
        :query="{ site: $route.query.site || '' }"
      />
    </Container>
    <Container style="max-width: 700px" v-if="mounted && !comments.length">
      <div class="text-bold text-h5 q-mb-md">
        Oops, we couldn’t find any results matching "{{ $route.query.site }}"
      </div>
    </Container>
  </q-page>
</template>

<style lang="scss" scoped>
.yl-divider {
  margin: 0 8px;
}
</style>

<script>
import Container from "@/components/Container.vue";
import { getRatingColor } from "@/utils";
import CommentsAPI from "@/api/comments";
import Pagination from "@/components/Comments/Pagination";

export default {
  name: "MyCommentsComponent",
  data() {
    return {
      mounted: false,
      comments: [],
      page: 1,
      perPage: 10,
      total: 0,
      totalPages: 0,
    };
  },
  components: {
    Container,
    Pagination,
  },
  methods: {
    resetHeight(offset) {
      return { minHeight: `calc(100vh - ${(offset || 0) + 70}px)` };
    },
    getColor(rate) {
      return getRatingColor(rate);
    },
  },
  watch: {
    // https://stackoverflow.com/a/50981093
    "$route.query.page": {
      handler: async function (page) {
        if (this.$route.name !== "Search") return; // to prevent error when quitting this page.

        this.mounted = false;
        try {
          this.page = page || 1;
          const { site } = this.$route.query;
          const commentRes = await CommentsAPI.search({
            site,
            page: this.page,
          });
          this.comments = commentRes.comments;
          this.perPage = commentRes.perPage;
          this.total = commentRes.total;
          this.totalPages = commentRes.totalPages;

          // console.log(commentRes);
          // console.log(site);
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
