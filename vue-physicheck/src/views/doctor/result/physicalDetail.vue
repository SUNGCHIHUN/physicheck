<template>
  <table
    class="type10"
    style="margin-left:150px;"
  >
    <tr>
      <th
        scope="cols"
        class="th"
        colspan="2"
        align="center"
      >
        심폐지구력
      </th>
    </tr>
    <tr>
      <th
        scope="row"
        align="center"
      >
        * 3km 달리기
      </th>
      <td align="center">
        {{ list[6] }}
      </td>
    </tr>
    <tr>
      <th
        scope="row"
        class="even"
        align="center"
      >
        * 프로토콜(180회/분)
      </th>
      <td
        class="even"
        align="center"
      >
        {{ list[0].balkeProtocol }}
      </td>
    </tr>
    <tr>
      <td />
      <td />
    </tr>

    <tr>
      <th
        scope="cols"
        class="th"
        colspan="2"
        align="center"
      >
        유연성
      </th>
    </tr>
    <tr>
      <th
        scope="row"
        align="center"
      >
        * 앞으로 굽히기 (cm)
      </th>
      <td align="center">
        {{ list[1].forwardBending }}
      </td>
    </tr>
    <tr>
      <th
        scope="row"
        class="even"
        align="center"
      >
        * 브릿지 테스트 (cm)
      </th>
      <td
        class="even"
        align="center"
      >
        {{ list[1].bridge }}
      </td>
    </tr>
    <tr>
      <td />
      <td />
    </tr>

    <tr>
      <th
        scope="cols"
        class="th"
        colspan="2"
        align="center"
      >
        순발력
      </th>
    </tr>
    <tr>
      <th
        scope="row"
        align="center"
      >
        * 제자리 멀리 뛰기 (cm)
      </th>
      <td align="center">
        {{ list[2].longJump }}
      </td>
    </tr>
    <tr>
      <th
        scope="row"
        class="even"
        align="center"
      >
        * 50m 달리기 (초)
      </th>
      <td
        class="even"
        align="center"
      >
        {{ list[2].run50 }}
      </td>
    </tr>
    <tr>
      <td />
      <td />
    </tr>

    <tr>
      <th
        scope="cols"
        class="th"
        colspan="2"
        align="center"
      >
        근력
      </th>
    </tr>
    <tr>
      <th
        scope="row"
        align="center"
      >
        * 스쿼트 (kg)
      </th>
      <td align="center">
        {{ list[3].squirt }}
      </td>
    </tr>
    <tr>
      <th
        scope="row"
        class="even"
        align="center"
      >
        * 벤치프레스 (kg)
      </th>
      <td
        class="even"
        align="center"
      >
        {{ list[3].benchPress }}
      </td>
    </tr>
    <tr>
      <td />
      <td />
    </tr>

    <tr>
      <th
        scope="cols"
        class="th"
        colspan="2"
        align="center"
      >
        근지구력
      </th>
    </tr>
    <tr>
      <th
        scope="row"
        align="center"
      >
        * 윗몸일으키기 (1분/회)
      </th>
      <td align="center">
        {{ list[4].sitUp }}
      </td>
    </tr>
    <tr>
      <th
        scope="row"
        class="even"
        align="center"
      >
        * 팔굽혀펴기 (2분/회)
      </th>
      <td
        class="even"
        align="center"
      >
        {{ list[4].pushUp }}
      </td>
    </tr>
    <tr>
      <td />
      <td />
    </tr>

    <tr>
      <th
        scope="cols"
        class="th"
        colspan="2"
        align="center"
      >
        민첩성
      </th>
    </tr>
    <tr>
      <th
        scope="row"
        align="center"
      >
        * 사이드스텝 (20초/회)
      </th>
      <td align="center">
        {{ list[5].sideStep }}
      </td>
    </tr>
    <tr>
      <th
        scope="row"
        class="even"
        align="center"
      >
        * 버피테스트 (30초/회)
      </th>
      <td
        class="even"
        align="center"
      >
        {{ list[5].burpeeTest }}
      </td>
    </tr>
    <tr>
      <td />
      <td />
    </tr>
  </table>
</template>


<script>
  export default {
    data () {
      return {


        list: [



        ],
        run3KmTest: 0,
      }
    },

    created () {
      this.fetchList()
    },
    methods: {
      async fetchList () {
        let data = {}
        const apiUrl = `/vue/doctor/vueCustomerDetail2/${this.$router.currentRoute.query.id}`
        const apiSearch = ''
        const [res, err] = await this.$axios.get(apiUrl + apiSearch)
        if (err) {
          console.log(err)

          return
        }
        this.list = res.data

        console.log(res.data)
      },
      detail(item) {
        console.log(item)
        this.$router.push({
            path: 'vueCustomerDetail2',
            query: {
              id: item.reserveNo
            }
        })
      }
    }

  }
</script>
<style>
table.type10 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
}
.th {
  width: 350px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #e7708d;
  margin: 20px 10px;
}
table.type10 th {
  width: 250px;
  padding: 10px;
}
table.type10 td {
  width: 300px;
  padding: 10px;
  vertical-align: top;
}
table.type10 .even {
  background: #fdf3f5;
}
</style>
