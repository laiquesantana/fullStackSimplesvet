<template>
  <div id="app">
      <router-link :to="{name: 'pet'}" >Catálogo</router-link>
     	{{  titulo  }}

           <div class="card-body table-responsive p-0">
            <table class="table table-hover">
              <tbody>
                <tr>
                  <th>ID</th>
                  <th>Nome</th>
                  <th>Raca</th>
                  <th>Chip</th>
                  <th>Data de Nascimento</th>
                  <th>Data de Atualização</th>
                  <th>Data de Falecimento</th>
                  <th>Sexo</th>
                  <th>Especie</th>
                </tr>
                <tr v-for="user in users" :key="user.id">
                  <td>{{user.id}}</td>
                  <td>{{user.nome | upText}}</td>
                  <td>{{user.raca_id}}</td>
                  <td>{{user.chip}}</td>
                  <td>{{user.data_nascimento| myDate}}</td>
                  <td>{{user.data_atualizacao| myDate}}</td>
                  <td>{{user.data_falecimento | myDate}}</td>
                  <td>{{user.sexo | sexo}}</td>
                  <td>{{user.especie| especie}}</td>
              
                </tr>
              </tbody>
            </table>
          </div>
      <router-view></router-view>
  </div>
</template>

<script>
import axios from "axios"

export default {
    name: 'app',

      created() {
        
        this.getAnimais();

    },

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