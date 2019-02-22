<template>
  <div>
      <b-form>
        <input id="animais-id" type="hidden" v-model="animais.id" />
            <b-row>
                <b-col md="3" sm="12">
                    <b-form-group label="Nome:" label-for="animais-name">
                        <b-form-input id="animais-name" type="text"
                            v-model="animais.name" required
                             :readonly="mode === 'remove'"
                            placeholder="Informe o Nome do Pet..." />
                    </b-form-group>
                </b-col>
                <b-col md="3" sm="12">
                    <b-form-group label="Data de Nascimento:" label-for="animais-data_nascimento">
                        <b-form-input id="animais-data_nascimento" type="date"
                            v-model="animais.data_nascimento" required
                   
                            placeholder="Informe a Data de Nascimento" />
                    </b-form-group>
                </b-col>
                <b-col md="3" sm="12">
                    <b-form-group label="Número do chip:" label-for="animais-chip">
                        <b-form-input id="animais-chip" type="text"
                            v-model="animais.chip" required
                   
                            placeholder="Informe o Número do chip" />
                    </b-form-group>
                </b-col>
                  <b-col md="3" sm="12">
                    <b-form-group label="Data de Falecimento:" label-for="animais-data_falecimento">
                        <b-form-input id="animais-data_falecimento" type="date"
                            v-model="animais.data_falecimento"
                   
                            placeholder="Informe a Data de Falecimento" />
                    </b-form-group>
                </b-col>
            </b-row>

             <b-row>
                <b-col md="3" sm="12">
                    <b-form-group label="Raça:" label-for="animais-raca_id">
                        <b-form-input id="animais-raca_id" type="text"
                            v-model="animais.raca_id" required
                   
                            placeholder="Informe a raça do pet." />
                    </b-form-group>
                </b-col>
                <b-col md="3" sm="12">
                    <b-form-group label="Espécie:" label-for="animais-especie">
                              <b-form-select id="animais-especie" 
                            v-model="animais.especie"  :options="opcao_animal" required
                            placeholder="Informe a Espécie" />
                    </b-form-group>
                </b-col>
                <b-col md="3" sm="12">
                    <b-form-group label="Sexo:" label-for="animais-sexo">
                        <b-form-select id="animais-sexo" 
                            v-model="animais.sexo" :options="options" required
                            placeholder="Informe o sexo" />
                    </b-form-group>
                </b-col>
            </b-row>
            <b-button variant="primary" v-if="mode === 'save'"
            @click="save">Salvar</b-button>

            <b-button class="ml-2" @click="reset">Cancelar</b-button>   
      </b-form>
      <hr>
    <b-table hover striped :items="animal" :fields="fields"/>
</div>
          
</template>

<script>

import axios from "axios";
import { baseApiUrl,showError } from "@/configuracaoGlobal";

export default {
    name: 'AnimalCadastro',
    components: {  },
    data: function() {
        return {
          mode: 'save',
          animais: {},
          animal: [],
          racas: {},
          raca: [],
           fields: [
                { key: 'id', label: 'Código', sortable: true },
                { key: 'nome', label: 'Nome', sortable: true },
                { key: 'nome_raca', label: 'Raça', sortable: true },
                { key: 'idade', label: 'Idade', sortable: true},
                { key: 'sexo', label: 'Sexo', sortable: true,
                    formatter: value =>value == 'M' ? 'Macho': 'Fêmea' },
                { key: 'chip', label: 'Numero do Chip', sortable: true },
                { key: 'data_atualizacao', label: 'Data de Atualização', sortable: true,
                    formatter: value => value ? value: 'Não Consta' },
                { key: 'data_falecimento', label: 'Data de Falecimento', sortable: true,
                    formatter: value => value ? value: 'Não Consta' },
                { key: 'situacao', label: 'Situação', sortable: true },
              
            ],
            options: [
                { value: 'M', text: 'Macho' },
                { value: 'F', text: 'Fêmea' },
            ],
            opcao_animal: [
                { value: '1', text: 'Cachorro' },
                { value: '2', text: 'Gato' },
            ],
            opcao_raca: [
                { value: '1', text: 'Cachorro' },
                { value: '2', text: 'Gato' },
            ]

        }
    },
    methods: {
        loadAnimais() {
            axios
            .get(`${baseApiUrl}/animais/listar`)
            .then(res => (this.animal = res.data));
        },
        reset() {
           this.mode= 'save'
           this.animais= {};
           this.loadAnimais();
        },
        save() {
            const method = this.animais.id ? 'put' : 'post'
            const id = this.animais.id ? `/${this.animais.id}` : ''
   
            axios[method](`${baseApiUrl}/animais/criar${id}`, this.animais)
                .then(() => {
                    this.$toasted.global.defaultSuccess()
                    this.reset()
                })
                .catch(showError)
        },
        loadRacas() {
           axios
            .get(`${baseApiUrl}/raca/listar`)
            .then(res => (this.raca = res.data));
        },
        loadCategories() {
          
        },
        loadUsers() {
            
        }
    },
    watch: {
       
    },
    mounted() {
        this.loadAnimais();
        this.loadRacas();
    }
}
</script>

<style>
</style>