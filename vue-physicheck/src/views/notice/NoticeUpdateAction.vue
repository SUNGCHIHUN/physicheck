<template>
  <v-container>
    <v-card>
      <v-form
        class="pa-10"
      >
        <div class="text-right">
          <v-card-title>
            수정페이지
            <v-spacer />
            <v-btn
              color="info"
              @click="noticeUpdateAction"
            >
              완료
            </v-btn>
          </v-card-title>
        </div>
        <v-text-field
          v-model="list.title"
          single-line
          full-width
          hide-details
        />
        <v-divider />
        <v-text-field
          v-model="list.writer"
          single-line
          full-width
          hide-details
        />
        <v-divider />
        <v-textarea
          v-model="list.content"
          counter
          maxlength="1000"
          full-width
          single-line
        />
      </v-form>
    </v-card>
  </v-container>
</template>

<script>
export default {
  data () {
      return {
        list: []
      }
  },
  created () {
    console.log('noticeUpdate: ',this.$router.currentRoute.query.noticeNo)
    this.noticeDetail()
  },
  methods: {
    async noticeDetail () {
      let data = {}
      const apiUrl = `vue/notice/noticeDetail/${this.$router.currentRoute.query.noticeNo}`
      const apiSearch = ''
      const [res, err] = await this.$axios.get(apiUrl + apiSearch)
      if (err) {
        console.log(err)
        return
      }
      this.list = res.data
    },
    async noticeUpdateAction () {
      console.log('res: ',this.list)
      const data = this.list
      console.log('data: ', data)
      const apiUrl = '/vue/notice/noticeUpdateAction'
      const apiSearch = ''
      const [res, err] = await this.$axios.put(apiUrl + apiSearch, data)
      if (res) {
          alert('success')
          this.$router.push('/notice/noticeList')
          return
      } else if(err) {
          alert('fail')
      }
    },
  }
}
</script>

<style>

</style>
