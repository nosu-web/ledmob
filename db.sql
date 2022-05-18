CREATE TABLE `room` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`code` varchar(100) NOT NULL,
	`author_id` varchar(100) NOT NULL,
	`scenario_id` int NOT NULL,
	`status` tinyint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `author` (
	`id` int NOT NULL AUTO_INCREMENT,
	`login` varchar(50) NOT NULL UNIQUE,
	`password` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `member` (
	`id` int NOT NULL AUTO_INCREMENT,
	`room_id` int NOT NULL,
	`device` varchar(200) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `scenario` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`description` varchar(250) NOT NULL,
	PRIMARY KEY (`id`)
);


