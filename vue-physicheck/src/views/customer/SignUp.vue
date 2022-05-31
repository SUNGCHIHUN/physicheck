<template>
  <v-form
    ref="form"
    v-model="form"
    class="pa-4 pt-6"
  >
    <v-text-field
      v-model="createMember.id"
      filled
      color="deep-purple"
      counter=""
      label="아이디"
      style="min-height: 96px"
      type="text"
      required
    />
    <v-text-field
      v-model="createMember.password"
      :rules="[rules.length(4)]"
      filled
      color="deep-purple"
      counter=""
      label="비밀번호"
      style="min-height: 96px"
      type="password"
      required
    />
    <v-text-field
      v-model="createMember.name"
      filled
      color="deep-purple"
      counter=""
      label="이름"
      style="min-height: 96px"
      type="text"
      required
    />
    <v-row>
      <v-col>
        <v-text-field
          v-model="createMember.jumin1"
          :rules="[rules.juminlength(6)]"
          filled
          color="deep-purple"
          counter="6"
          label="주민번호 앞자리"
          style="max-width: 600px"
          type="text"
          required
        />
      </v-col>
      <v-col>
        <v-text-field
          v-model="createMember.jumin2"
          :rules="[rules.juminlength(7)]"
          filled
          color="deep-purple"
          counter="7"
          label="주민번호 뒷자리"
          style="min-height: 96px"
          type="text"
          required
        />
      </v-col>
    </v-row>
    * 성별
    <v-radio-group
      v-model="createMember.gender"
    >
      <v-radio
        label="남성"
        value="남성"
      />
      <v-radio
        label="여성"
        value="여성"
      />
    </v-radio-group>
    <v-text-field
      v-model="createMember.tel"
      filled
      color="deep-purple"
      label="연락처"
      required
    />
    <v-row>
      <v-col>
        <v-text-field
          v-model="createMember.eamil1"
          style="max-width: 800px"
          filled
          color="deep-purple"
          label="이메일"
          required
        />
      </v-col>
      <v-col>
        <v-text-field
          v-model="createMember.email2"
          style="max-width: 800px"
          filled
          color="deep-purple"
          label="이메일 주소"
          required
        />
      </v-col>
    </v-row>
    <v-row>
      <v-col>
        <v-text-field
          v-model="createMember.postcode"
          style="max-width: 800px"
          filled
          placeholder="우편번호"
          type="text"
        />
      </v-col>
      <v-col>
        <v-text-field
          v-model="createMember.address"
          style="max-width: 800px"
          filled
          placeholder="주소"
          type="text"
        />
      </v-col>
    </v-row>
    <v-text-field
      v-model="createMember.detailAddress"
      style="max-width: 1200px"
      filled
      placeholder="상세주소"
      type="text"
    />
    <v-btn
      height="55px"
      color="info"
      @click="execDaumPostcode()"
    >
      우편번호 찾기
    </v-btn>
    <v-row align="center">
      <v-col
        style="font-size: 36px; text-align:center; font-weight:bold;"
      >
        <v-btn
          depressed
          color="primary"
          width="30%"
          height="100"
          style="font-size: 36px;"
          rounded
          @click="insertMember"
        >
          등록
        </v-btn>
      </v-col>
    </v-row>
  </v-form>
</template>

<script>
export default {
  data () {
    return {
      agreement: false,
      dialog: false,
      form: false,
      isLoading: false,
      rules: {
        email: v => !!(v || '').match(/@/) || '이메일 형식으로 작성하세요.',
        length: len => v => (v || '').length >= len || `${len}자리 이상 작성하세요.`,
        juminlength: length => v => (v || '').length <= length || `${length}자리 이하로 작성하세요.`,
        required: v => !!v || '필수사항 입니다.',
      },
      createMember: {
        id: undefined,
        password: undefined,
        name: undefined,
        jumin1: undefined,
        jumin2: undefined,
        tel: undefined,
        emial1: undefined,
        email2: undefined,
        gender: undefined,
        address: "",
        detailAddress: "",
        postcode: ""
      }
    }
  },
  methods: {
    execDaumPostcode() {
      new window.daum.Postcode({
        oncomplete: (data) => {
          if (this.extraAddress !== "") {
            this.extraAddress = "";
          }
          if (data.userSelectedType === "R") {
            // 사용자가 도로명 주소를 선택했을 경우
            this.createMember.address = data.roadAddress;
          } else {
            // 사용자가 지번 주소를 선택했을 경우(J)
            this.createMember.address = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if (data.userSelectedType === "R") {
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
              this.extraAddress += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== "" && data.apartment === "Y") {
              this.extraAddress +=
                this.extraAddress !== ""
                  ? `, ${data.buildingName}`
                  : data.buildingName;
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (this.extraAddress !== "") {
              this.extraAddress = `(${this.extraAddress})`;
            }
          } else {
            this.extraAddress = "";
          }
          // 우편번호를 입력한다.
          this.createMember.postcode = data.zonecode;
        },
      }).open();
    },
    async insertMember() {
      console.log(this.createMember)
      const data = this.createMember
      const apiUrl = '/vue/customer/join'
      const apiSearch = ''
      const [res, err] = await this.$axios.post(apiUrl + apiSearch, data)
      if (res) {
        alert('success')
        this.$router.push('/')
        return
      } else if(err) {
        alert('fail')
      }
    }
  },
}
</script>

<style>

</style>
