<template>
  <div class="bg-teal">
    <div class="yl-content">
      <div class="text-center q-pa-lg text-bold text-h5">Recent Comments</div>
      <div class="q-px-lg q-pb-lg row q-col-gutter-md">
        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
          <q-card bordered class="my-card">
            <q-item class="q-pb-none">
              <q-item-section avatar>
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/avatar2.jpg" />
                </q-avatar>
              </q-item-section>

              <q-item-section>
                <q-rating
                  size="2em"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                  :modelValue="3"
                  :color="getRatingColor(3)"
                />
              </q-item-section>
            </q-item>

            <q-item class="q-pb-none" style="min-height: auto">
              <router-link class="text-bold" to="/">Alana</router-link> &nbsp;
              <span class="text-grey">reviewed</span> &nbsp;
              <router-link class="text-bold" to="/">Samsung</router-link>
            </q-item>

            <q-card-section>
              <router-link class="ellipsis-3-lines" to="/">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Totam,
                et pariatur sunt neque itaque quam doloremque omnis, maiores ea,
                impedit vitae. Voluptas voluptatibus quae fugiat eum amet ipsum
                aliquid sit quisquam ad! Unde, autem? Alias cumque dolore magnam
                quod in numquam nisi asperiores accusantium nam excepturi!
                Corporis nulla molestias illo.
              </router-link>
            </q-card-section>
          </q-card>
        </div>
        <!-- delete start -->
        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
          <q-card bordered class="my-card">
            <q-item class="q-pb-none">
              <q-item-section avatar>
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/avatar2.jpg" />
                </q-avatar>
              </q-item-section>

              <q-item-section>
                <q-rating
                  size="2em"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                  :modelValue="1"
                  :color="getRatingColor(1)"
                />
              </q-item-section>
            </q-item>

            <q-item class="q-pb-none" style="min-height: auto">
              <router-link class="text-bold" to="/">Alana</router-link> &nbsp;
              <span class="text-grey">reviewed</span> &nbsp;
              <router-link class="text-bold" to="/">Samsung</router-link>
            </q-item>

            <q-card-section>
              <router-link class="ellipsis-3-lines" to="/">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Totam,
                et pariatur sunt neque itaque quam doloremque omnis, maiores ea,
                impedit vitae. Voluptas voluptatibus quae fugiat eum amet ipsum
                aliquid sit quisquam ad! Unde, autem? Alias cumque dolore magnam
                quod in numquam nisi asperiores accusantium nam excepturi!
                Corporis nulla molestias illo.
              </router-link>
            </q-card-section>
          </q-card>
        </div>
        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
          <q-card bordered class="my-card">
            <q-item class="q-pb-none">
              <q-item-section avatar>
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/avatar2.jpg" />
                </q-avatar>
              </q-item-section>

              <q-item-section>
                <q-rating
                  size="2em"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                  :modelValue="2"
                  :color="getRatingColor(2)"
                />
              </q-item-section>
            </q-item>

            <q-item class="q-pb-none" style="min-height: auto">
              <router-link class="text-bold" to="/">Alana</router-link> &nbsp;
              <span class="text-grey">reviewed</span> &nbsp;
              <router-link class="text-bold" to="/">Samsung</router-link>
            </q-item>

            <q-card-section>
              <router-link class="ellipsis-3-lines" to="/">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Totam,
                et pariatur sunt neque itaque quam doloremque omnis, maiores ea,
                impedit vitae. Voluptas voluptatibus quae fugiat eum amet ipsum
                aliquid sit quisquam ad! Unde, autem? Alias cumque dolore magnam
                quod in numquam nisi asperiores accusantium nam excepturi!
                Corporis nulla molestias illo.
              </router-link>
            </q-card-section>
          </q-card>
        </div>
        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
          <q-card bordered class="my-card">
            <q-item class="q-pb-none">
              <q-item-section avatar>
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/avatar2.jpg" />
                </q-avatar>
              </q-item-section>

              <q-item-section>
                <q-rating
                  size="2em"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                  :modelValue="3"
                  :color="getRatingColor(3)"
                />
              </q-item-section>
            </q-item>

            <q-item class="q-pb-none" style="min-height: auto">
              <router-link class="text-bold" to="/">Alana</router-link> &nbsp;
              <span class="text-grey">reviewed</span> &nbsp;
              <router-link class="text-bold" to="/">Samsung</router-link>
            </q-item>

            <q-card-section>
              <router-link class="ellipsis-3-lines" to="/">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Totam,
                et pariatur sunt neque itaque quam doloremque omnis, maiores ea,
                impedit vitae. Voluptas voluptatibus quae fugiat eum amet ipsum
                aliquid sit quisquam ad! Unde, autem? Alias cumque dolore magnam
                quod in numquam nisi asperiores accusantium nam excepturi!
                Corporis nulla molestias illo.
              </router-link>
            </q-card-section>
          </q-card>
        </div>
        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
          <q-card bordered class="my-card">
            <q-item class="q-pb-none">
              <q-item-section avatar>
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/avatar2.jpg" />
                </q-avatar>
              </q-item-section>

              <q-item-section>
                <q-rating
                  size="2em"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                  :modelValue="4"
                  :color="getRatingColor(4)"
                />
              </q-item-section>
            </q-item>

            <q-item class="q-pb-none" style="min-height: auto">
              <router-link class="text-bold" to="/">Alana</router-link> &nbsp;
              <span class="text-grey">reviewed</span> &nbsp;
              <router-link class="text-bold" to="/">Samsung</router-link>
            </q-item>

            <q-card-section>
              <router-link class="ellipsis-3-lines" to="/">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Totam,
                et pariatur sunt neque itaque quam doloremque omnis, maiores ea,
                impedit vitae. Voluptas voluptatibus quae fugiat eum amet ipsum
                aliquid sit quisquam ad! Unde, autem? Alias cumque dolore magnam
                quod in numquam nisi asperiores accusantium nam excepturi!
                Corporis nulla molestias illo.
              </router-link>
            </q-card-section>
          </q-card>
        </div>
        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
          <q-card bordered class="my-card">
            <q-item class="q-pb-none">
              <q-item-section avatar>
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/avatar2.jpg" />
                </q-avatar>
              </q-item-section>

              <q-item-section>
                <q-rating
                  size="2em"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                  :modelValue="5"
                  :color="getRatingColor(5)"
                />
              </q-item-section>
            </q-item>

            <q-item class="q-pb-none" style="min-height: auto">
              <router-link class="text-bold" to="/">Alana</router-link> &nbsp;
              <span class="text-grey">reviewed</span> &nbsp;
              <router-link class="text-bold" to="/">Samsung</router-link>
            </q-item>

            <q-card-section>
              <router-link class="ellipsis-3-lines" to="/">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Totam,
                et pariatur sunt neque itaque quam doloremque omnis, maiores ea,
                impedit vitae. Voluptas voluptatibus quae fugiat eum amet ipsum
                aliquid sit quisquam ad! Unde, autem? Alias cumque dolore magnam
                quod in numquam nisi asperiores accusantium nam excepturi!
                Corporis nulla molestias illo.
              </router-link>
            </q-card-section>
          </q-card>
        </div>
        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
          <q-card bordered class="my-card">
            <q-item class="q-pb-none">
              <q-item-section avatar>
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/avatar2.jpg" />
                </q-avatar>
              </q-item-section>

              <q-item-section>
                <q-rating
                  size="2em"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                  :modelValue="4.5"
                  :color="getRatingColor(4.5)"
                />
              </q-item-section>
            </q-item>

            <q-item class="q-pb-none" style="min-height: auto">
              <router-link class="text-bold" to="/">Alana</router-link> &nbsp;
              <span class="text-grey">reviewed</span> &nbsp;
              <router-link class="text-bold" to="/">Samsung</router-link>
            </q-item>

            <q-card-section>
              <router-link class="ellipsis-3-lines" to="/">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Totam,
                et pariatur sunt neque itaque quam doloremque omnis, maiores ea,
                impedit vitae. Voluptas voluptatibus quae fugiat eum amet ipsum
                aliquid sit quisquam ad! Unde, autem? Alias cumque dolore magnam
                quod in numquam nisi asperiores accusantium nam excepturi!
                Corporis nulla molestias illo.
              </router-link>
            </q-card-section>
          </q-card>
        </div>
        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
          <q-card bordered class="my-card">
            <q-item class="q-pb-none">
              <q-item-section avatar>
                <q-avatar>
                  <img src="https://cdn.quasar.dev/img/avatar2.jpg" />
                </q-avatar>
              </q-item-section>

              <q-item-section>
                <q-rating
                  size="2em"
                  icon="star_border"
                  icon-selected="star"
                  icon-half="star_half"
                  readonly
                  :modelValue="4.7"
                  :color="getRatingColor(4.7)"
                />
              </q-item-section>
            </q-item>

            <q-item class="q-pb-none" style="min-height: auto">
              <router-link class="text-bold" to="/">Alana</router-link> &nbsp;
              <span class="text-grey">reviewed</span> &nbsp;
              <router-link class="text-bold" to="/">Samsung</router-link>
            </q-item>

            <q-card-section>
              <router-link class="ellipsis-3-lines" to="/">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Totam,
                et pariatur sunt neque itaque quam doloremque omnis, maiores ea,
                impedit vitae. Voluptas voluptatibus quae fugiat eum amet ipsum
                aliquid sit quisquam ad! Unde, autem? Alias cumque dolore magnam
                quod in numquam nisi asperiores accusantium nam excepturi!
                Corporis nulla molestias illo.
              </router-link>
            </q-card-section>
          </q-card>
        </div>
        <!-- delete end -->
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
export default {
  name: "RecentComments",
  methods: {
    getRatingColor(rate) {
      const lowerInt = Math.floor(rate);
      if (rate > 4.5) {
        return "green-5";
      }
      if (lowerInt === 1) {
        return "red-10";
      }
      if (lowerInt === 2) {
        return "red-6";
      }
      if (lowerInt === 3) {
        return "lime-14";
      }
      if (lowerInt === 4) {
        return "light-green-14";
      }
    },
  },
};
</script>
