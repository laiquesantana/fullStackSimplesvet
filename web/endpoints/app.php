<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use Illuminate\Database\Capsule\Manager as DB;
$app->get('/la', function (Request $request, Response $response) {

    $data = [
        'app' => 'SimpleVet'
    ];

    return $response->withJson($data, 200)->withHeader('Access-Control-Allow-Origin', '*');
});



$app->get('/animais/listar', function (Request $request, Response $response, array $args) {

    $pet = DB::table('listar')->get();
    return json_encode($pet);

    $pet =Animal::all();
   
    return $response->withJson($pet, 200)->withHeader('Access-Control-Allow-Origin', '*');
    //return $this->renderer->render($response, 'index.phtml',  array("pet" => $pet));


});


$app->get('/raca/listar', function (Request $request, Response $response, array $args) {

    $pet = DB::table('racas')->get();
    return json_encode($pet);

    $pet =Animal::all();
   
    return $response->withJson($pet, 200)->withHeader('Access-Control-Allow-Origin', '*');
    //return $this->renderer->render($response, 'index.phtml',  array("pet" => $pet));


});


$app->get('/animais/stat', function (Request $request, Response $response, array $args) {

    $cout = DB::table('listar')->get()->count();
    return json_encode($cout);

    $pet =Animal::all();
   
    return $response->withJson($pet, 200)->withHeader('Access-Control-Allow-Origin', '*');
    //return $this->renderer->render($response, 'index.phtml',  array("pet" => $pet));


});



$app->post('/animais/criar', function (Request $request, Response $response, array $args) {
    $data = $request->getParsedBody();
    return json_encode($data);


    return $response->getBody()->write("Nome do Pet: {$request->all()}")->withHeader('Access-Control-Allow-Origin', '*');
});

$app->put('/animais/atualizar', function (Request $request, Response $response, array $args) {
    return $response->getBody()->write("Nome do Pet: " . $args['name']);
});


$app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function($req, $res) {
    $handler = $this->notFoundHandler; // handle using the default Slim page not found handler
    return $handler($req, $res);
});