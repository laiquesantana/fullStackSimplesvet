<template>
  <div id="container ">
    <PageTitle icon="fa fa-paw" main="Catálogo de Animais" sub="Listagens de Animais"></PageTitle>
    <b-container class="bv-example-row">
      <b-row>
        <b-col cols="6" v-for="animal in animais" :key="animal.id">
          <AnimalCard
            :v-model="animais"
            :animal_obj="animal"
            :key="animal.id"
            :nome_animal="animal.nome"
            :situacao="animal.situacao"
            :sexo="animal.sexo"
            :idade="animal.idade"
            modo="listagem"
            :especie="animal.especie"
            :chip="animal.chip"
            :id="animal.id"
          ></AnimalCard>
        </b-col>
      </b-row>
    </b-container>
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
      msg: "Cards com os animais carregado com sucesso!"
    });
  },

  data() {
    return {
      titulo: "Catálogo de Animais",
      animais: {},
      loadmore: true
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