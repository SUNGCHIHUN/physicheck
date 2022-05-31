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
        :items="reserveList"
        :search="search"
        @click:row="detail"
      />
    </v-card>
  </v-container>
</template>

<script>
export default {
  data () {
      return {
        search: '',
        headers:[
          {
            text:'예약번호',
            align:'start',
            sortable: false,
            value: 'reserveNo'
          },
          {text : '회원번호', value:'memberNo'},
          {text : '회원명', value:'name'},
          {text : '예약날짜', value:'reserveDate'},
        ],
        reserveList: [
          {
            reserveNo: 0,
            memberNo: 0,
            name: 0,
            reserveDate: '22-02-02',
          },
        ],
      }
    },
    created () {
      this.fetchList()
    },
    methods: {
      async fetchList () {
        let data = {}
        const apiUrl = 'vue/doctor/getMemberResultInfo2';
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
        this.reserveList = temp;
      },
      detail(item) {
        console.log(item)
        this.$router.push({
            path: '/doctor/mentalDetail',
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