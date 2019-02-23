<template>
    <aside class="menu" v-show="isMenuVisible" > 
            <router-link to="/home" >
                <i class="fa fa-home"></i> DashBoard
            </router-link>
            <router-link to="/animais" >
                <i class="fa fa-paw"></i> Listagem de Animais
            </router-link>
             <router-link to="/adocao" >
                <i class="fa fa-paw"></i> Animais para Adoção
            </router-link>
            <router-link to="/admin" >
                <i class="fa fa-cogs"></i> Administração
            </router-link>
              <router-link to="/not-found" >
                <i class="fa fa-sign-out"></i> Sair
            </router-link>
    </aside>
</template>

<script>

import {mapState} from 'vuex'

export default {
    name: 'Menu',

    computed: mapState(['isMenuVisible']),
         data() {
        return {
        }
      }
    
}
</script>
<style>
    .menu {
        grid-area: menu;
        background: linear-gradient(to right, #232526, #414345);
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
    }
    .tree-anchor{
        color: white;
    }
    .menu a,
    .menu a:hover {
        color: #fff;
        text-decoration: none;
    }
    .menu .tree-node.selected > .tree-content,
    .menu .tree-node .tree-content:hover {
        background-color: rgba(255, 255, 255, 0.2);
    }
    .tree-arrow.has-child {
        filter: brightness(2);
    }
    .menu .menu-filter {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 20px;
        padding-bottom: 8px;
        border-bottom: 1px solid #AAA;
    }
    .menu .menu-filter i {
        color: #AAA;
        margin-right: 10px;
    }
    .menu input {
        color: #CCC;
        font-size: 1.3rem;
        border: 0;
        outline: 0;
        width: 100%;
        background: transparent;
    }
    .tree-filter-empty {
        color: #CCC;
        font-size: 1.3rem;
        margin-left: 20px;
    }
</style>