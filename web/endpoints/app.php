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


   
    return $response->withJson($pet, 200)->withHeader('Access-Control-Allow-Origin', '*');
    //return $this->renderer->render($response, 'index.phtml',  array("pet" => $pet));


});



$app->get('/animais/getAnimalId/{id}', function (Request $request, Response $response, array $args) {
    $pet =Animal::find($args['id']);
    return json_encode($pet);

    //return $this->renderer->render($response, 'index.phtml',  array("pet" => $pet));

});



$app->get('/raca/listar', function (Request $request, Response $response, array $args) {

    $pet = DB::table('racas')->get();
    return json_encode($pet);
   
    return $response->withJson($pet, 200)->withHeader('Access-Control-Allow-Origin', '*');
    //return $this->renderer->render($response, 'index.phtml',  array("pet" => $pet));


});


$app->get('/animais/stat', function (Request $request, Response $response, array $args) {

    $cout = DB::table('animais')->get()->count();
    return json_encode($cout);

    $pet =Animal::all();
   
    return $response->withJson($pet, 200)->withHeader('Access-Control-Allow-Origin', '*');
    //return $this->renderer->render($response, 'index.phtml',  array("pet" => $pet));


});



$app->post('/animais/criar', function (Request $request, Response $response, array $args) {
    $data = $request->getParsedBody();
   
    $result = $this->db->connection()->statement("CALL criar(:param1, :param2,:param3,:param4,:param5,:param6,:param7,:param8
    );", array(':param1' => $data['nome'], ':param2' => $data['raca_id'], ':param3' => $data['chip'], ':param4' => $data['data_nascimento'], 
    ':param5' => null, ':param6' => $data['data_falecimento']
    , ':param7' => $data['sexo'], ':param8' => $data['especie']));
    return $response->withJson($result);
 

});

$app->post('/racas/criar', function (Request $request, Response $response, array $args) {
    $data = $request->getParsedBody();
   
    $result = $this->db->connection()->statement("CALL criar_racas(:param1, :param2);", 
    array(':param1' => $data['nome'], ':param2' => $data['situacao']));
    return $response->withJson($result);
 

});

$app->put('/racas/atualizar', function (Request $request, Response $response, array $args) {
    $data = $request->getParsedBody();
   
    $result = $this->db->connection()->statement("CALL atualicar_racas(:param1, :param2,:param3 );", 
    array(':param1' => $data['nome'], ':param2' => $data['id'],':param3' => $data['situacao']));
    return $response->withJson($result);
 

});



$app->put('/animais/atualizar', function (Request $request, Response $response, array $args) {
    $data = $request->getParsedBody();
  
    $result = $this->db->connection()->statement("CALL atualizar(:param1, :param2,:param3,:param4,:param5,:param6,:param7,:param8,:param9
    );", array(':param1' => $data['id'],':param2' => $data['nome'], ':param3' => $data['raca_id'], ':param4' => $data['chip'], ':param5' => $data['data_nascimento']== "" ? null : $data['data_nascimento'], 
    ':param6' =>  date('Y-m-d H:i'), ':param7' => $data['data_falecimento'] == "" ? null :$data['data_falecimento']  ,
    ':param8' => $data['sexo'], ':param9' => $data['especie']));
    return $response->withJson($result, 200);
});


$app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function($req, $res) {
    $handler = $this->notFoundHandler; // handle using the default Slim page not found handler
    return $handler($req, $res);
});