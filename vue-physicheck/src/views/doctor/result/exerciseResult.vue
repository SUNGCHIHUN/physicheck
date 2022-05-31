<template>
  <main class="page-content">
    <div
      class="container-fluid"
      style="padding: 100px;"
      align="center"
    >
      <h2>
        운동능력검사등록
      </h2>
      <hr>

      <!-- 테이블 내용 시작 -->
      <v-form v-model="valid">
        <div
          class="container"
        >
          <div
            class="row"
          >
            <table
              width="100%"
              style="border: none; padding: 0px; margin-left: 100px;"
            >
              <tr align="right">
                <td
                  align="right"
                  style="border: none;"
                >
                  <v-btn
                    depressed
                    color="primary"
                    width="5%"
                    height="60"
                    style="font-size: 24px;"
                    @click="physicalInsert" 
                  >
                    등록
                  </v-btn>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <div class="container">
          <!-- 테이블 내용 시작 -->					
          <div style="padding-top: 50px">
            <h5>회원정보</h5>
            <table class="physicalTable">
              <tr>
                <th scope="col">
                  번호
                </th>
                <td>{{ memberInfo.memberNo }}</td>
                <th scope="col">
                  예약번호
                </th>
                <td>{{ memberInfo.reserveNo }}</td>
              </tr>
              <tr>
                <th scope="col">
                  이름
                </th>
                <td>{{ memberInfo.name }}</td>
                <th scope="col">
                  나이
                </th>
                <td>
                  {{ memberInfo.jumin1 }}세(만 {{ memberInfo.jumin1 - 1 }}세)
                </td>
              </tr><tr>
                <th scope="col">
                  성별
                </th>
                <td>
                  {{ memberInfo.gender }}
                </td>
                <th scope="col">
                  -
                </th>
                <td>-</td>
              </tr>
            </table>
          </div>
				
          <div style="padding-top: 20px">
            <h5>심페지구력</h5>
            <table class="physicalTable">
              <tr>
                <th width="20%">
                  3km 달리기 (분:초)
                </th>
                <td width="15%">
                  <v-text-field
                    v-model="exerciseData.run3km1"
                    :rules="numberRules"
                    :counter="5"
                    label="분"
                    required
                  />
                </td> 
                <td width="15%">
                  <v-text-field
                    v-model="exerciseData.run3km2"
                    :rules="numberRules"
                    :counter="5"
                    label="초"
                    required
                  />
                </td>
                <th width="20%">
                  Balke 프로토콜 (180회/분)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.balke"
                    :rules="numberRules"
                    :counter="5"
                    label="180회/분"
                    required
                  />
                </td>
              </tr>
            </table>
          </div>
				
          <div style="padding-top: 20px">
            <h5>유연성</h5>
            <table class="physicalTable">
              <tr>
                <th width="20%">
                  앞으로 굽히기 (cm)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.forward"
                    :rules="numberRules"
                    :counter="5"
                    label="cm"
                    required
                  />
                </td>
                <th width="20%">
                  브릿지 테스트 (cm)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.bridge"
                    :rules="numberRules"
                    :counter="5"
                    label="cm"
                    required
                  />
                </td>
              </tr>
            </table>
          </div>
				
          <div style="padding-top: 20px">
            <h5>순발력</h5>
            <table class="physicalTable">
              <tr>
                <th width="20%">
                  제자리 멀리 뛰기 (cm)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.longJump"
                    :counter="5"
                    label="cm"
                    required
                  />
                </td>
                <th width="20%">
                  50m 달리기 (초)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.run50"
                    :counter="5"
                    label="초"
                    required
                  />
                </td>
              </tr>
            </table>
          </div>
				
          <div style="padding-top: 20px">
            <h5>근력</h5>
            <table class="physicalTable">
              <tr>
                <th colspan="4">
                  스쿼트
                </th>
              </tr>
              <tr>
                <th width="20%">
                  체중 (kg)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.weight1"
                    :rules="numberRules"
                    :counter="5"
                    label="kg"
                    required
                  />
                </td>
                <th width="20%">
                  무게 (kg)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.squirt"
                    :rules="numberRules"
                    :counter="5"
                    label="kg"
                    required
                  />
                </td>
              </tr>
              <tr>
                <th colspan="4">
                  벤치 프레스
                </th>
              </tr>
              <tr>
                <th width="20%">
                  체중 (kg)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.weight2"
                    :rules="numberRules"
                    :counter="5"
                    label="1분/회"
                    required
                  />
                </td>
                <th width="20%">
                  무게 (kg)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.bench"
                    :rules="numberRules"
                    :counter="5"
                    label="2분/회"
                    required
                  />
                </td>
              </tr>
            </table>
          </div>
				
          <div style="padding-top: 20px">
            <h5>근지구력</h5>
            <table class="physicalTable">
              <tr>
                <th width="20%">
                  윗몸일으키기 (1분/회)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.sitUp"
                    :rules="numberRules"
                    :counter="5"
                    label="1분/회"
                    required
                  />
                </td>
                <th width="20%">
                  팔굽혀펴기 (2분/회)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.pushUp"
                    :rules="numberRules"
                    :counter="5"
                    label="2분/회"
                    required
                  />
                </td>
              </tr>
            </table>
          </div>
				
          <div style="padding-top: 20px">
            <h5>민첩성</h5>
            <table class="physicalTable">
              <tr>
                <th width="20%">
                  사이드 스텝 (20초/회)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.sideStep"
                    :rules="numberRules"
                    :counter="5"
                    label="20초/회"
                    required
                  />
                </td>
                <th width="20%">
                  버피 테스트 (30초/회)
                </th>
                <td width="30%">
                  <v-text-field
                    v-model="exerciseData.burpeeTest"
                    :rules="numberRules"
                    :counter="5"
                    label="30초/회"
                    required
                  />
                </td>
              </tr>
            </table>
          </div>
          <hr>
        </div>
      </v-form>
    </div>
  </main>
