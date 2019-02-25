# Fullstack 2019

### Instrusções para compilar o projeto
* 1º fazer o clone do projeto : https://github.com/laiquesantana/fullStackSimplesvet
* 2º acessando a pasta raiz fullStackSimplesvet/web rodar o composer install
* 3º  acessando a pasta fullStackSimplesvet/front rodar o yarn ( yarn install ou yarn ) para instalar as dependências
* 4º  acessando a pasta raiz fullStackSimplesvet subir a aplicação para a porta 8080  php -S localhost:8080 
* 5º  acessando a pasta fullStackSimplesvet/front subir a aplicação para a porta 8081 usando o comando yarn run serve
* 6º acessando  o banco de dados mysql usando a sua ferramenta de preferência rodar o script que se encontra na pasta *
* fullStackSimplesvet/db  com nome selecao_fullstack.sql
* 8º fullStackSimplesvet\web\src\settings.php  configurar o banco de dados alterando o password  e username do seu mysql local
não alterar as demais configurações

* 9º Acessar no navegador a aplicação http://localhost:8081/home

### Escopo do projeto

Monza, é dona de um abrigo de animais e precisa de uma sistema para cadastrar os animais. Hoje o abrigo trabalha com cães e gatos de várias raças e precisa de algo simples que facilite o trabalho de catalogar e exibir os animais para adoção:


* Animal
  * nome
  * raça
  * sexo - [M - Macho, F - Fêmea]
  * espécie - [1 - Cachorro, 2 - Gato]
  * chip
  * data nascimento
  * data de atualização
  * data falecimento
* Raça
  * nome
  * situação - [ATI - Ativo, INA - Inativo]

Para atender a este desafio você deverá criar uma aplicação em php apenas com os endpoints da api (usamos o framework slim e já montamos uma pequena estrutura para você), uma app em vue que será o frontend da aplicação (não precisa se preocupar com menu ou autenticação) e uma estruta de views, procedures e funções no banco de banco de dados.

* App vue
  * Listagem de animais
    * Cada animal deve ser exibido em um card com seu nome, sexo, idade, número do chip, se está vivo ou não (caso morto o card fica esmaecido) e um botão de editar
  * Catálogo de animais para adoção - (trazer apenas animais vivos)
    * Cada animal deve ser exibido em um card com nome, sexo e idade
  * Form de cadastro e edição de animais
* App PHP
  * Backend com os endpoints para chamar as procedures e as views
  * Endpoints
    * Animais
      * Listar - Chamar a view de animais
      * Atualizar - Chamar procedure de update
      * Criar - Chamar procedure de insert
    * Raças
      * Listar - Fazer select na tabela
* Mysql
  * Procedures de insert de animais
  * Procedures de update de animais
  * Função para informar a idade do animal de acordo com a data de nascimento
  * View contento todos os dados dos animais e das raças, além de uma coluna com a idade do animal e uma coluna informando se o animal está vivo ou morto

### Instruções para entrega

* Prazo até 25/02/2019 às 23:59.
* Fazer um clone do projeto
* Gerar dump do banco de dados e colocar na pasta db
* Gerar um build da app vue na pasta `web/public/app`
* Escrever no readme instruções para rodar sua aplicação
* Responder o e-mail com o link do repositório
* Não obrigatório, mas se quiser ir além:
  * Hospedar aplicação em algum servidor e enviar a url junto com e-mail (fazer o deploy da pasta web);
  * Não é obrigatório usar nenhum framework frontend, mas se a interface estiver intuitiva, agradável e responsiva você ganhará pontos.
  * Ainda não temos uma cultura forte de testes automatizados, então se sua aplicação tiver algum teste será bom.

### Requisitos técnicos

#### Vue

* versão no node: v10.6.0
* versão do npm: 6.4.1
* criar o projeto na pasta front
* usar yarn como gerenciador de dependência

#### PHP

* versão do php: 7.2.3

#### MySql

* encoding: utf-8

#### Estrutura de pastas
```
./
  |_ web
  |_ front
  |_ db
```
