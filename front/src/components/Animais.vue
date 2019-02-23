<template>
  <div class="card-body table-responsive p-0 col-sm-12">
    <PageTitle icon="fa fa-paw" main="Catálogo de Animais"></PageTitle>

    <div id="container">
      <Stat
        class="stats box"
        v-for="animal in animais"
        :key="animal.id"
        icon="fa fa-paw"
        color="#3282cd"
        :title="animal.nome"
        :value="animal.situacao"
        :sexo="animal.sexo|sexo"
        :idade="animal.idade"
        :chip="animal.chip"
      ></Stat>
    </div>
  </div>
</template>



<script>
import axios from "axios";
import { baseApiUrl } from "@/configuracaoGlobal";
import Stat from "./Stat";
import PageTitle from "./PageTitle";

export default {
  components: { PageTitle, Stat },
  created() {
    this.getAnimais();
        this.$toasted.global.defaultSuccess({
            msg : 'Cards com os animais carregado com sucesso!'
        });
  },

  data() {
    return {
      titulo: "Catálogo de Animais",
      animais: {}
    };
  },

  methods: {
    getAnimais() {
      this.$Progress.start();
      axios
        .get(`${baseApiUrl}/animais/listar`)
        .then(res => (this.animais = res.data));
      this.$Progress.finish();
    }
  }
};
</script>


<style>
.stats {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  max-width: 30%;
}
#container {
  width: 100%;
  border-color: blue;
  text-align: center;
}

.box {
  float: left;
}
</style>