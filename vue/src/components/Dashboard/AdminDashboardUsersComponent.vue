<template>
  <q-page padding :style-fn="resetHeight" class="bg-secondary">
    <Container>
      <div class="yl-content">
        <div class="text-center q-pa-lg text-bold text-h5">
          Users management
        </div>
        <div class="row justify-center" v-if="!mounted">
          <q-spinner-audio color="white" size="4em" />
        </div>
        <div class="q-px-lg q-pb-lg row q-col-gutter-md" v-if="mounted">
          <q-dialog
            v-model="showUserView"
            transition-show="scale"
            transition-hide="scale"
          >
            <EditUser
              :user="currentUser"
              @close="toggleShowUser"
              @updatedUser="updatedUser"
              @removedUser="removedUser"
            />
          </q-dialog>
          <div
            class="col-12 col-sm-6 col-md-4 col-lg-3"
            v-for="user in users"
            :key="user.id"
            @click="showUser(user)"
          >
            <q-card
              :class="
                'yl-h-100' +
                (user.id === this.$store.state.user.id ? '' : ' cursor-pointer')
              "
            >
              <q-item>
                <q-item-section top avatar>
                  <q-avatar>
                    <img :src="$store.state.env.apiBaseUrl + user.picture" />
                  </q-avatar>
                </q-item-section>

                <q-item-section>
                  <q-item-label>{{ user.name }}</q-item-label>
                  <q-item-label caption>{{ user.email }}</q-item-label>
                </q-item-section>

                <q-item-section side top>
                  <q-badge class="text-capitalize" :label="user.role" />
                </q-item-section>
              </q-item>
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
import EditUser from "@/components/Dashboard/EditUser.vue";

export default {
  name: "AdminDashboardUserComponent",
  data() {
    return {
      mounted: false,
      users: [],
      showUserView: false,
      currentUser: {},
    };
  },
  components: {
    Container,
    EditUser,
  },
  methods: {
    resetHeight(offset) {
      return { minHeight: `calc(100vh - ${(offset || 0) + 70}px)` };
    },
    toggleShowUser() {
      this.showUserView = !this.showUserView;
    },
    showUser(user) {
      if (user.id === this.$store.state.user.id) return;
      this.currentUser = user;
      this.toggleShowUser();
    },
    updatedUser(user) {
      this.users = this.users.map((el) => {
        if (el.id === user.id) return user;
        else return el;
      });
      this.currentUser = {};
      this.toggleShowUser();
    },
    removedUser(user) {
      this.users = this.users.filter((el) => el.id !== user.id);
      this.currentUser = {};
      this.toggleShowUser();
    },
  },
  async mounted() {
    try {
      const res = await UsersAPI.index();
      this.users = res.users;
      this.mounted = true;
    } catch (error) {
      window.err = error;
      this.mounted = true;
    }
  },
};
</script>
