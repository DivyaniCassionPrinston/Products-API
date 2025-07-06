-- AUTO-GENERATED FILE.

-- This file is an auto-generated file by Ballerina persistence layer for model.
-- Please verify the generated scripts and execute them against the target DB server.

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
	`id` INT AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`description` VARCHAR(191),
	`coverage_type` VARCHAR(100),
	`coverage_amount` DECIMAL(15,2),
	`deductible` DECIMAL(15,2),
	`premium` VARCHAR(50),
	PRIMARY KEY(`id`)
);


