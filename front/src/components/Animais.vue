<template>

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
                  <td>{{user.data_atualizacao| myDate }}</td>
                  <td>{{user.data_falecimento | myDate}}</td>
                  <td>{{user.sexo | sexo}}</td>
                  <td>{{user.especie| especie}}</td>
              
                </tr>
              </tbody>
            </table>
          </div>

</template>



<script>
import axios from "axios"



export default {


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