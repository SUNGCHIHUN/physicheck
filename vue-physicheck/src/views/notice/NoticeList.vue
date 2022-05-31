<template>
  <v-container>
    <div class="text-right">
      <router-link
        to="/notice/noticeInsert"
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
      <v-card-title>
        공지사항
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
        :items="list"
        :search="search"
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
        search:'',
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
        const apiUrl = 'vue/notice/noticeList'
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
            path: '/notice/noticeDetail',
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
