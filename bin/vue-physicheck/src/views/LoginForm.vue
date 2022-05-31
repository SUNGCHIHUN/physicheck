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
          Login
        </v-btn>

        <v-btn
          :disabled="!valid"
          color="warning"
          class="mr-4"
          @click="test"
        >
          Test
        </v-btn>

        <v-btn
          color="error"
          class="mr-4"
          @click="reset"
        >
          Reset Form
        </v-btn>
      </v-form>
    </v-container>
  </v-main>
</template>

<script>
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
    login() {
      let result = this.$refs.form.validate();

      if (result) {
        const formData = new FormData()
        formData.append('id', this.user.id)
        formData.append('password', this.user.password)

        let apiUrl = `/login`;
        let data = formData;

        this.$axios.post(apiUrl, data)
        .then((result) => {
          console.log(result);
        }).catch(error => {
          console.log(error)
        });
      }
    },

    test() {
      let apiUrl = `/test`;
      this.$axios.get(apiUrl).then((result) => {
        console.log(result);
      });
    },

    reset() {
      this.$refs.form.reset();
    },
  },
};
</script>

<style>
</style>
