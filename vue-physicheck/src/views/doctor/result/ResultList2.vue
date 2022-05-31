<template>
  <v-card>
    <v-card-title>
      운동검사 등록
      <v-spacer />
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      />
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="reserveList"
      :search="search"
      @click:row="insertForm"
    />
  </v-card>
</template>

<script>
  export default {
    data () {
      return {
        search: '',
        headers: [
          {
            text: '예약번호',
            align: 'start',
            sortable: false,
            value: 'reserveNo',
          },
          { text: '회원번호', value: 'memberNo' },
          { text: '회원명', value: 'name' },
          { text: '예약날짜', value: 'reserveDate' },
        ],
        reserveList: [
          {
            reserveNo: 150,
            memberNo: 159,
            name: 6.0,
            reserveDate: '22-05-12',
          },
        ],
      }
    },
    created() {
      this.fetchList();
    },
    methods: {
      async fetchList() {
        let data = {}
        const apiUrl = 'vue/doctor/reserveList'
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

      insertForm(item) {
        console.log(item)
        this.$router.push({
            path: '/doctor/exerciseResult',
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
