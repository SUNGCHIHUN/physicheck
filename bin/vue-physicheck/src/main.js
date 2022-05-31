import Vue from 'vue'
import App from './App'
import router from './router'
import vuetify from './plugins/vuetify'
import store from './store'
import axios from './api/axios'

//axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*';
//axios.defaults.headers.get['Content-Type'] = 'application/json;charset=utf-8';

Vue.config.productionTip = false
Vue.prototype.$axios = axios
Vue.prototype.$host = process.env.VUE_APP_HOST

new Vue({
  router,
  vuetify,
  store,
  render: h => h(App)
}).$mount('#app')
