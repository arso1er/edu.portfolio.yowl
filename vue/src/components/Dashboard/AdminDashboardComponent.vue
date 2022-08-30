<template>
  <q-page padding :style-fn="resetHeight" class="bg-secondary">
    <Container>
      <div class="yl-content">
        <div class="text-center q-pa-lg text-bold text-h5">Admin Dashboard</div>
        <div class="row justify-center" v-if="!mounted">
          <q-spinner-audio color="white" size="4em" />
        </div>
        <div class="q-px-lg q-pb-lg row q-col-gutter-md" v-if="mounted">
          <div class="col-12 col-sm-6 col-md-4 col-lg-4">
            <q-card class="yl-h-100">
              <q-card-section>
                <div class="text-bold">Total Users</div>
                <div class="q-mt-sm">
                  YOWL has {{ usersNum }} user<span v-if="usersNum > 1">s</span>
                  registered.
                </div>
                <router-link to="/dashboard/admin/users">
                  <q-btn
                    color="primary"
                    icon-right="send"
                    label="Manage users"
                    class="q-mt-sm"
                  />
                </router-link>
              </q-card-section>
            </q-card>
          </div>
          <div class="col-12 col-sm-6 col-md-4 col-lg-4">
            <q-card class="yl-h-100">
              <q-card-section>
                <div class="text-bold">Total sites rated</div>
                <div class="q-mt-sm">
                  YOWL has {{ sitesNum }} site<span v-if="sitesNum > 1">s</span>
                  rated.
                </div>
              </q-card-section>
              <q-separator inset />
              <q-card-section>
                <div class="text-bold">Total comments</div>
                <div class="q-mt-sm">
                  YOWL has {{ commentsNum }} comment<span v-if="commentsNum > 1"
                    >s</span
                  >
                  saved.
                </div>
              </q-card-section>
            </q-card>
          </div>
          <div class="col-12 col-sm-6 col-md-4 col-lg-4">
            <q-card class="yl-h-100">
              <q-card-section>
                <div class="text-bold">Comments distribution</div>
                <div class="q-mt-sm">
                  <div class="text-secondary text-bold">Positive comments</div>
                  <q-linear-progress
                    size="25px"
                    :value="positiveComments"
                    color="secondary"
                    rounded
                  >
                    <div class="absolute-full flex flex-center">
                      <q-badge
                        color="white"
                        text-color="secondary"
                        :label="positiveCommentsLabel"
                      />
                    </div>
                  </q-linear-progress>
                </div>
                <div class="q-mt-sm">
                  <div class="text-negative text-bold">Negative comments</div>
                  <q-linear-progress
                    size="25px"
                    :value="negativeComments"
                    color="negative"
                    rounded
                  >
                    <div class="absolute-full flex flex-center">
                      <q-badge
                        color="white"
                        text-color="negative"
                        :label="negativeCommentsLabel"
                      />
                    </div>
                  </q-linear-progress>
                </div>
              </q-card-section>
            </q-card>
          </div>
        </div>
      </div>
    </Container>
  </q-page>
</template>

<style lang="scss" scoped>
.yl-h-100 {
  height: 100%;
}
</style>

<script>
import Container from "@/components/Container.vue";
import UsersAPI from "@/api/users";

export default {
  name: "AdminDashboardComp",
  data() {
    return {
      mounted: false,
      usersNum: 0,
      sitesNum: 0,
      commentsNum: 0,
      negativeComments: 0,
      positiveComments: 0,
    };
  },
  computed: {
    negativeCommentsLabel() {
      return +(this.negativeComments * 100).toFixed(2) + "%";
    },
    positiveCommentsLabel() {
      return +(this.positiveComments * 100).toFixed(2) + "%";
    },
  },
  components: {
    Container,
  },
  methods: {
    resetHeight(offset) {
      return { minHeight: `calc(100vh - ${(offset || 0) + 70}px)` };
    },
  },
  async mounted() {
    try {
      const res = await UsersAPI.admin();
      this.usersNum = res.usersNum;
      this.sitesNum = res.sitesNum.total;
      this.commentsNum = res.commentsNums.total;
      if (this.commentsNum) {
        this.negativeComments =
          res.commentsNums.negativeComments / this.commentsNum;
        this.positiveComments =
          res.commentsNums.positiveComments / this.commentsNum;
      }
      this.mounted = true;
    } catch (error) {
      window.err = error;
      this.mounted = true;
    }
  },
};
</script>
