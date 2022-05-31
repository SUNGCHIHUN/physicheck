<template>
  <v-container>
    <v-card>
      <v-form
        class="pa-10"
      >
        <div class="text-right">
          <v-card-title>
            공지사항 등록
            <v-spacer />
            <v-btn
              color="info"
              @click="noticeInsert"
            >
              작성
            </v-btn>
          </v-card-title>
        </div>
        <v-text-field
          v-model="createForm.title"
          label="제목"
          single-line
          full-width
          hide-details
        />
        <v-divider />
        <v-text-field
          v-model="createForm.writer"
          label="작성자"
          single-line
          full-width
          hide-details
        />
        <v-divider />
        <v-textarea
          v-model="createForm.content"
          label="내용"
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
        createForm: {
          title: '',
          writer: '',
          content: ''
        }
      }
  },

  methods: {
    async noticeInsert () {
        console.log(this.createForm)
        const data = this.createForm
        const apiUrl = 'vue/notice/noticeInsert'
        const apiSearch = ''
        const [res, err] = await this.$axios.post(apiUrl + apiSearch, data)
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
