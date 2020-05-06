import Vue from 'vue'
import VueRouter from 'vue-router'
import Routes from './Routes'

Vue.use(VueRouter)

const routes = Routes

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
