<template>
  <div>
    <b-form>
      <input id="racas-id" type="hidden" v-model="racas.id">
      <b-row>
        <b-col md="3" sm="12">
          <b-form-group label="Nome da Raça:" label-for="racas-nome">
            <b-form-input
              name="Nome"
              id="racas-nome"
              type="text"
              v-validate="'required'"
              v-model="racas.nome"
              :readonly="mode === 'remove'"
              placeholder="Informe o Nome do Pet..."
            />
            <i v-show="errors.has('Nome')" class="fa fa-warning"></i>
            <span v-show="errors.has('Nome')" class="help is-danger">{{ errors.first('Nome') }}</span>
          </b-form-group>
        </b-col>
        <b-col md="3" sm="12">
          <b-form-group label="Situação:" label-for="racas-situacao">
            <b-form-select
              name="Situacao"
              id="racas-situacao"
              v-validate="'required'"
              v-model="racas.situacao"
              :options="opcao_situacao"
              placeholder="Informe a Espécie"
            />
            <i v-show="errors.has('situacao')" class="fa fa-warning"></i>
            <span
              v-show="errors.has('situacao')"
              class="help is-danger"
            >{{ errors.first('situacao') }}</span>
          </b-form-group>
        </b-col>
      </b-row>
      <b-col xs="12">
        <b-button variant="primary" v-if="mode === 'save'" @click="save">Salvar</b-button>
        <b-button variant="success" v-if="mode === 'atualizar'" @click="atualizar">Atualizar</b-button>
        <b-button class="ml-2" @click="reset">Cancelar</b-button>
      </b-col>
    </b-form>
    <hr>
    <b-table hover striped :items="raca" :fields="fields">
      <template slot="actions" slot-scope="data">
        <b-button variant="warning" @click="loadAnimalModo(data.item)" class="mr-2">
          <i class="fa fa-pencil"></i>
        </b-button>
      </template>
    </b-table>
  </div>
</template>

<script>
import axios from "axios";
import { baseApiUrl, showError } from "@/configuracaoGlobal";

export default {
  name: "Racaadastro",
  components: {},
  data: function() {
    return {
      mode: "save",
      animais: {},
      animal: [],
      racas: {},
      raca: [],
      fields: [
        { key: "id", label: "Código", sortable: true },
        {
          key: "nome",
          label: "Nome da Raça",
          sortable: true,
          formatter: value => value.toUpperCase()
        },
        {
          key: "situacao",
          label: "Situação",
          sortable: true,
          formatter: value => value.toUpperCase()
        },
        { key: "situacao", label: "Situacao", sortable: true },
          { key: "actions", label: "Ações" }],

        opcao_situacao: [
        { value: "ATI", text: "Ativo" },
        { value: "INA", text: "Inativo" }
      ]
    };
  },
  methods: {
  
    reset() {
      this.mode = "save";
      this.racas = {};
      this.loadRacas();
    },
    save() {
      this.$validator.validateAll().then(result => {
        if (result) {
          axios[method](`${baseApiUrl}/racas/criar${id}`, this.racas)
            .then(() => {
              this.$toasted.global.defaultSuccess({
                msg: "Raca cadastrada com sucesso!"
              });
              this.reset();
            })
            .catch(showError);
          return;
        }
        this.$toasted.global.defaultError({
          msg: "Você possui problemas no formulário"
        });
      });
      const method = this.racas.id ? "put" : "post";
      const id = this.racas.id ? `/${this.racas.id}` : "";
    },
    atualizar() {
      this.$validator.validateAll().then(result => {
        if (result) {
          axios
            .put(`${baseApiUrl}/racas/atualizar`, this.racas, {
              useCredentails: true
            })
            .then(() => {
              this.$toasted.global.defaultSuccess({
                msg: "Raca Atualizada com sucesso!"
              });
              this.reset();
            })
            .catch(showError);
          return;
        }
        this.$toasted.global.defaultError({
          msg: "Você possui problemas no formulário"
        });
      });
    },
    loadRacas() {
      axios
        .get(`${baseApiUrl}/raca/listar`)
        .then(res => (this.raca = res.data));
    },

    loadAnimalModo(racas, mode = "atualizar") {
      this.mode = mode;
      this.racas = { ...racas };
    }
  },
  watch: {},
  mounted() {
    this.loadRacas();
  }
};
</script>

<style>
</style>