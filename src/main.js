import Vue from 'vue'
import router from './router'
import App from './App.vue'

import { BootstrapVue, BootstrapVueIcons } from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)
Vue.use(BootstrapVueIcons)
Vue.use(router)
console.log("api" + process.env.VUE_APP_API)
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
