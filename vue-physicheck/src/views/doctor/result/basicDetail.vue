<template>
  <v-container>
    <v-card>
      <v-card-title>
        <div>
          <h3>기초검사결과</h3>
        </div>
      </v-card-title>
      <div>
        <br>
        <h3>회원정보</h3>
      </div>
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
      <hr style="color:gray">
      <div>
        <br>
        <h3>기초검사결과</h3>
      </div>
      <table class="pa-10">
        <tr>
          <th
            scope="cols"
            class="th"
            align="center"
          >
            구분
          </th>
          <th
            scope="cols"
            class="th"
            align="center"
          >
            검사항목
          </th>
          <th
            scope="cols"
            class="th"
            align="center"
          >
            결과
          </th>
          <th
            scope="cols"
            class="th"
            align="center"
          >
            정상수치
          </th>
        </tr>
        <!-- 기초검사 -->
        <tr>
          <th
            scope="row"
            align="center"
            rowspan="6"
          >
            기초검사
          </th>
          <td align="center">
            신장(cm)
          </td>
          <td align="center">
            {{ list[0].height }}
          </td>
          <td align="center">
            -
          </td>
        </tr>

        <tr>
          <td align="center">
            체중(kg)
          </td>
          <td align="center">
            {{ list[0].weight }}
          </td>
          <td align="center">
            -
          </td>
        </tr>

        <tr>
          <td align="center">
            체질량(BMI)(kg/m2)
          </td>
          <td align="center">
            {{ list[0].bmi }}
          </td>
          <td align="center">
            18.5 이상 22.9 미만
          </td>
        </tr>

        <tr>
          <td align="center">
            체지방(g/cm3)
          </td>
          <td align="center">
            {{ list[0].bodyFat }}
          </td>
          <td align="center">
            -
          </td>
        </tr>

        <tr>
          <td align="center">
            근량(kg)
          </td>
          <td align="center">
            {{ list[0].bodyMuscle }}
          </td>
          <td align="center">
            -
          </td>
        </tr>

        <tr>
          <td align="center">
            체수분량(ml)
          </td>
          <td align="center">
            {{ list[0].bodyWater }}
          </td>
          <td align="center">
            -
          </td>
        </tr>

        <!-- 혈압검사 -->
        <tr>
          <th
            scope="row"
            align="center"
            rowspan="2"
          >
            혈압검사
          </th>
          <td align="center">
            최고혈압(mmHg)
          </td>
          <td align="center">
            {{ list[1].pressureHigh }}
          </td>
          <td
            align="center"
            rowspan="2"
          >
            최고혈압 : 130mmHg미만  <br>
            최저혈압 : 130mmHg미만
          </td>
        </tr>

        <tr>
          <td align="center">
            최저혈압(mmHg)
          </td>
          <td align="center">
            {{ list[1].pressureLow }}
          </td>
        </tr>

        <!-- 혈액검사 -->
        <tr>
          <th
            scope="row"
            align="center"
            rowspan="4"
          >
            혈액검사
          </th>
          <td align="center">
            적혈구수(10^6 /㎣)
          </td>
          <td align="center">
            {{ list[3].redBloodCell }}
          </td>
          <td align="center">
            남성 : 4.2~6.3 (10^6/㎣) <br>
            여성 : 4.0~5.4 (10^6/㎣)
          </td>
        </tr>

        <tr>
          <td align="center">
            백혈구 수(10^3/㎣)
          </td>
          <td align="center">
            {{ list[3].whiteBloodCell }}
          </td>
          <td align="center">
            4.0(10^3/㎣) 이상 <br>
            4.0(10^3/㎣) 이하
          </td>
        </tr>

        <tr>
          <td align="center">
            혈소판 수(10^3/㎣)
          </td>
          <td align="center">
            {{ list[3].liverFunction }}
          </td>
          <td align="center">
            130(10^3/㎣)이상 <br>
            350(10^3/㎣)미만
          </td>
        </tr>

        <tr>
          <td align="center">
            혈색소(10^3/㎣)
          </td>
          <td align="center">
            {{ list[3].bloodGlucose }}
          </td>
          <td align="center">
            13.0(10^3/㎣) 이상<br>
            17.0(10^3/㎣) 미만
          </td>
        </tr>

        <!-- 소변검사 -->
        <tr>
          <th
            scope="row"
            align="center"
            rowspan="3"
          >
            소변검사
          </th>
          <td align="center">
            요단백(mg/dL)
          </td>
          <td align="center">
            {{ list[2].urineProtein }}
          </td>
          <td align="center">
            10mg/dL 이하
          </td>
        </tr>

        <tr>
          <td align="center">
            요산(mg/dL)
          </td>
          <td align="center">
            {{ list[2].urineAcid }}
          </td>
          <td align="center">
            250mg/dL 이상
            750mg/dL 이하
          </td>
        </tr>

        <tr>
          <td align="center">
            요당(mg/dL)
          </td>
          <td align="center">
            {{ list[2].urineGlucose }}
          </td>
          <td align="center">
            30mg/dL 이하
          </td>
        </tr>
      </table>
    </v-card>
  </v-container>
</template>

<script>
export default {
    data:() => ({
        list:[],
        memberInfo:[
            {
                memberNo: 412,
                reserveNo: 56,
                name: '테스트',
                jumin1: 123,
                gender: '남성',
            }
        ]
    }),
    created(){
        this.getMemberInfo();
        console.log('getMemberInfo : ', this.getMemberInfo);
        console.log("query.id : ", this.$router.currentRoute.query.id)
        this.fetchList()
    },
    methods:{
        async getMemberInfo(){
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
            this.memberInfo.gender;

            console.log("memberInfo : ", this.memberInfo);
          } else if(err) {
              alert('회원정보 조회 실패');
          }
        },
        async fetchList(){
             let data = {}
            const apiUrl = `/vue/doctor/basicCustomerResult/${this.$router.currentRoute.query.id}`
            const apiSearch = ''
            const [res, err] = await this.$axios.get(apiUrl + apiSearch)
            if (err) {
                console.log(err)
                return
            }
            this.list = res.data
            console.log(res.data)
        },
    }

}
</script>

<style>
table.type10 {
  border-collapse: collapse;
  text-align: center;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
.th {
  width: 350px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #8181F7;
  margin: 20px 10px;
}
table.type10 th {
  width: 100%;
  padding: 10px;
}
table.type10 td {
  width: 100%;
  padding: 10px;
  vertical-align: top;
}
table.type10 .even {
  background: #fdf3f5;
}
</style>
