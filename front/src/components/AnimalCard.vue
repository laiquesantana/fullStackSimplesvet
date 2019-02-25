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
                    <span class="headline">{{nome_animal}}</span>
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
                  >Situação: {{ situacao.toUpperCase()}}</span>

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
   
          </v-container>
        </v-card>
         <v-card-actions>
         <EditModal
            v-on:update:animal="ani= $event"
            v-if="modo!= 'adocao'"
            :id="animal_obj.id"
          > </EditModal>
        </v-card-actions>
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
  props: ["modo",  "animal_obj"],
  components: { EditModal },
  created() {},
  computed: {
    nome_animal: {
      get: function() {
        if (this.ani.nome != null) {
          return this.ani.nome;
        }
        return this.animal_obj.nome;
      }
    },
    idade: {
      get: function() {
        if (this.ani.idade != null) {
          return this.ani.idade;
        }
        return this.animal_obj.idade;
      }
    },
    situacao: {
      get: function() {
        if (this.ani.situacao != null) {
          return this.ani.situacao;
        }
        return this.animal_obj.situacao;
      }
    },
    especie: {
      get: function() {
        if (this.ani.especie != null) {
          return this.ani.especie;
        }
        return this.animal_obj.especie;
      }
    },
    chip: {
      get: function() {
        if (this.ani.chip != null) {
          return this.ani.chip;
        }
        return this.animal_obj.chip;
      }
    },
    sexo: {
      get: function() {
        if (this.ani.sexo != null) {
          return this.ani.sexo;
        }
        return this.animal_obj.sexo;
      }
    }
  },
  data() {
    return {
      titulo: "Catálogo de Animais",
      ani: {},
      cartao_esmaecido: this.animal_obj.situacao == "morto" ? "cartao opacidade" : "cartao ",
      backgroud: this.animal_obj.especie == 1 ? "https://www.petlove.com.br/dicas/wp-content/uploads/2017/06/brincadeiras-para-fazer-com-filhote-1.jpg" : "http://www.spiritanimal.info/pictures/cat/Cat-Spirit-Animal-6.jpg"
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