<template>
  <q-page padding :style-fn="resetHeight" class="bg-secondary">
    <q-spinner-audio
      v-if="!mounted"
      class="fixed-center"
      color="white"
      size="4em"
    />
    <Container style="max-width: 700px" v-if="mounted && comments.length">
      <q-card class="q-mt-lg">
        <q-card-section class="row items-center">
          <div class="col">
            <div>
              <div class="text-bold yl-lu text-h6">
                {{ comments[0].site_name }}
                ({{ total }} comment<span v-if="total > 1">s</span>)
              </div>
            </div>
            <div class="row items-center justify-between">
              <div class="row items-center">
                <q-rating
                  size="2em"
                  icon="star_border"
                  icon-selected="star"
                  readonly
                  :modelValue="+avgRating"
                  :color="getColor(+avgRating)"
                />
                <span class="q-ml-sm">
                  ({{ +(+avgRating).toFixed(1) }} average)
                </span>
              </div>
              <a
                :href="
                  comments[0].site_link.startsWith('http')
                    ? comments[0].site_link
                    : 'http://' + comments[0].site_link
                "
                target="_blank"
                class="text-grey text-bold yl-lu"
              >
                Visit {{ comments[0].site_link }}
              </a>
            </div>
          </div>
        </q-card-section>

        <q-separator inset v-if="$store.state.user" />

        <q-card-section class="row items-center" v-if="$store.state.user">
          <q-avatar>
            <img
              :src="$store.state.env.apiBaseUrl + $store.state.user.picture"
            />
          </q-avatar>
          <div class="q-ml-sm col">
            <div>
              <div class="text-bold">
                {{ $store.state.user.name }}
              </div>
            </div>
            <div class="row items-center justify-between">
              <router-link
                :to="`/comments/add?site_link=${comments[0].site_link}&site_name=${comments[0].site_name}`"
                class="text-accent yl-lu"
              >
                Write a review
              </router-link>
              <q-rating
                size="2em"
                icon="star_border"
                icon-selected="star"
                :model-value="addRating"
                @update:model-value="addRatingUpd"
                :max="5"
                color="green"
                no-dimming
              />
            </div>
          </div>
        </q-card-section>
      </q-card>

      <q-card class="q-mt-lg" v-for="comment in comments" :key="comment.id">
        <q-card-section class="row items-center">
          <q-avatar>
            <img :src="$store.state.env.apiBaseUrl + comment.userPicture" />
          </q-avatar>
          <div class="q-ml-sm col">
            <div>
              <router-link
                :to="`/users/${comment.user_id}`"
                class="text-bold yl-lu"
                >{{ comment.userName }}</router-link
              >
            </div>
            <div class="row items-center justify-between">
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
        :link="`/sites/${$route.params.link}`"
      />
    </Container>
    <Container style="max-width: 700px" v-if="mounted && !comments.length">
      <div class="text-bold text-h5 q-mb-md text-center">
        No one has commented on "{{ $route.params.link }}" yet.
      </div>
    </Container>
  </q-page>
</template>

<style lang="scss" scoped>
// .yl-mc-card {
//   width: fit-content;
//   margin: 0 auto;
// }
</style>

<script>
import Container from "@/components/Container.vue";
import { getRatingColor } from "@/utils";
// import UsersAPI from "@/api/users";
import CommentsAPI from "@/api/comments";
// import Error404 from "@/views/Error404.vue";
import Pagination from "@/components/Comments/Pagination";

export default {
  name: "MyCommentsComponent",
  data() {
    return {
      mounted: false,
      //   user: null,
      comments: [],
      page: 1,
      perPage: 10,
      total: 0,
      totalPages: 0,
      avgRating: 0,
      addRating: 0,
    };
  },
  components: {
    Container,
    // Error404,
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
    addRatingUpd(val) {
      this.addRating = val;
      return this.$router.push(
        `/comments/add?site_link=${this.comments[0].site_link}&site_name=${this.comments[0].site_name}&rating=${val}`
      );
    },
  },
  watch: {
    // https://stackoverflow.com/a/50981093
    "$route.query.page": {
      handler: async function (page) {
        if (this.$route.name !== "ShowSite") return; // to prevent error when quitting this page.

        this.mounted = false;
        try {
          const siteLink = this.$route.params.link;

          this.page = page || 1;
          const commentRes = await CommentsAPI.index({
            site: siteLink,
            page: this.page,
          });
          this.comments = commentRes.comments;
          this.perPage = commentRes.perPage;
          this.total = commentRes.total;
          this.totalPages = commentRes.totalPages;

          const avgRes = await CommentsAPI.search({
            site: siteLink,
            page: this.page,
          });
          this.avgRating = avgRes.comments[0].rating_avg;

          this.mounted = true;
          // console.log(commentRes);
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
