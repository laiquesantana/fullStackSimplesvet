<?php

require '../vendor/autoload.php';

session_start();

$settings = require __DIR__ . '/../src/settings.php';
$app = new \Slim\App($settings);

require __DIR__ . '/../src/dependencies.php';
require __DIR__ . '/../src/routes.php';
require __DIR__ . '/../models/Animal.php';
require __DIR__ . '/../models/Raca.php';
//require __DIR__ . '/../routes/animais.php';
//require '../endpoints/app.php';

$app->getContainer()->get("db");

$app->run();
