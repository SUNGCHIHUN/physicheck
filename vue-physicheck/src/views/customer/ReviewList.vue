<template>
  <v-container>
    <v-card>
      <v-data-table
        :headers="headers"
        :items="list"
        :items-per-page="5"
        class="elevation-1"
        @click:row="detail"
      />
    </v-card>
  </v-container>
</template>

<script>
export default {
  data () {
      return {
        list: [],
        headers: [
          {
            text: '번호',
            align: 'start',
            sortable: false,
            value: 'reviewNo',
          },
          { text: '예약번호', value: 'reserveNo'},
          { text: '내용', value: 'content'},
          { text: '별점', value: 'starPoint'},
          { text: '작성일', value: 'inDate'},
        ]
      }
    },
    created () {
      this.fetchList()
    },
    methods: {
      async fetchList () {
        let data = {}
        const apiUrl = '/vue/customer/reviewList'
        const apiSearch = ''
        const [res, err] = await this.$axios.get(apiUrl + apiSearch)
        if (err) {
          console.log(err)
          return
        }
        let temp = [];
        // 날짜 포맷 Timestamp => Date
        for (let newData of res.data) {

          let timestamp = newData.inDate;
          let date = new Date(timestamp);
          let inDate = date.getFullYear() + "-" + date.getMonth() + "-" + date.getDate();
          newData.inDate = inDate;
          console.log(inDate);

          temp.push(newData);
        }
        this.inDate = temp;
        this.list = res.data
      },



      detail(item) {
        console.log(item)
        this.$router.push({
            path: '/customer/ReviewDetail/',
            query: {
              id: item.reviewNo
            }
        })
      }
    }
}
</script>

<style>

</style>
