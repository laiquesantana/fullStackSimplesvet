<template>
  <div>
    <b-form>
      <input id="animais-id" type="hidden" v-model="animais.id">
      <b-row>
        <b-col md="3" sm="12">
          <b-form-group label="Nome:" label-for="animais-nome">
            <b-form-input
              name="Nome"
              id="animais-nome"
              type="text"
              v-validate="'required'"
              v-model="animais.nome"
              :readonly="mode === 'remove'"
              placeholder="Informe o Nome do Pet..."
            />
            <i v-show="errors.has('Nome')" class="fa fa-warning"></i>
            <span v-show="errors.has('Nome')" class="help is-danger">{{ errors.first('Nome') }}</span>
          </b-form-group>
        </b-col>
        <b-col md="3" sm="12">
          <b-form-group label="Data de Nascimento:" label-for="animais-data_nascimento">
            <b-form-input
              name="Data de Nascimento"
              id="animais-data_nascimento"
              type="date"
              v-validate="'required'"
              v-model="animais.data_nascimento"
              placeholder="Informe a Data de Nascimento"
            />
            <i v-show="errors.has('Data de Nascimento')" class="fa fa-warning"></i>
            <span
              v-show="errors.has('Data de Nascimento')"
              class="help is-danger"
            >{{ errors.first('Data de Nascimento') }}</span>
          </b-form-group>
        </b-col>
        <b-col md="3" sm="12">
          <b-form-group label="Número do chip:" label-for="animais-chip">
            <b-form-input v-mask="'###########'"
              name="Numero do chip"
              id="animais-chip"
              type="text"
              v-validate="'required'"
              v-model="animais.chip"
              placeholder="Informe o Número do chip"
            />
            <i v-show="errors.has('Numero do chip')" class="fa fa-warning"></i>
            <span
              v-show="errors.has('Numero do chip')"
              class="help is-danger"
            >{{ errors.first('Numero do chip') }}</span>
          </b-form-group>
        </b-col>
        <b-col md="3" sm="12">
          <b-form-group label="Data de Falecimento:" label-for="animais-data_falecimento">
            <b-form-input
              name="Data de Falecimento"
              id="animais-data_falecimento"
              type="date"
              v-model="animais.data_falecimento"
              placeholder="Informe a Data de Falecimento"
            />
          </b-form-group>
        </b-col>
      </b-row>

      <b-row>
        <b-col md="3" sm="12">
          <b-form-group label="Raça:" label-for="animais-raca_id">
            <b-form-select v-model="animais.raca_id">
              <option
                v-for="ra in raca"
                :disabled="ra.situacao =='INA'"
                :value="ra.id"
                :key="ra.id"
              >{{ ra.nome }}</option>
            </b-form-select>
            <i v-show="errors.has('Raça')" class="fa fa-warning"></i>
            <span v-show="errors.has('Raça')" class="help is-danger">{{ errors.first('Raça') }}</span>
          </b-form-group>
        </b-col>
        <b-col md="3" sm="12">
          <b-form-group label="Espécie:" label-for="animais-especie">
            <b-form-select
              name="Especie"
              id="animais-especie"
              v-validate="'required'"
              v-model="animais.especie"
              :options="opcao_animal"
              placeholder="Informe a Espécie"
            />
            <i v-show="errors.has('Especie')" class="fa fa-warning"></i>
            <span
              v-show="errors.has('Especie')"
              class="help is-danger"
            >{{ errors.first('Especie') }}</span>
          </b-form-group>
        </b-col>
        <b-col md="3" sm="12">
          <b-form-group label="Sexo:" label-for="animais-sexo">
            <b-form-select
              name="Sexo"
              id="animais-sexo"
              v-validate="'required'"
              v-model="animais.sexo"
              :options="options"
              placeholder="Informe o sexo"
            />
            <i v-show="errors.has('Sexo')" class="fa fa-warning"></i>
            <span v-show="errors.has('Sexo')" class="help is-danger">{{ errors.first('Sexo') }}</span>
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
    <b-table hover striped :items="animal" :fields="fields">
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
import moment from "moment";
export default {
  name: "AnimalCadastro",
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
          label: "Nome",
          sortable: true,
          formatter: value => value.toUpperCase()
        },
        {
          key: "nome_raca",
          label: "Raça",
          sortable: true,
          formatter: value => value.toUpperCase()
        },
        { key: "idade", label: "Idade", sortable: true },
        {
          key: "sexo",
          label: "Sexo",
          sortable: true,
          formatter: value => (value == "M" ? "MACHO" : "FÊMEA")
        },
        { key: "chip", label: "Numero do Chip", sortable: true },
        {
          key: "data_nascimento",
          label: "Data de Nascimento",
          sortable: true,
          formatter: value =>
            value ? moment(String(value)).format("DD/MM/YYYY ") : "Não Consta"
        },
        {
          key: "data_atualizacao",
          label: "Data de Atualização",
          sortable: true,
          formatter: value =>
            value
              ? moment(String(value)).format("DD/MM/YYYY hh:mm")
              : "Não Consta"
        },
        {
          key: "data_falecimento",
          label: "Data de Falecimento",
          sortable: true,
          formatter: value =>
            value ? moment(String(value)).format("DD/MM/YYYY ") : "Não Consta"
        },
        {
          key: "situacao",
          label: "Situação",
          sortable: true,
          formatter: value => value.toUpperCase()
        },
        { key: "actions", label: "Ações" }
      ],
      options: [{ value: "M", text: "Macho" }, { value: "F", text: "Fêmea" }],
      opcao_animal: [
        { value: "1", text: "Cachorro" },
        { value: "2", text: "Gato" }
      ]
    };
  },
  methods: {
    loadAnimais() {
      axios
        .get(`${baseApiUrl}/animais/listar`)
        .then(res => (this.animal = res.data));
    },
    reset() {
      this.mode = "save";
      this.animais = {};
      this.loadAnimais();
      this.loadRacas();
    },
    save() {
      this.$validator.validateAll().then(result => {
        if (result) {
          axios[method](`${baseApiUrl}/animais/criar${id}`, this.animais)
            .then(() => {
              this.$toasted.global.defaultSuccess({
                msg: "Animal cadastrado com sucesso!"
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
      const method = this.animais.id ? "put" : "post";
      const id = this.animais.id ? `/${this.animais.id}` : "";
    },
    atualizar() {
      this.$validator.validateAll().then(result => {
        if (result) {
          axios
            .put(`${baseApiUrl}/animais/atualizar`, this.animais, {
              useCredentails: true
            })
            .then(() => {
              this.$toasted.global.defaultSuccess({
                msg: "Animal Atualizado com sucesso!"
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
    loadCategories() {},
    loadAnimalModo(animais, mode = "atualizar") {
      this.mode = mode;
      this.animais = { ...animais };
    }
  },
  watch: {},
  mounted() {
    this.loadAnimais();
    this.loadRacas();
    this.$toasted.global.defaultSuccess({
      msg: "Página Carregada com sucesso!"
    });
  }
};
</script>

<style>
</style>