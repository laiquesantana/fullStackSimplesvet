
require('./bootstrap');
import Vue from 'vue'
import App from './App.vue'
import vueResource from 'vue-resource'

Vue.config.productionTip = false

import moment from 'moment';
import VueRouter from 'vue-router'


import Swal from 'sweetalert2'
window.Swal = Swal;

Vue.use(VueRouter)
Vue.use(vueResource)

import VueProgressBar from 'vue-progressbar'
Vue.use(VueProgressBar, {
  color: 'rgb(143, 255, 199)',
  failedColor: 'red',
  height: '2px'
})



var animais = Vue.component('animais', require('./components/Animais.vue').default);
var router = new VueRouter({
  mode: 'history',
  routes:[
      {path:'/animais', name:'pet' ,component: animais}
  ]
})


Vue.component('rodape', require('./components/Rodape.vue').default);


Vue.filter('upText',function(text){
  return text.charAt(0).toUpperCase() + text.slice(1);
});

Vue.filter('especie',function(text){

  return text !=1? " Gato" :"Cachorro" ;
});

Vue.filter('sexo',function(text){

  return text =="M"? " Masculino" :"Femenino" ;
});


Vue.filter('myDate',function(created){
  moment.locale('pt-BR');
  return moment(created).format('LL');
});

Vue.config.devtools = true
new Vue({
  router,
  render: h => h(App),
  
}).$mount('#app')