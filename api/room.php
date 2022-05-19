<?php
// необходимые HTTP-заголовки 
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// подключение файлов для соединения с БД и файл с классом Room 
include_once '../config/database.php';
include_once '../models/room.php';

// создание подключения к базе данных 
$database = new Database();
$db = $database->getConnection();

// инициализация объекта 
$room = new Room($db);

// запрос для категорий 
$stmt = $room->read();
$num = $stmt->rowCount();

// проверяем, найдено ли больше 0 записей 
if ($num > 0) {

    // массив 
    $room_array = array();

    // получим содержимое нашей таблицы 
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // извлекаем строку 
        extract($row);

        $room_item = array(
            "id" => $id,
            "name" => html_entity_decode($name),
            "scenario" => $scenario_id,
            "status" => $status,
            "time_start" => $time_start,
        );

        array_push($room_array, $room_item);
    }

    // код ответа - 200 OK 
    http_response_code(200);

    // покажем данные категорий в формате json 
    echo json_encode($room_array);
} else {

    // код ответа - 404 Ничего не найдено 
    http_response_code(404);

    // сообщим пользователю, что комнаты не найдены 
    echo json_encode(array("message" => "Комнаты не найдены."), JSON_UNESCAPED_UNICODE);
}
?>
