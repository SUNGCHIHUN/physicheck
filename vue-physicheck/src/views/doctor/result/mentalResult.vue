<template>
  <v-form
    class="pa-10"
  >
    <v-container>
      <div>
        <h3>심리검사등록</h3>
      </div>
      <v-card>
        <v-card-title>
          <div class="text-right">
            <v-btn
              color="info"
              @click="mentalResultInsert"
            >
              등록
            </v-btn>
          </div>
        </v-card-title>
        <v-simple-table>
          <template #default>
            <thead>
              <tr>
                <th class="text-left">
                  번호
                </th>
                <th class="text-left">
                  예약번호
                </th>
                <th class="text-left">
                  이름
                </th>
                <th class="text-left">
                  나이
                </th>
                <th class="text-left">
                  성별
                </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>{{ memberInfo.memberNo }}</td>
                <td>{{ memberInfo.reserveNo }}</td>
                <td>{{ memberInfo.name }}</td>
                <td>{{ memberInfo.jumin1 }}(만 {{ memberInfo.jumin1 - 1 }})세</td>
                <td>{{ memberInfo.gender }}</td>
              </tr>
            </tbody>
          </template>
        </v-simple-table>
        <div>
          심리검사결과
        </div>
        <v-simple-table>
          <template #default>
            <thead>
              <tr>
                <th class="text-left">
                  시각
                </th>
                <th class="text-left">
                  청각
                </th>
                <th class="text-left">
                  운동감각
                </th>
                <th class="text-left">
                  기분상태
                </th>
                <th class="text-left">
                  조절력
                </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>{{ totalInfo.total1 }}</td>
                <td>{{ totalInfo.total2 }}</td>
                <td>{{ totalInfo.total3 }}</td>
                <td>{{ totalInfo.total4 }}</td>
                <td>{{ totalInfo.total5 }}</td>
              </tr>
            </tbody>
          </template>
        </v-simple-table>
        <div>
          <h3>심리검사기준</h3>
        </div>
        <v-simple-table>
          <tr>
            <td class="text-left">
              18~20점 : 기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함
            </td>
          </tr>
          <tr>
            <td class="text-left">
              13~17점 : 기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달시켜야 함
            </td>
          </tr>
          <tr>
            <td class="text-left">
              12점 이하 : 매일 연습을 통해 심상기술을 발달시켜야 함
            </td>
          </tr>
        </v-simple-table>
      </v-card>
      <v-container>
        <div>
          <h3>심리검사 소견서</h3>
        </div>
        <v-col
          cols="12"
        >
          <v-textarea
            v-model="mentalResultForm.comments"
            solo
            name="input-7-4"
            :rules="rules"
            required
          />
        </v-col>
      </v-container>
      <v-divider />
    </v-container>
  </v-form>
</template>

<script>
export default {
    data: () => ({
        mentalResultForm:{
            comments:'',
        },
        rules: [
        value => !!value || '소견서를 작성해주세요.',
        ],

         memberInfo: [
        {
          memberNo: 464,
          reserveNo: 56,
          name: '테스터!!',
          jumin1: 46,
          gender: '남성'
        }
      ],
      totalInfo: [
        {
          total1: '1234',
          total2: '1234',
          total3: '1234',
          total4: '1234',
          total5: '1234'
        }
      ],
    }),
    created(){
        this.getMemberInfo();
        this.getTotalInfo();
        console.log('getMemberInfo : ', this.getMemberInfo);
        console.log('getTotalInfo : ', this.getTotalInfo);
    },
    methods:{
        async getMemberInfo(){
        console.log("memberInfo : ", this.memberInfo);
        let data = {}
        const apiUrl = `vue/doctor/getMemberInfo1/${this.$router.currentRoute.query.id}`;
        const apiSearch = ''
        const [res, err] = await this.$axios.get(apiUrl + apiSearch)
        if (res) {
            console.log("res.data : ", res.data);

            this.memberInfo = res.data;
            var date = new Date();
            var year = date.getFullYear();

            this.memberInfo.jumin1 = (year - 1900) - parseInt(this.memberInfo.jumin1 / 10000);
            this.memberInfo.gender;

            console.log("memberInfo : ", this.memberInfo);
          } else if(err) {
              alert('회원정보 조회 실패');
          }
      },
      async getTotalInfo(){
        console.log("totalInfo : ", this.totalInfo);
        let data = {}
        const apiUrl = `vue/doctor/getMentalInfo/${this.$router.currentRoute.query.id}`;
        const apiSearch = ''
        const [res, err] = await this.$axios.get(apiUrl + apiSearch)
        if (res) {
            console.log("res.data : ", res.data);

            this.totalInfo = res.data;

            this.totalInfo.total1;
            this.totalInfo.total2;
            this.totalInfo.total3;
            this.totalInfo.total4;
            this.totalInfo.total5;

            console.log("totalInfo : ", this.totalInfo);
          } else if(err) {
              alert('심리검사결과 조회 실패');
          }
      },
      async mentalResultInsert(){
        console.log('mentalResultFrom',this.mentalResultForm)
        console.log('mentalResultFrom.comments', this.mentalResultForm.comments)
        const data = this.mentalResultForm;
        let vo ={"comment":data}
        console.log('data여기요', data)
        const apiUrl = `vue/doctor/mentalResultUpdate/${this.$router.currentRoute.query.id}`;
        const apiSearch = ''
        const [res, err] = await this.$axios.put(apiUrl + apiSearch,  data)
        if (res) {
              console.log("updateCnt : ", res.data);
            if (res.data == 1) {
              alert('심리검사소견서 등록 완료')
              this.$router.push('/doctor/ResultList3')
            } else {
              alert('심리검사소견서 등록 실패')
            }
        } else if(err) {
          alert('심리검사소견서 등록 에러')
        }
      },

    }
}
</script>

<style>

</style>
