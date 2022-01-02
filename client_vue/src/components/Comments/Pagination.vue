<template>
  <div class="q-pa-lg flex flex-center q-mt-lg bg-white">
    <div
      :class="i !== pagesNumsArray[pagesNumsArray.length - 1] ? 'q-mr-sm' : ''"
      v-for="i in pagesNumsArray"
      :key="i"
    >
      <router-link
        :to="{ path: link, query: { ...query, page: i } }"
        v-if="i !== page"
      >
        <q-btn flat :label="i" color="" />
      </router-link>
      <q-btn v-else :label="i" color="primary" />
    </div>
  </div>
</template>

<script>
// https://stackoverflow.com/a/33457557
// https://stackoverflow.com/a/44176557
// new Array(stop-start+1).fill(start).map((n,i)=>n+i)
// new Array(6-4+1).fill(4).map((n,i)=>n+i)   => [4, 5, 6]

export default {
  props: {
    limit: {
      type: Number,
      default: () => 5,
    },
    page: {
      type: Number,
      default: () => 1,
    },
    totalPages: {
      type: Number,
      default: () => 1,
    },
    link: {
      type: String,
      default: () => "",
    },
    query: {
      type: Object,
      default: () => {},
    },
  },
  computed: {
    pagesNumsArray() {
      const totalPages = this.totalPages;
      const currentPage = this.page;
      const limit = this.limit;
      //   const totalPages = 8;
      //   const currentPage = 4;
      //   const limit = 7;
      // 10-4-5-10
      const isEven = limit % 2 === 0;
      const leftSide = isEven ? limit / 2 - 1 : Math.floor(limit / 2);
      const rightSide = isEven ? limit / 2 : Math.floor(limit / 2);

      let pagesLinksArray = [];
      if (currentPage > totalPages) return pagesLinksArray;
      if (totalPages > limit) {
        let left = Math.min(currentPage - 1, limit);
        let right = Math.min(totalPages - currentPage, limit);
        if (left >= leftSide && right >= rightSide) {
          left = leftSide;
          right = rightSide;
        } else {
          if (left < right) {
            right = Math.min(limit - left - 1, right);
          }
          if (right < left) {
            left = Math.min(limit - right - 1, left);
          }
          if (left === right) {
            if (left <= leftSide) {
              // Look here if things glitch later.
              // console.log("hit");
            } else {
              // Keep right and change left
              left = Math.min(limit - right - 1, left);
            }
          }
        }

        const leftNum = currentPage - left;
        const rightNum = currentPage + right;
        for (let i = leftNum; i <= rightNum; i++) {
          pagesLinksArray.push(i);
        }
      } else {
        for (let i = 1; i <= totalPages; i++) {
          pagesLinksArray.push(i);
        }
      }

      return pagesLinksArray;
    },
  },
};
</script>
