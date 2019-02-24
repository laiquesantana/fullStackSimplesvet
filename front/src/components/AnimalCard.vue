<template>
  <v-layout class="stat">
    <v-flex xs12 sm5 offset-sm0>
      <v-card class="cartao">
        <v-img 
          class="white--text"
          height="200px"
          :src="backgroud"
        >
          <v-container fill-height fluid>
            <v-layout fill-height>
              <v-flex xs12 align-end flexbox>
                <h1>
                  <span class="headline">{{nome_animal.toUpperCase()}}</span>
                </h1>
              </v-flex>
            </v-layout>
          </v-container>
        </v-img>
        <v-card-title>
          <div>
            <h3>
              <span v-show="modo!='adocao'" class="black--text">Situação: {{situacao.toUpperCase()}}</span>
              <br>
            </h3>
            <span class="black--text">>Sexo: {{sexo|sexo}}</span>
            <br>
            <span class="black--text">>Idade: {{idade|retornaIdade}}</span>
            <br>
            <span v-show="modo!='adocao'" class="black--text">>Nº Chip: {{chip}}</span>
            <br>
          </div>
        </v-card-title>
        <v-card-actions>
          <v-btn flat color="orange">Editar</v-btn>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>



<script>
export default {
  name: "AnimalCard",
  props: ["nome_animal", "situacao", "sexo", "idade", "chip", 'modo','especie'],
  components: {},
  created() {},

  data() {
    return {
      titulo: "Catálogo de Animais",
      animais: {},
      backgroud: this.especie == 1 ? "https://www.hearingdogs.org.uk/globalassets/2.-home-page/start-page/sponsor-hearing-dog-puppy-hebe-977-x-550.jpg" : "http://www.spiritanimal.info/pictures/cat/Cat-Spirit-Animal-6.jpg"
    };
  },

  methods: {}
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
</style>