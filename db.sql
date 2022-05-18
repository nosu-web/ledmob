CREATE TABLE `room` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL AUTO_INCREMENT,
	`code` varchar(100) NOT NULL AUTO_INCREMENT,
	`author_id` varchar(100) NOT NULL AUTO_INCREMENT,
	`scenario_id` int NOT NULL AUTO_INCREMENT,
	`status` bool NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `author` (
	`id` int NOT NULL AUTO_INCREMENT,
	`login` varchar(50) NOT NULL AUTO_INCREMENT UNIQUE,
	`password` varchar(100) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `member` (
	`id` int NOT NULL AUTO_INCREMENT,
	`room_id` int NOT NULL AUTO_INCREMENT,
	`device` varchar(200) NOT NULL AUTO_INCREMENT UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `scenario` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL AUTO_INCREMENT,
	`description` varchar(250) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `room` ADD CONSTRAINT `room_fk0` FOREIGN KEY (`author_id`) REFERENCES `author`(`id`);

ALTER TABLE `room` ADD CONSTRAINT `room_fk1` FOREIGN KEY (`scenario_id`) REFERENCES `scenario`(`id`);

ALTER TABLE `member` ADD CONSTRAINT `member_fk0` FOREIGN KEY (`room_id`) REFERENCES `room`(`id`);




