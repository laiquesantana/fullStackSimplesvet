<template>
    <div class="admin-pages">
        <PageTitle icon="fa fa-cogs" main="Administração do Sistema"
            sub="Cadastros" />
      <div class="admin-pages-tabs">
            <b-card no-body>
                <b-tabs card>
                    <b-tab title="Animais" active>
                     <AnimalCadastro/>
                    </b-tab>
                    <b-tab title="Raças">
                    <RacaCadastro/>
                    </b-tab>
                   
                </b-tabs>
            </b-card>
        </div>
    </div>
  
</template>

<script>
import PageTitle from './PageTitle'
import AnimalCadastro from './Cadastros/AnimalCadastro'
import RacaCadastro from './Cadastros/RacaCadastro'

export default {
    name: 'AdminPages',
    components: { PageTitle,AnimalCadastro,RacaCadastro}
}
</script>

<style>
</style>