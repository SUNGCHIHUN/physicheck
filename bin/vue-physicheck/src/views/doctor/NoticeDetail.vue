<template>
  <v-container>
    <v-card>
      <v-form
        class="pa-10"
      >
        <div class="text-right">
          <v-btn
            color="info"
            @click="noticeUpdate"
          >
            수정
          </v-btn>
          <v-btn
            color="error"
            @click="noticeDelete"
          >
            삭제
          </v-btn>
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
    this.noticeDetail()
    console.log(this.$router)
    console.log(this.$router.currentRoute.query.id)
  },
  methods: {
    async noticeDetail () {
      let data = {}
      const apiUrl = `/admin/noticeDetail/${this.$router.currentRoute.query.id}`
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
      const data = this.list
      const apiUrl = '/admin/noticeUpdate'
      const apiSearch = ''
      const [res, err] = await this.$axios.put(apiUrl + apiSearch, data)
      if (res) {
          alert('success')
          this.$router.push('/doctor/customerInfo')
          return
      } else if(err) {
          alert('fail')
      }
    },
    async noticeDelete () {
      let data = {}
      const apiUrl = `/admin/noticeDelete/${this.$router.currentRoute.query.id}`
      const apiSearch = ''
      const [res, err] = await this.$axios.delete(apiUrl + apiSearch)
      if (res) {
          alert('success')
          this.$router.push('/doctor/customerInfo')
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
