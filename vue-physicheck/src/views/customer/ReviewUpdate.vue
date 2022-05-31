<template>
  <v-container>
    <v-card>
      <v-form
        class="pa-10"
      >
        <div class="text-right">
          <v-btn
            color="info"
            @click="reviewUpdate"
          >
            수정
          </v-btn>
        </div>

        <v-row>
          <v-col>
            <div class="text-center">
              <v-rating
                v-model="list.starPoint"
                background-color="indigo lighten-3"
                color="indigo"
                large
              />
            </div>
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
            />
          </v-col>
        </v-row>
      </v-form>
    </v-card>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  data () {
      return {
        list: []
      }
  },
  created () {
    this.reviewDetail()
    console.log('!!update: ', this.$router)
    console.log('!!!updateId: ', this.$router.currentRoute.query.id)
  },
    methods: {
    ...mapGetters(['getId']),
    // get review detail info
    async reviewDetail () {
      console.log("ReviewDetail : ", this.list)
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
    async reviewUpdate () {
      console.log('ReviewUpdate: ', this.list)
      const data = this.list
      const apiUrl = '/vue/customer/reviewUpdate'
      const apiSearch = ''
      const [res, err] = await this.$axios.put(apiUrl + apiSearch, data)
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
