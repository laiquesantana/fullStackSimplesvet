
import 'font-awesome/css/font-awesome.css'
import Vue from 'vue'
import App from './App.vue'
import store from './config/store'
import './mensagens'
import vueResource from 'vue-resource'
import './config/bootstrap'
import VueProgressBar from 'vue-progressbar'
import VeeValidate from 'vee-validate';
import VueTheMask from 'vue-the-mask'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css' // Ens

Vue.use(Vuetify)

const configValidacao = {
  aria: true,
  classNames: {},
  classes: false,
  delay: 0,
  dictionary: null,
  errorBagName: 'errors', // change if property conflicts
  events: 'input|blur',
  fieldsBagName: 'fieldsValid',
  i18n: null, // the vue-i18n plugin instance
  i18nRootKey: 'validations', // the nested key under which the validation messages will be located
  inject: true,
  locale: 'en',
  validity: false
};

Vue.use(VeeValidate, configValidacao);

Vue.config.productionTip = false

import moment from 'moment';
import VueRouter from 'vue-router'


import Swal from 'sweetalert2'
window.Swal = Swal;


Vue.use(VueRouter)
Vue.use(vueResource)
Vue.use(VueTheMask)


const options = {
  color: '#bffaf3',
  failedColor: '#874b4b',
  thickness: '5px',
  transition: {
    speed: '0.2s',
    opacity: '0.6s',
    termination: 300
  },
  autoRevert: true,
  location: 'left',
  inverse: false
}

Vue.use(VueProgressBar, options)


var animais = Vue.component('animais', require('./components/Animais.vue').default);
var not_found = Vue.component('not-found', require('./components/NotFound.vue').default);
var home = Vue.component('home', require('./components/Home.vue').default);
var adminPages = Vue.component('AdminPages', require('./components/AdminPages.vue').default);
var adocao = Vue.component('adocao', require('./components/Adocao.vue').default);
var router = new VueRouter({
  mode: 'history',
  routes:[
      {path:'/animais', name:'pet' ,component: animais},
      {path:'/not-found', name:'not_found' ,component: not_found},
      {path:'/home', name:'home' ,component: home},
      {path:'/admin', name:'admin' ,component: adminPages},
      {path:'/adocao', name:'adocao' ,component: adocao}
      
  ]
})


Vue.component('Rodape', require('./components/Rodape.vue').default);

Vue.component('Cabecalho', require('./components/Header.vue').default);
Vue.component('Main', require('./components/Menu.vue').default);
Vue.component('Conteudo', require('./components/Content.vue').default);
Vue.component('UserDropDown', require('./components/UserDropDown.vue').default);
Vue.component('Inicio', require('./components/Home.vue').default);



Vue.filter('upText',function(text){
  return text.charAt(0).toUpperCase() + text.slice(1);
});



Vue.filter('retornaIdade',function(text){

    if(text >365){
        return Math.floor(text/365) +" Ano(s)";  
    }else if(text > 30){
          return Math.floor(text/30) +" Mes(es)";
    }else{
        return text +" Dia(s)";
    }

});


Vue.filter('especie',function(text){

  return text !=1? " Gato" :"Cachorro" ;
});

Vue.filter('sexo',function(text){

  return text =="M"? " Macho" :"Femêa" ;
});

Vue.filter('dataNull',function(text){

  return text ==null ?" Não Informado" :text ;
});

Vue.filter('myDate',function(created){
  moment.locale('pt-BR');
  if (created == null){
    return 'Não Informado';
  }
  return moment(created).format('LL');
});

Vue.config.devtools = true
new Vue({
  router,
  store,
  render: h => h(App),
  
}).$mount('#app')