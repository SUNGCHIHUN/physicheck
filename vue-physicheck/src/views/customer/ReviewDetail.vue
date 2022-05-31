<template>
  <v-container>
    <v-card>
      <v-form
        class="pa-10"
      >
        <v-row>
          <v-col>
            <div class="float-right">
              <v-card-title>
                <v-btn
                  color="info"
                  class="mr-3"
                  @click="reviewUpdate"
                >
                  수정
                </v-btn>

                <v-btn
                  color="error"
                  @click="reviewDelete"
                >
                  삭제
                </v-btn>
              </v-card-title>
            </div>
          </v-col>
        </v-row>
        <v-row>
          <v-col sm="3">
            <v-text-field
              v-model="list.reviewNo"
              single-line
              full-width
              hide-details
              disabled
            />
          </v-col>
          <v-col sm="5">
            <v-text-field
              v-model="list.starPoint"
              single-line
              full-width
              hide-details
              disabled
            />
            <v-divider />
          </v-col>
          <v-col>
            <v-text-field
              v-model="list.inDate"
              single-line
              full-width
              hide-details
              disabled
            />
            <v-divider />
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-textarea
              v-model="list.content"
              counter
              maxlength="800"
              full-width
              single-line
              disabled
            />
          </v-col>
        </v-row>
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
    this.reviewDetail()
    console.log(this.$router)
    console.log(this.$router.currentRoute.query.id)
  },
    methods: {
    // Review Select
    async reviewDetail () {
      console.log("this list : ", this.list)
      let data = {}
      const apiUrl = `/vue/customer/reviewDetail/${this.$router.currentRoute.query.id}`
      const apiSearch = ''
      const [res, err] = await this.$axios.get(apiUrl + apiSearch)
      if (err) {
        console.log(err)
        return
      }
      console.log(res.data)
      this.list = res.data
    },

    // Review Update
     reviewUpdate () {
       const reviewNo = this.$router.currentRoute.query.id;
        this.$router.push({
            path: '/customer/ReviewUpdate/',
            query: {
              id: reviewNo
            }
        })
    },
    // Review Delete
    async reviewDelete () {
      const apiUrl = `/vue/customer/reviewDelete/${this.$router.currentRoute.query.id}`
      const apiSearch = ''
      const [res, err] = await this.$axios.delete(apiUrl + apiSearch)
      if (res) {
          alert('success')
          this.$router.push('/customer/review/ReviewList')
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
