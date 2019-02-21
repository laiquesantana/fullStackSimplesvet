
require('./bootstrap');
import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

import moment from 'moment';
import VueRouter from 'vue-router'


import Swal from 'sweetalert2'
window.Swal = Swal;

Vue.use(VueRouter)

import VueProgressBar from 'vue-progressbar'
Vue.use(VueProgressBar, {
  color: 'rgb(143, 255, 199)',
  failedColor: 'red',
  height: '2px'
})




Vue.component('animais', require('./components/Animais.vue').default);
Vue.component('rodape', require('./components/Rodape.vue').default);


Vue.filter('upText',function(text){
  return text.charAt(0).toUpperCase() + text.slice(1);
});

Vue.filter('myDate',function(created){
  moment.locale('pt-BR');
  return moment(created).format('LLLL');
});


new Vue({
  render: h => h(App),
}).$mount('#app')
