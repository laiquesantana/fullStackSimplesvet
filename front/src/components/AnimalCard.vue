<template>
  <div>
    <v-layout class="stat">
      <v-flex xs12 sm5 offset-sm0>
        <v-card :class="cartao_esmaecido">
          <v-container fluid grid-list-md>
            <v-img class="white--text" height="200px" :src="backgroud">
              <v-layout row wrap>
                <v-flex xs12 align-end flexbox>
                  <h1>
                    <span class="headline">{{nome_animal.toUpperCase()}}</span>
                  </h1>
                </v-flex>
              </v-layout>
            </v-img>
            <v-card-title>
              <div>
                <h3>
                  <span
                    v-show="modo!='adocao'"
                    class="black--text"
                  >Situação: {{situacao.toUpperCase()}}</span>
                  <br>
                </h3>
                <h5>
                  <span class="black--text">>Sexo: {{sexo|sexo}}</span>
                </h5>
                <br>
                <h5>
                  <span class="black--text">>Idade: {{idade|retornaIdade}}</span>
                </h5>
                <br>
                <h5>
                  <span v-show="modo!='adocao'" class="black--text">>Nº Chip: {{chip}}</span>
                </h5>
                <br>
              </div>
            </v-card-title>
            <v-card-actions>
            <EditModal :id="id"></EditModal>
            </v-card-actions>
          </v-container>
        </v-card>
      </v-flex>
    </v-layout>
    
  </div>
</template>



<script>
import axios from "axios";
import { baseApiUrl } from "@/configuracaoGlobal";
import EditModal from "./EditModal";
export default {
  name: "AnimalCard",
  props: [
    "nome_animal",
    "situacao",
    "sexo",
    "idade",
    "chip",
    "modo",
    "especie",
    "id"
  ],
  components: {EditModal},
  created() {},

  data() {
    return {
      titulo: "Catálogo de Animais",
      animais: {},
      cartao_esmaecido: this.situacao == "morto" ? "cartao opacidade" : "cartao",
      backgroud: this.especie == 1
          ? "https://www.hearingdogs.org.uk/globalassets/2.-home-page/start-page/sponsor-hearing-dog-puppy-hebe-977-x-550.jpg"
          : "http://www.spiritanimal.info/pictures/cat/Cat-Spirit-Animal-6.jpg"
    };
  },

  methods: {
    getAnimais() {
      axios
        .get(`${baseApiUrl}/animais/listar`)
        .then(res => (this.animais = res.data));
    },
  }
};
</script>

<style>
.headline {
  color: black;
}

.stat {
  flex: 1;
  display: flex;
  border-radius: 8px;
  margin-right: 20px;
  margin-bottom: 20px;
  background-color: black;
  padding: 20px;
  border: 1px solid rgba(0, 0, 0, 0.2);
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.15);
}

.opacidade {
  opacity: 0.5;
}
.cartao {
  width: 700px;
  background: #ccc;
}
</style>