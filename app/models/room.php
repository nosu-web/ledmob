<?php
class Room {

    // подключение к базе данных и таблице 'room' 
    private $conn;
  	const TABLE_NAME = 'room';

    // свойства объекта 
    public $id;
    public $name;
    public $code;
    public $scenario_id;
    public $status;
    public $time_start;

    // конструктор для соединения с базой данных 
    public function __construct($db){
        $this->conn = $db;
    }

    function list(){
        $query = "SELECT id, name, code, scenario_id, status, time_start FROM ".self::TABLE_NAME;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $response = array();
        if ($stmt->rowCount() > 0) {
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                extract($row);
                $roomItem = array(
                    "id" => $id,
                    "name" => html_entity_decode($name),
                    "scenario" => $scenario_id,
                    "status" => $status,
                    "time_start" => $time_start,
                );
                array_push($response, $roomItem);
            }
        }
        return $response;
    }

    function create($roomName) {
        $roomCode = mt_rand();

        $query = "INSERT INTO ".self::TABLE_NAME." (`name`, `code`) VALUES ('{$roomName}', '{$roomCode}')";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $roomId = $this->conn->lastInsertId();

        $response = array(
            "id" => $roomId,
            "name" => $roomName,
            "code" => $roomCode,
        );
    
        return $response;
    }
}
