<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->get('/la', function (Request $request, Response $response) {

    $data = [
        'app' => 'SimpleVet'
    ];

    return $response->withJson($data, 200)->withHeader('Access-Control-Allow-Origin', '*');
});



$app->get('/animais/listar', function (Request $request, Response $response, array $args) {

    $pet =Animal::all();
   
    return $response->withJson($pet, 200)->withHeader('Access-Control-Allow-Origin', '*');
    //return $this->renderer->render($response, 'index.phtml',  array("pet" => $pet));
    return json_encode($pet);


});


$app->post('/animais/criar', function (Request $request, Response $response, array $args) {
    $data = $request->getParsedBody();

    $nome = $data['nome'] ??'';

    return $response->getBody()->write("Nome do Pet: {$nome}");
});

$app->put('/animais/atualizar', function (Request $request, Response $response, array $args) {
    return $response->getBody()->write("Nome do Pet: " . $args['name']);
});


$app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function($req, $res) {
    $handler = $this->notFoundHandler; // handle using the default Slim page not found handler
    return $handler($req, $res);
});