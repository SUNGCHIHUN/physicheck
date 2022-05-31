<template>
  <v-container>
    <v-card>
      <v-form
        class="pa-10"
      >
        <div class="text-right">
          <v-card-title>
            상세페이지
            <v-spacer />

            <v-btn
              color="info"
              class="mr-3"
              @click="detail"
            >
              수정
            </v-btn>

            <v-btn
              color="error"
              @click="noticeDelete"
            >
              삭제
            </v-btn>
          </v-card-title>
        </div>
        <v-text-field
          v-model="list.title"
          single-line
          full-width
          hide-details
          readonly
        />
        <v-divider />
        <v-text-field
          v-model="list.writer"
          single-line
          full-width
          hide-details
          readonly
        />
        <v-divider />
        <v-textarea
          v-model="list.content"
          counter
          maxlength="1000"
          full-width
          single-line
          readonly
        />
      </v-form>
    </v-card>
  </v-container>
</template>

<script>
export default {
  data () {
      return {
        list: [],
      }
  },
  created () {
    this.noticeDetail()
  },
  methods: {
    async noticeDetail () {
      let data = {}
      const apiUrl = `vue/notice/noticeDetail/${this.$router.currentRoute.query.id}`
      const apiSearch = ''
      const [res, err] = await this.$axios.get(apiUrl + apiSearch)
      if (err) {
        console.log(err)
        return
      }
      console.log(res.data)
      this.list = res.data
    },
    async noticeUpdate () {
      console.log(this.list)
      let data={}
      const apiUrl = 'vue/notice/noticeUpdate'
      const apiSearch = ''
      const [res, err] = await this.$axios.put(apiUrl + apiSearch, data)
      if (err) {
          console.log(err)
          return
        }
        this.list = res.data
      },
    detail() {
      const noticeId = this.$router.currentRoute.query.id
      console.log('!!!!detail: ', noticeId)
      this.$router.push({
          path: '/notice/NoticeUpdateAction',
          query: {
            noticeNo: noticeId

          }
      })
    },
    async noticeDelete () {
      let data = {}
      const apiUrl = `vue/notice/noticeDelete/${this.$router.currentRoute.query.id}`
      const apiSearch = ''
      const [res, err] = await this.$axios.delete(apiUrl + apiSearch)
      if (res) {
          alert('success')
          this.$router.push('/notice/NoticeList')
          return
      } else if(err) {
          alert('fail')
      }
    }
  }
}
</script>

<style>

</style>
