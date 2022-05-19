<?php
class Room {

    // подключение к базе данных и таблице 'room' 
    private $conn;
    private $table_name = "room";

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

    function read(){
        // выбираем все записи 
        $query = "SELECT
                    id, name, code, scenario_id, status, time_start
                FROM " . $this->table_name;
    
        // подготовка запроса 
        $stmt = $this->conn->prepare($query);
    
        // выполняем запрос 
        $stmt->execute();
    
        return $stmt;
    }
}
?>
