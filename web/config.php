<?php
return [
    'settings' => [
        // Slim Settings
        'determineRouteBeforeAppMiddleware' => true,
        'displayErrorDetails' => true,
        'db' => [
            'driver' => 'mysql',
            'host' => 'localhost',
            'database' => 'selecao_fullstack',
            'username' => 'root',
            'password' => '',
            'charset'   => 'utf8',
            'collation' => 'utf8_unicode_ci',
            'prefix'    => '',
        ]
    ],
];