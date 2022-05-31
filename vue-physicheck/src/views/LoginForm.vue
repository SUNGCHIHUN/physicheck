<template>
  <v-main>
    <v-container>
      <v-form
        ref="form"
        v-model="valid"
        lazy-validation
      >
        <v-text-field
          v-model="user.id"
          :counter="10"
          :rules="idRules"
          label="ID"
          required
        />

        <v-text-field
          v-model="user.password"
          :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
          :rules="passwordRules"
          :type="show ? 'text' : 'password'"
          label="Password"
          required
          @click:append="show = !show"
        />

        <v-btn
          :disabled="!valid"
          color="success"
          class="mr-4"
          @click="login"
        >
          로그인
        </v-btn>
        <router-link
          to="/signup"
          style="text-decoration: none"
        >
          <v-btn
            :disabled="!valid"
            color="warning"
            class="mr-4"
          >
            회원가입
          </v-btn>
        </router-link>
      </v-form>
    </v-container>
  </v-main>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';
export default {
  name: "LoginForm",
  data() {
    return {
      valid: true,
      show: false,
      idRules: [(v) => !!v || "아이디를 입력해주세요!"],
      passwordRules: [(v) => !!v || "비밀번호를 입력해주세요!"],
      user: {
        id: "",
        password: "",
      },
    };
  },
  methods: {
    ...mapActions(['SET_AUTHORITIES', 'SET_ID']),
    async login() {
      let result = this.$refs.form.validate();
      if (result) {
        let apiUrl = `/vueLogin`;
        let data = this.user;

        await this.$axios.post(apiUrl, data)
        .then((result) => {
          if (result[0].data.success) {
            console.log('data : ', result[0].data)
            const authority = result[0].data.contents[0].authority
            const id = result[0].data.id
            console.log('id : ', id)
            this.$toast.open(result[0].data.message)
            this.SET_AUTHORITIES(authority)
            this.SET_ID(id)
            this.$router.push('/')
          } else {
            this.$toast.open(result[0].data.message)
            this.$router.push('/')
          }
        }).catch(error => {
          console.log(error)
        });
      }
    },
  },
};
</script>

<style>
</style>
