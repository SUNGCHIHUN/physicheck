import Vue from 'vue'
import App from './App'
import router from './router'
import vuetify from './plugins/vuetify'
import store from './store'
import axios from './api/axios'
import VueToast from 'vue-toast-notification'
import 'vue-toast-notification/dist/theme-sugar.css'

Vue.config.productionTip = false
Vue.prototype.$axios = axios
Vue.prototype.$host = process.env.VUE_APP_HOST

Vue.use(VueToast, {
  position: 'top-right'
})

new Vue({
  router,
  vuetify,
  store,
  render: h => h(App)
}).$mount('#app')