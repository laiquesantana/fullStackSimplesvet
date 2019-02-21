<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->get('/', function (Request $request, Response $response) {

    $data = [
        'app' => 'SimpleVet'
    ];

    return $response->withJson($data, 200);
});

$app->get('/animais/listar/{name}', function (Request $request, Response $response, array $args) {
    $db = $request->getContainer()->get('db');
    //return $response->getBody()->write("Nome do Pet: " . $args['name']);
});


$app->post('/animais/criar', function (Request $request, Response $response, array $args) {
    $data = $request->getParsedBody();

    $nome = $data['nome'] ??'';

    return $response->getBody()->write("Nome do Pet: {$nome}");
});

$app->put('/animais/atualizar', function (Request $request, Response $response, array $args) {
    return $response->getBody()->write("Nome do Pet: " . $args['name']);
});