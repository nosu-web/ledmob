CREATE TABLE `room` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`code` varchar(100) NOT NULL,
	`scenario_id` int NOT NULL,
	`status` tinyint(1) NOT NULL,
	`time_start` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `member` (
	`id` int NOT NULL AUTO_INCREMENT,
	`room_id` int NOT NULL,
	`deviceid` varchar(200) NOT NULL UNIQUE,
	`is_author` tinyint(1) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `scenario` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`description` varchar(250) NOT NULL,
	PRIMARY KEY (`id`)
);
