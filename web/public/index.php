<?php

require '../vendor/autoload.php';

session_start();

$settings = require __DIR__ . '/../src/settings.php';
$app = new \Slim\App($settings);

require __DIR__ . '/../src/dependencies.php';
//require __DIR__ . '/../src/routes.php';
require __DIR__ . '/../models/Animal.php';
require __DIR__ . '/../models/Raca.php';
//require __DIR__ . '/../routes/animais.php';
require '../endpoints/app.php';

$app->options('/{routes:.+}', function ($request, $response, $args) {
    return $response;
});

$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});


$app->getContainer()->get("db");

$app->run();
