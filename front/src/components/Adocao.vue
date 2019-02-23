<template>
  <div id="container " >
    <PageTitle icon="fa fa-paw" main="Animais para adoção" sub="Animais disponiveis para Adoção"></PageTitle>
    
      <AnimalCard v-for="animal in animais " :key="animal.id"
               v-show="animal.situacao =='vivo'" modo="adocao"
              :nome_animal="animal.nome" :situacao="animal.situacao"
              :sexo="animal.sexo" :idade="animal.idade" :especie="animal.especie"
              :chip="animal.chip">

      </AnimalCard>

  </div>
</template>



<script>
import axios from "axios";
import { baseApiUrl } from "@/configuracaoGlobal";
import AnimalCard from "./AnimalCard";
import PageTitle from "./PageTitle";

export default {
  components: { PageTitle, AnimalCard },
  created() {
    this.getAnimais();
    this.$toasted.global.defaultSuccess({
      msg: "Cards com os animais para adoção carregado com sucesso!"
    });
  },

  data() {
    return {
      titulo: "Catálogo de Animais",
      animais: {},
      loadmore:true
    };
  },

  methods: {
    getAnimais() {
      axios
        .get(`${baseApiUrl}/animais/listar`)
        .then(res => (this.animais = res.data));
    }
  }
};
</script>


<style>

</style>