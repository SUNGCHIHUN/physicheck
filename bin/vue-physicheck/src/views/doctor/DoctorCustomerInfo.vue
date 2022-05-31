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
        list: [],
        headers: [
          {
            text: '번호',
            align: 'start',
            sortable: false,
            value: 'noticeNo',
          },
          { text: '제목', value: 'title'},
          { text: '작성자', value: 'writer'},
          { text: '작성일', value: 'inDate'},
          { text: '조회수', value: 'readCnt'},
        ]
      }
    },
    created () {
      this.fetchList()
    },
    methods: {
      async fetchList () {
        let data = {}
        const apiUrl = '/customer/boardList'
        const apiSearch = ''
        const [res, err] = await this.$axios.get(apiUrl + apiSearch)
        if (err) {
          console.log(err)
          return
        }
        this.list = res.data
      },
      detail(item) {
        console.log(item)
        this.$router.push({
            path: '/doctor/noticeDetail',
            query: {
              id: item.noticeNo
            }
        })
      }
    }
}
</script>

<style>

</style>
