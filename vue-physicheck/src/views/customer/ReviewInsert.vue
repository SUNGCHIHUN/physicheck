<template>
  <v-container>
    <v-card>
      <v-form
        class="pa-10"
      >
        <div class="text-right">
          <v-btn
            color="info"
            @click="reviewInsert"
          >
            등록
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

export default {
  data () {
    return {
      list: {
        starPoint: 0,
        content:'',
        memberNo: 0
      }
    }
  },
    methods: {
    async reviewInsert (){
      const data = this.list
      console.log(data)
      const apiUrl = '/vue/customer/reviewInsert'
      const apiSearch = ''
      const [res, err] = await this.$axios.post(apiUrl + apiSearch, data)
      if (res) {
        alert('success')
        this.$router.push('/customer/ReviewList')
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
