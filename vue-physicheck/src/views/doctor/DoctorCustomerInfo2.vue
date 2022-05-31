<template>
  <v-container>
    <div class="text-right">
      <router-link
        to="/doctor/noticeInsert"
      >
        <v-btn
          color="info"
          class="mb-3"
        >
          등록
        </v-btn>
      </router-link>
    </div>
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
        list: [



        ],
        headers: [
          {
            text: '번호',
            align: 'start',
            sortable: false,
            value: 'reserveNo',
          },
          { text: '회원번호', value: 'memberNo'},
          { text: '이름', value: 'name'},
          { text: '검진날짜', value: 'reserveDate'},
        ]
      }
    },
    created () {
      this.fetchList()
    },
    methods: {
      async fetchList () {
        let data = {}
        const apiUrl = 'vue/doctor/vueCustomerInfo2'
        const apiSearch = ''
        const [res, err] = await this.$axios.get(apiUrl + apiSearch)
        if (err) {
          console.log(err)
          return

        }
        let temp = [];
        // 날짜 포맷 Timestamp => Date
        for (let newData of res.data) {

          let timestamp = newData.reserveDate;
          let date = new Date(timestamp);
          let reserveDate = date.getFullYear() + "-" + date.getMonth() + "-" + date.getDate();

          newData.reserveDate = reserveDate;
          console.log(reserveDate);

          temp.push(newData);
        }
        this.list = temp;

        console.log(this.list)
      },
      detail(item) {
        console.log(item)
        this.$router.push({
            path: 'vueCustomerDetail2',
            query: {
              id: item.reserveNo
            }
        })
      }
    }
}
</script>

<style>

</style>
