<?php
require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/app/db.php';
require __DIR__ . '/app/models/room.php';


$database = new Database();
$conn = $database->getConnection();

$router = new \Bramus\Router\Router();

header('Content-Type: application/json; charset=utf-8');

$router->mount('/api/room', function() use ($router) {
    $router->get('/list', function() {
        global $conn;
        $room = new Room($conn);
        $responce = $room->list();

        http_response_code(200);
        echo json_encode($responce);
    });

    $router->post('/create', function() {
        global $conn;
        $body_json = json_decode(file_get_contents('php://input'));
        $room = new Room($conn);

        $responce = $room->create($body_json->name);

        http_response_code(201);
        echo json_encode($responce);
    });

    $router->post('/update/(\d+)', function($id) {
        echo 'Редактирование комнаты id ' . htmlentities($id);
    });
});

$router->run();
