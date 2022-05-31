<template>
  <v-form
    ref="form"
    class="pa-4 pt-6"
  >
    <v-text-field
      v-model="memberData.id"
      filled
      color="deep-purple"
      counter=""
      label="아이디"
      style="min-height: 96px"
      type="text"
      disabled
    />
    <v-text-field
      v-model="memberData.password"
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
      v-model="memberData.name"
      filled
      color="deep-purple"
      counter=""
      label="이름"
      style="min-height: 96px"
      type="text"
      disabled
    />
    <v-row>
      <v-col>
        <v-text-field
          v-model="memberData.jumin1"
          :rules="[rules.juminlength(6)]"
          filled
          color="deep-purple"
          counter="6"
          label="주민번호 앞자리"
          style="max-width: 600px"
          type="text"
          disabled
        />
      </v-col>
      <v-col>
        <v-text-field
          v-model="memberData.jumin2"
          :rules="[rules.juminlength(7)]"
          filled
          color="deep-purple"
          counter="7"
          label="주민번호 뒷자리"
          style="min-height: 96px"
          type="text"
          disabled
        />
      </v-col>
    </v-row>
    * 성별
    <v-radio-group
      v-model="memberData.gender"
      disabled
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
      v-model="memberData.tel"
      filled
      color="deep-purple"
      label="연락처"
      required
    />
    <v-text-field
      v-model="memberData.email"
      :rules="[rules.email]"
      filled
      color="deep-purple"
      label="이메일"
      type="email"
    />
    <v-row>
      <v-col>
        <v-text-field
          v-model="memberData.address"
          filled
          placeholder="주소"
          type="text"
        />
      </v-col>
    </v-row>

    <v-divider />
    <v-row>
      <v-col class="text-right ">
        <v-btn
          color="info"
          height="55px"
          @click="mypageUpdate"
        >
          수정
        </v-btn>
        <v-btn
          color="info"
          height="55px"
          @click="mypageDelete"
        >
          탈퇴
        </v-btn>
      </v-col>
    </v-row>
  </v-form>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  data: () => ({
      memberData:[{
         agreement:'',
         dialog: '',
         email: '',
         form: '',
         isLoading: '',
         id: '',
         password: '',
         name: '',
         jumin1: '',
         jumin2: '',
         phone: '',
         radioGroup: '',
         address: '',
        }
      ],
      rules: {
        email: v => !!(v || '').match(/@/) || '이메일 형식으로 작성하세요.',
        length: len => v => (v || '').length >= len || `${len}자리 이상 작성하세요.`,
        juminlength: length => v => (v || '').length <= length || `${length}자리 이하로 작성하세요.`,
        required: v => !!v || '필수사항 입니다.',
      },
    }),
    created(){
      this.memberInfo();
    },
    methods: {
    ...mapGetters(['getId']),
    // MemberInfo select
    async memberInfo(){
      let data = {}
        const id = this.getId()
        const apiUrl = `vue/customer/getMemberInfo/${id}`
        const apiSearch = ''
        const [res, err] = await this.$axios.get(apiUrl + apiSearch)
        if (res) {
            console.log("res.data : ", res.data);

            this.memberData = res.data;

            this.memberData.id;
            this.memberData.name;
            this.memberData.jumin1;
            this.memberData.jumin2
            this.memberData.gender;
            this.memberData.phone;
            this.memberData.email;
            this.memberData.address;

            console.log("memberInfo : ", this.memberInfo);
          } else if(err) {
              alert('회원정보 조회 실패');
          }
    },
    // MemberInfo update
    async mypageUpdate(){
        console.log('memberData',this.memberData)
        const data = this.memberData;
        console.log('data여기요udt', data)
        const apiUrl = `vue/customer/setMemberInfo/${data.id}`;
        const apiSearch = ''
        const [res, err] = await this.$axios.put(apiUrl + apiSearch,  data)
        if (res) {
              console.log("updateCnt : ", res.data);
            if (res.data == 1) {
              alert('회원정보 수정 완료')
              this.$router.push('/')
            } else {
              alert('회원정보 수정 실패')
            }
        } else if(err) {
          alert('회원정보 수정 에러')
        }
    },
    // MemberInfo delete
    async mypageDelete(){
        console.log('memberData',this.memberData)
        const data = this.memberData;
        console.log('data여기요del', data)
        const apiUrl = `vue/customer/memberDelete/${data.id}`;
        const apiSearch = ''
        console.log('api 탔어', data)
        const [res, err] = await this.$axios.delete(apiUrl + apiSearch,  data)
        if (res) {
              console.log("updateCnt : ", res.data);
            if (res.data == 1) {
              alert('회원 탈퇴 완료')
              this.$router.push('/')
            } else {
              alert('회원 탈퇴 실패')
            }
        } else if(err) {
          alert('회원정보 탈퇴 에러')
        }

    },
  },
}
</script>

<style>

</style>
