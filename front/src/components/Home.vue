<template>
    <div class="home">
        <PageTitle icon="fa fa-home" main="Dashboard"
            sub="Estatísticas" />
            <div class="stats">
            <Stat title="Quantidade de Animais" :value="stat"
                icon="fa fa-paw" color="#3282cd" />
        </div>

    </div>
</template>

<script>
import PageTitle from './PageTitle'
import Stat from './Stat'
import axios from 'axios'
import {baseApiUrl} from '@/configuracaoGlobal'

export default {
    name: 'Home',
    components: { PageTitle,Stat },
    data: function() {
        return {
            stat:{}
        }
    },
    methods: {
      getStats(){
            axios.get(`${baseApiUrl}/animais/stat`).then(res => this.stat = res.data)
      }
    },
    mounted() {
          this.getStats()
    }
}
</script>

<style>
    .stats {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        max-width: 30%;
    }
</style>