<template>
  <v-form
    class="pa-10"
  >
    <v-container>
      <div>
        <h3>기초검사등록</h3>
      </div>
      <v-card>
        <v-card-title>
          <div class="float-right">
            <v-btn
              color="info"
              @click="basicResultInsert"
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
      </v-card>
      <v-container>
        <div>
          <h3>체질량검사</h3>
        </div>
        <v-row>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.height"
              label="신장(cm)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.weight"
              label="체중(kg)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.bodyWater"
              label="체수분량(l)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
        </v-row>
      </v-container>
      <v-container>
        <div>
          <h3>혈압검사</h3>
        </div>
        <v-row>
          <v-col
            cols="12"
            sm="6"
          >
            <v-text-field
              v-model="basicResultForm.pressureHigh"
              label="최고혈압(mmHg)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
          <v-col
            cols="12"
            sm="6"
          >
            <v-text-field
              v-model="basicResultForm.pressureLow"
              label="최저혈압(mmHg)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
        </v-row>
      </v-container>
      <v-container>
        <div>
          <h3>소변검사</h3>
        </div>
        <v-row>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.urineProtein"
              label="요단백(mg/dL)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.urineAcid"
              label="요산(mg/dL)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.urineGlucose"
              label="요당(mg/dL)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
        </v-row>
      </v-container>
      <v-container>
        <div>
          <h3>혈액검사</h3>
        </div>
        <v-row>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.redBloodCell"
              label="적혈구(/㎣)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.whiteBloodCell"
              label="백혈구(/㎣)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.bloodPlatelet"
              label="혈소판(/㎣)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
        </v-row>
        <v-row>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.liverFunction"
              label="혈색소(/㎣)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
          <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="basicResultForm.bloodGlucose"
              label="혈당(/㎣)"
              :rules="rules"
              single-line
              full-width
              hide-details
              required
            />
          </v-col>
        </v-row>
      </v-container>
      <v-divider />
    </v-container>
  </v-form>
</template>

<script>
export default {
    data: () => ({
      valid: false,
      basicResultForm:{
          gender:'',
          height:'',
          weight:'',
          bodyWater:'',
          pressureHigh:'',
          pressureLow:'',
          urineProtein:'',
          urineAcid:'',
          urineGlucose:'',
          redBloodCell:'',
          whiteBloodCell:'',
          bloodPlatelet:'',
          liverFunction:'',
          bloodGlucose:'',
        },

        rules: [
        value => !!value || 'Required.',
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
    }),
    created(){
      this.getMemberInfo();
      console.log("query.id : ", this.$router.currentRoute.query.id)
      console.log('basicResultForm : ', this.basicResultForm);
    },
    methods:{
      async getMemberInfo(){
        console.log("memberInfo : ", this.memberInfo);
        let data = {}
        const apiUrl = `vue/doctor/getMemberInfo/${this.$router.currentRoute.query.id}`;
        const apiSearch = ''
        const [res, err] = await this.$axios.get(apiUrl + apiSearch)
        if (res) {
            console.log("res.data : ", res.data);

            this.memberInfo = res.data;
            var date = new Date();
            var year = date.getFullYear();

            this.memberInfo.jumin1 = (year - 1900) - parseInt(this.memberInfo.jumin1 / 10000);
            this.basicResultForm.gender = this.memberInfo.gender;

            console.log("memberInfo : ", this.memberInfo);
          } else if(err) {
              alert('회원정보 조회 실패');
          }
      },
      async basicResultInsert(){
        console.log('basicResultFrom',this.basicResultForm)
        const data = this.basicResultForm
        const apiUrl = `vue/doctor/basicReusltInsert/${this.$router.currentRoute.query.id}`;
        const apiSearch = ''
        const [res, err] = await this.$axios.post(apiUrl + apiSearch, data)
         console.log('data', data)
        if (res) {
              console.log("updateCnt : ", res.data);
            if (res.data == 1) {
              alert('기초검사 데이터 등록 완료')
              this.$router.push('/doctor/ResultList')
            } else {
              alert('기초검사 데이터 등록 실패')
            }
          return
        } else if(err) {
          alert('기초검사 데이터 등록 에러')
        }
      },
    }
}
</script>

<style>

</style>
