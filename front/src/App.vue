<template>
<div id="app" :class="{'hide-menu': !isMenuVisible }">
  
    <Cabecalho title= "Catálogo de Animais" :hideToggle="false"></Cabecalho>
    <Main></Main>  
    <Conteudo></Conteudo>
    <Rodape></Rodape>

               
  </div>
</template>

<script>
import axios from "axios"

import {mapState} from 'vuex'

export default {
    name: 'app',

    created() {
        
        this.getAnimais();

    },

     computed: mapState(['isMenuVisible']),

    data() {
      
        return {
              titulo: "Catálogo de Animais"  ,
              users: {}, 
        }
    },

    methods: {
        getAnimais(){
            var url = "http://localhost:8081/web/public/animais/listar";
            var vm= this;
            axios.get(url).then(function(r){
                vm.users = r.data
               
            });
        }
    },
}
</script>

<style>
	* {
		font-family: "Lato", sans-serif;
	}
	body {
		margin: 0;
        
	}
	#app {
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		height: 100vh;
		display: grid;
		grid-template-rows: 60px 1fr 40px;
		grid-template-columns: 300px 1fr;
		grid-template-areas:
			"header header"
			"menu content"
			"menu footer";
	}
	#app.hide-menu {
		grid-template-areas:
			"header header"
			"content content"
			"footer footer";
	}
</style>