</template>
<script>
  
  export default {
    data: () => ({
      exerciseData: {
        gender: '',
        run3km1: 0,
        run3km2: 0,
        balke: 0,
        forward: 0,
        bridge: 0,
        longJump: 0,
        run50: 0,
        weight1: 0,
        squirt: 0,
        weight2: 0,
        bench: 0,
        sitUp: 0,
        pushUp: 0,
        sideStep: 0,
        burpeeTest: 0,
      },
      numberRules: [
        v => !!v || '수치를 입력하세요.',
        v => !isNaN(v) || '숫자만 입력 가능합니다.',
        v => v <= 99999 || '5자리까지 입력 가능합니다.',
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
    created() {
        this.getMemberInfo();
    },
    methods: {
      async getMemberInfo() {
          const data = {}
          const apiUrl = `vue/doctor/getMemberInfo/${this.$router.currentRoute.query.id}`;
          const apiSearch = ''
          const [res, err] = await this.$axios.get(apiUrl + apiSearch);
          if (res) {

            this.memberInfo = res.data;
            var date = new Date();
            var year = date.getFullYear();

            this.memberInfo.jumin1 = (year - 1900) - parseInt(this.memberInfo.jumin1 / 10000);
            this.exerciseData.gender = this.memberInfo.gender;

          } else if(err) {
              alert('회원정보 조회 실패');
          }
      },

      async physicalInsert() {
        const data = this.exerciseData
        const apiUrl = `vue/doctor/exerciseResultAction/${this.$router.currentRoute.query.id}`;
        const apiSearch = ''
        const [res, err] = await this.$axios.post(apiUrl + apiSearch, data)
        if (res) {
            if (res.data == 1) {
              alert('운동검사 데이터 등록 완료')
              this.$router.push('/doctor/ResultList2')
            } else {
              alert('운동검사 데이터 등록 실패')
            }
          return
        } else if(err) {
          alert('운동검사 데이터 등록 에러')
        }
      }
  }
}
</script>

<style scoped>

  physicalTable {
    border: 1px solid lightgrey;
  }

  hr {
    width: 80%;
  }

  h5 {
    font-size: 20px;
    text-align: left;
    margin: 10px;
    padding-left: 160px;
  }

  table{
    width: 80%;
    border: 1px solid lightgrey;
    border-collapse: collapse;
  }

  th {
    padding: 20px;
    font-size: 24px;
    text-align: left;
    border: 1px solid lightgrey;
  }

  td {
    padding: 10px;
    border: 1px solid lightgrey;
  }

</style>