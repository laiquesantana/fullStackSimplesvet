<?php
use Slim\Http\Request;
use Slim\Http\Response;
// Routes
$app->get('/[{name}]', function (Request $request, Response $response, array $args) {
   
       return $response->getBody()->write("Nome do Pet: " . $args['name']);
});