<template>
  <v-card>
    <v-card-title>
      심리검사목록
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
      @click:row="insert"
    />
  </v-card>
</template>

<script>
export default {
  data(){
    return{
      search:'',
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
created(){
  this.fetchList();
},
methods:{
    async fetchList(){
      let data = {}
      const apiUrl = 'vue/doctor/reserveList2'
      const apiSearch = ''
      const [res, err] = await this.$axios.get(apiUrl + apiSearch)
      if(err){
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
     insert(item) {
        console.log(item)
        this.$router.push({
            path: '/doctor/mentalResult',
            query: {
              id: item.reserveNo
            }
        })
    },
  }
}
</script>

<style>

</style>
