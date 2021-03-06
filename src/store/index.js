import Vuex from 'vuex'
import Vue from 'vue'
import blocks from './blocks'
import transactions from './transactions'
import money from './transactions/money'
import publications from './transactions/publications'
import address from './address'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    blocks,
    transactions,
    address,
    money,
    publications
  }
})
