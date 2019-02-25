<template>
  <div id="container " >
    <PageTitle icon="fa fa-paw" main="Animais para adoção" sub="Animais disponiveis para Adoção"></PageTitle>
    
     <b-container class="bv-example-row">
      <b-row>
        <b-col v-show="animal.situacao =='vivo'"  cols="6" v-for="animal in animais" :key="animal.id">
          <AnimalCard
            :key="animal.id"
            :animal_obj="animal"
            modo="adocao"

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