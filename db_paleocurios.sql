CREATE DATABASE IF NOT EXISTS paleocurios CHARSET utf8mb4;
USE paleocurios;


CREATE TABLE IF NOT EXISTS continent (
	id_continent INT PRIMARY KEY AUTO_INCREMENT,
    continent_name VARCHAR(20) NOT NULL UNIQUE
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS collection (
	id_collection INT PRIMARY KEY AUTO_INCREMENT,
    collection_name VARCHAR(20) NOT NULL UNIQUE
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS fossil_type (
	id_fossil_type INT PRIMARY KEY AUTO_INCREMENT,
    fossil_type_name VARCHAR(50) NOT NULL UNIQUE
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS species (
	id_species INT PRIMARY KEY AUTO_INCREMENT,
    species_name VARCHAR(100) NOT NULL UNIQUE,
    species_link VARCHAR(255) NOT NULL UNIQUE
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS extraction_site (
	id_extraction_site INT PRIMARY KEY AUTO_INCREMENT,
    extraction_site_name VARCHAR(100) NOT NULL UNIQUE,
    id_address INT NOT NULL
)ENGINE=innodb;
-- Create constraint for FK id_address

CREATE TABLE IF NOT EXISTS exhibition_site (
	id_exhibition_site INT PRIMARY KEY AUTO_INCREMENT,
    exhibition_site_name VARCHAR(100) NOT NULL UNIQUE,
    exhibition_site_link VARCHAR(255),
    id_address INT NOT NULL
)ENGINE=innodb;
-- Create constraint for FK id_address

CREATE TABLE IF NOT EXISTS `owner` (
	id_owner INT PRIMARY KEY AUTO_INCREMENT,
    owner_surname VARCHAR(50) NOT NULL,
    owner_name VARCHAR(50) NOT NULL,
    owner_email VARCHAR(100) NOT NULL UNIQUE
)ENGINE=innodb;