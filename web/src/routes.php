<?php
use Slim\Http\Request;
use Slim\Http\Response;
use Illuminate\Database\Capsule\Manager as Db;
// Routes


$app->get('/', function (Request $request, Response $response) {

    $data = [
        'app' => 'SimpleVet'
    ];

    return $response->withJson($data, 200);
});

$app->get('/listar', function (Request $request, Response $response, array $args) {

    $pet =Animal::all();
    
    return $this->renderer->render($response, 'index.phtml',  array("pet" => $pet));



});


$app->get('/teste', function (Request $request, Response $response, array $args) {

    $pet = new Animal();
    $pet->nome = 'Amora';
    $pet->raca1 = '1';
    var_dump($pet);
    return json_encode($pet);
    return $this->renderer->render($response, 'index.phtml', $args);

});
