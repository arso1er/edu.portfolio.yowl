<template>
  <div class="bg-teal">
    <div class="yl-content">
      <div class="text-center q-pa-lg text-bold text-h5">Recent Comments</div>
      <div class="row justify-center" v-if="!mounted">
        <q-spinner-audio color="white" size="4em" />
      </div>
      <div
        class="q-px-lg q-pb-lg row q-col-gutter-md"
        v-if="mounted && comments.length"
      >
        <div
          class="col-12 col-sm-6 col-md-4 col-lg-3"
          v-for="comment in comments"
          :key="comment.id"
        >
          <q-card bordered class="my-card">
            <q-item class="q-pb-none">
              <q-item-section avatar>
                <q-avatar>
                  <img
                    :src="$store.state.env.apiBaseUrl + comment.userPicture"
                  />
                </q-avatar>
              </q-item-section>

              <q-item-section>
                <q-rating
                  size="2em"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                  :modelValue="comment.rating"
                  :color="getColor(comment.rating)"
                />
              </q-item-section>
            </q-item>

            <q-item class="q-pb-none" style="min-height: auto">
              <router-link
                class="text-bold yl-lu"
                :to="`/users/${comment.user_id}`"
              >
                {{ comment.userName }}
              </router-link>
              &nbsp; <span class="text-grey">reviewed</span> &nbsp;
              <router-link
                class="text-bold yl-lu"
                :to="`/sites/${encodeURIComponent(comment.site_link)}`"
              >
                {{ comment.site_name }}
              </router-link>
            </q-item>

            <q-card-section>
              <router-link
                class="ellipsis-3-lines"
                :to="`/comments/${comment.id}`"
              >
                <div v-html="comment.content" />
              </router-link>
            </q-card-section>
          </q-card>
        </div>
      </div>
      <div
        v-if="mounted && !comments.length"
        class="row justify-center text-h6"
      >
        No comment has been made yet.
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.my-card {
  height: 100%;
}
</style>

<script>
import { getRatingColor } from "@/utils";
import CommentsAPI from "@/api/comments";

export default {
  name: "RecentComments",
  data() {
    return {
      mounted: false,
      comments: [],
    };
  },
  methods: {
    getColor(rate) {
      return getRatingColor(rate);
    },
  },
  async mounted() {
    try {
      const res = await CommentsAPI.index({
        per_page: 8,
      });
      this.comments = res.comments;
      this.mounted = true;
      // console.log(this.comments);
    } catch (error) {
      this.mounted = true;
    }
  },
};
</script>
