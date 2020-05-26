import Vue from 'vue'
import router from './router'
import store from './store'
import axios from './axios.js'
import App from './App.vue'

Vue.config.productionTip = false
Vue.use(axios)

new Vue({
  router,
  store,
  axios,
  render: h => h(App)
}).$mount('#app')
