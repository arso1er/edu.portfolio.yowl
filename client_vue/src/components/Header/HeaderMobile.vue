<template>
  <div v-if="!searchView" class="xs row items-center justify-between col">
    <q-toolbar-title class="yl-title">
      <router-link to="/">
        <q-btn stretch flat color="white" label="YOWL app" />
      </router-link>
    </q-toolbar-title>
    <div class="row">
      <q-btn
        flat
        round
        dense
        icon="search"
        class="q-mr-xs"
        @click="toggleSearch"
      />
      <div v-if="$store.state.user">
        <q-btn-dropdown stretch flat>
          <template v-slot:label>
            <div class="row items-center no-wrap">
              <q-avatar size="24px" class="q-mr-sm">
                <img
                  :src="$store.state.env.apiBaseUrl + $store.state.user.picture"
                />
              </q-avatar>
              <div class="text-center text-capitalize">{{ shortUserName }}</div>
            </div>
          </template>
          <q-list>
            <q-item clickable v-close-popup tabindex="0">
              <q-item-section>
                <router-link to="/comments/add">
                  <q-item-label>Add comment</q-item-label>
                </router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-close-popup tabindex="0">
              <q-item-section>
                <router-link
                  :to="{
                    name: 'UserComments',
                    params: { id: $store.state.user.id },
                  }"
                >
                  <q-item-label>My comments</q-item-label>
                </router-link>
              </q-item-section>
            </q-item>
            <q-item clickable v-close-popup tabindex="0">
              <q-item-section>
                <q-item-label>My settings</q-item-label>
              </q-item-section>
            </q-item>
            <q-item clickable v-close-popup tabindex="0" @click="logout">
              <q-item-section>
                <q-item-label>Log out</q-item-label>
              </q-item-section>
            </q-item>
          </q-list>
        </q-btn-dropdown>
      </div>
      <div v-else>
        <router-link to="/register">
          <q-btn stretch flat color="white" label="Register" />
        </router-link>
        <router-link to="/login">
          <q-btn stretch flat color="white" label="Login" />
        </router-link>
      </div>
    </div>
  </div>
  <div v-else class="xs row items-center justify-between col">
    <q-btn flat round dense icon="west" class="q-mr-sm" @click="toggleSearch" />
    <HeaderSearch autofocus />
  </div>
</template>

<style lang="scss" scoped>
.yl-title {
  flex: 0 0 auto;
}
</style>

<script>
import HeaderSearch from "./HeaderSearch.vue";

export default {
  name: "HeaderMobile",
  props: {
    shortUserName: {
      type: String,
      default: () => "",
    },
  },
  components: {
    HeaderSearch,
  },
  data() {
    return {
      text: "",
      searchView: false,
    };
  },
  methods: {
    toggleSearch() {
      this.searchView = !this.searchView;
    },
    logout() {
      this.$emit("logout");
    },
  },
};
</script>
