<template>
  <div class="transactionInformBlock transactionInformBlock--educator">
      <div class="transactionInformBlock__title">
          <p class="transactionInformBlock__hash hash">
            <router-link :to="{ name: 'publicationTransactionShow', params: {hash: transaction.txId} }" class="link link--colorBlue">{{ transaction.txId }}</router-link>
          </p>
          <p class="transactionInformBlock__date"><datetime :dt="timestamp"/></p>
      </div>
      <div class="transactionInformBlock__fromTo">
          <div class="transactionInformBlock__from informBlock">
              <p class="informBlock__title">{{ $("transaction.from") }}</p>
              <p class="informBlock__hash hash">{{ transaction.author }}</p>
          </div>
          <div class="transactionInformBlock__to informBlock">
              <p class="informBlock__title">{{ $("transaction.to") }}</p>
              <p class="informBlock__hash hash">{{ transaction.block }}</p>
          </div>
      </div>
  </div>
</template>

<script>
import Datetime from '@/components/Datetime'

export default {
  name: 'TransactionItemEducator',
  props: {
    transaction: Object,
    timestamp: Number
  },
  components: { Datetime }
}
</script>
