<template>
  <div>
    <div class="pseudoTableWrapper">
      <div class="pseudoTable">
        <div class="pseudoTable__row pseudoTable__row--caption">
            <div class="pseudoTable__cell cell cell__block caption">{{ $t("blockIndex") }}</div>
            <div class="pseudoTable__cell cell cell__since caption">{{ $t("since") }}</div>
            <div class="pseudoTable__cell cell cell__transactions caption">{{ $t("transaction") }}</div>
            <div class="pseudoTable__cell cell cell__totalSent caption">{{ $t("totalSent") }}</div>
            <div class="pseudoTable__cell cell cell__slotHash caption">{{ $t("blockHash") }}</div>
            <div class="pseudoTable__cell cell cell__slotLeader caption">{{ $t("blockLeader") }}</div>
            <div class="pseudoTable__cell cell cell__size caption">{{ $t("size") }}</div>
        </div>
        <block-item v-for="block in blocks" :key="block.hash" :block="block"/>
      </div>
    </div>
    <div class="paginationBlock marginTop40">
        <div class="paginationBlock__btnForward btn btn--arrow btn--forward" :class="{ 'btn--gray': currentPage == 1 }" @click="fetchBlocks(currentPage - 1)">{{ $t("newerBlocks") }}</div>
        <div class="paginationBlock__pagination">Page <span class="paginationBlock__page">{{ currentPage }}</span> of &nbsp;<span class="paginationBlock__allPage">{{ totalPages }}</span></div>
        <div class="paginationBlock__btnBack btn btn--arrow btn--back" :class="{ 'btn--gray': currentPage == totalPages }" @click="fetchBlocks(currentPage + 1)">{{ $t("olderBlocks") }}</div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import BlockItem from './BlockItem'

export default {
  name: 'BlockList',
  i18nOptions: {
    keyPrefix: 'blockList'
  },
  components: { BlockItem },
  mounted () {
    if (!this.blocks.length) {
      this.getAllBlocks()
    }
  },
  computed: {
    ...mapGetters([
      'blocks',
      'totalPages',
      'perPage',
      'currentPage'
    ])
  },
  methods: {
    ...mapActions([
      'getAllBlocks',
      'getTotalPages',
      'setPage'
    ]),
    fetchBlocks (page) {
      if (page < 1 || page > this.totalPages) {
        return false
      }

      this.getAllBlocks(page)
      this.$store.commit('setPage', page)
    }
  }
}
</script>
