CREATE DATABASE IF NOT EXISTS paleocurios CHARSET utf8mb4;
USE paleocurios;

-- ---------------------------
-- Users' tables
-- ---------------------------

CREATE TABLE IF NOT EXISTS `role` (
    id_role INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(30) NOT NULL UNIQUE
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS `user` (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    user_email VARCHAR(150) NOT NULL UNIQUE,
    user_pwd VARCHAR(255) NOT NULL,
    user_created_at DATETIME NOT NULL DEFAULT NOW()
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS user_role (
    id_user INT,
    CONSTRAINT fk_to_grant_user_user_role 
        FOREIGN KEY (id_user) 
        REFERENCES `user` (id_user) 
        ON DELETE CASCADE,
    id_role INT,
    CONSTRAINT fk_to_grant_role_user_role 
        FOREIGN KEY (id_role) 
        REFERENCES `role`(id_role) 
        ON DELETE CASCADE,
    PRIMARY KEY (id_user, id_role)
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS `owner` (
	id_owner INT PRIMARY KEY AUTO_INCREMENT,
    owner_type ENUM('person', 'museum', 'university', 'company') NOT NULL,
    owner_first_name VARCHAR(50), -- if owner_type = person
    owner_name VARCHAR(100) NOT NULL,
    owner_email VARCHAR(150) UNIQUE,
    id_user INT UNIQUE, -- future feature : owner can be a user or not
    CONSTRAINT fk_to_link_owner_user_owner 
        FOREIGN KEY (id_user) 
        REFERENCES `user`(id_user),
    -- table's constraint
    CONSTRAINT check_owner_first_name CHECK (owner_type <> 'person' OR owner_first_name IS NOT NULL)
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS palaeontologist (
    id_user INT PRIMARY KEY,
    palaeontologist_first_name VARCHAR(50) NOT NULL,
    palaeontologist_last_name VARCHAR(50) NOT NULL,
    palaeontologist_verified BOOL NOT NULL DEFAULT 0, -- 0 = not verified
    CONSTRAINT fk_inherit_user_palaeontologist
        FOREIGN KEY (id_user)
        REFERENCES `user`(id_user)
        ON DELETE CASCADE
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS author (
    id_author INT PRIMARY KEY AUTO_INCREMENT,
    author_first_name VARCHAR(50) NOT NULL,
    author_last_name VARCHAR(50) NOT NULL,
    id_user INT UNIQUE, -- future feature : author can be a user or not
    CONSTRAINT fk_to_link_author_user_author 
        FOREIGN KEY (id_user) 
        REFERENCES `user`(id_user)
)ENGINE=innodb;

-- ---------------------------
-- Fossils' tables
-- ---------------------------

CREATE TABLE IF NOT EXISTS `collection` (
	id_collection INT PRIMARY KEY AUTO_INCREMENT,
    collection_name VARCHAR(30) NOT NULL UNIQUE
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS fossil_type (
	id_fossil_type INT PRIMARY KEY AUTO_INCREMENT,
    fossil_type_name VARCHAR(50) NOT NULL UNIQUE
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS species (
	id_species INT PRIMARY KEY AUTO_INCREMENT,
    species_name VARCHAR(150) NOT NULL UNIQUE,
    species_link VARCHAR(255) -- from Wikipedia if it exists
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS geological_period (
	id_period INT PRIMARY KEY AUTO_INCREMENT,
	period_name VARCHAR(50) NOT NULL UNIQUE,
	period_start DECIMAL(7,3) NOT NULL,
	period_end DECIMAL(7,3) NOT NULL,
    -- table's constraint
    CONSTRAINT check_period_start CHECK (period_start >= period_end)
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS continent (
	id_continent INT PRIMARY KEY AUTO_INCREMENT,
    continent_name VARCHAR(20) NOT NULL UNIQUE
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS country (
	id_country INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(60) NOT NULL UNIQUE,
    id_continent INT NOT NULL,
    CONSTRAINT fk_to_belong_country_continent 
        FOREIGN KEY (id_continent) 
        REFERENCES continent(id_continent)
)ENGINE=innodb;

-- There's a lot of different ways to situate a place and they can coexist sometimes or some part can be missing, coordinates != postal address
CREATE TABLE IF NOT EXISTS place (
	id_place INT PRIMARY KEY AUTO_INCREMENT,
    place_name VARCHAR(100) NOT NULL,
    place_link VARCHAR(255),
    place_address VARCHAR(150),
    place_postcode VARCHAR(10),
    place_city VARCHAR(60),
    place_region VARCHAR(60),
    place_latitude DECIMAL(8,6),
    place_longitude DECIMAL(9,6),
    place_is_sensitive BOOL NOT NULL DEFAULT 0, -- 0 = not sensitive
    id_country INT,
    CONSTRAINT fk_to_situate_place_country 
        FOREIGN KEY (id_country) 
        REFERENCES country(id_country)
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS fossil (
    id_fossil INT PRIMARY KEY AUTO_INCREMENT,
    fossil_name VARCHAR(50) NOT NULL,
    fossil_description VARCHAR(500) NOT NULL,
    fossil_dating_min DECIMAL(7,3), -- if datation is a unique date then min = max
    fossil_dating_max DECIMAL(7,3),
    fossil_researchable BOOL NOT NULL DEFAULT 1, -- 1 = researchable
    fossil_click INT UNSIGNED NOT NULL DEFAULT 0,
    fossil_added_at DATETIME NOT NULL DEFAULT NOW(),
    -- FK
    id_collection INT NOT NULL,
    CONSTRAINT fk_to_gather_fossil_collection
        FOREIGN KEY (id_collection)
        REFERENCES `collection` (id_collection),
    id_fossil_type INT NOT NULL,
    CONSTRAINT fk_to_characterise_fossil_fossil_type
        FOREIGN KEY (id_fossil_type)
        REFERENCES fossil_type (id_fossil_type),
    id_owner INT NOT NULL,
    CONSTRAINT fk_to_own_fossil_owner
        FOREIGN KEY (id_owner)
        REFERENCES `owner` (id_owner),
    id_species INT, -- if known
    CONSTRAINT fk_to_identify_fossil_species
        FOREIGN KEY (id_species)
        REFERENCES species (id_species),
    id_continent INT, -- if known
    CONSTRAINT fk_to_locate_fossil_continent
        FOREIGN KEY (id_continent)
        REFERENCES continent (id_continent),
    id_period INT, -- official geological period
    CONSTRAINT fk_to_date_fossil_period
        FOREIGN KEY (id_period)
        REFERENCES geological_period (id_period),
    id_extraction_place INT, -- if known and secured
    CONSTRAINT fk_to_extract_fossil_extraction_place
        FOREIGN KEY (id_extraction_place)
        REFERENCES place (id_place),
     id_exhibition_place INT, -- if there is
    CONSTRAINT fk_to_display_fossil_exhibition_place
        FOREIGN KEY (id_exhibition_place)
        REFERENCES place (id_place),
    -- table's constraint
    CONSTRAINT check_fossil_dating CHECK (fossil_dating_min <= fossil_dating_max)
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS palaeontologist_fossil (
    id_user INT NOT NULL,
    CONSTRAINT fk_to_save_palaeontologist_fossil_palaeontologist
        FOREIGN KEY (id_user)
        REFERENCES palaeontologist (id_user)
        ON DELETE CASCADE,
    id_fossil INT NOT NULL,
    CONSTRAINT fk_to_save_palaeontologist_fossil_fossil
        FOREIGN KEY (id_fossil)
        REFERENCES fossil (id_fossil)
        ON DELETE CASCADE,
    PRIMARY KEY (id_user, id_fossil),
    saved_at DATETIME NOT NULL
)ENGINE=innodb;

-- ---------------------------
-- Pictures' tables
-- ---------------------------

CREATE TABLE IF NOT EXISTS credit (
    id_credit INT PRIMARY KEY AUTO_INCREMENT,
    credit_name VARCHAR(100) NOT NULL UNIQUE,
    credit_link VARCHAR(255)
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS license (
    id_license INT PRIMARY KEY AUTO_INCREMENT,
    license_name VARCHAR(50) NOT NULL UNIQUE,
    license_link VARCHAR(255)
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS picture (
    id_picture INT PRIMARY KEY AUTO_INCREMENT,
    picture_path VARCHAR(255) NOT NULL UNIQUE,
    picture_alt VARCHAR(255) NOT NULL,
    picture_title VARCHAR(150),
    picture_source_link VARCHAR(255),
    picture_modification VARCHAR(200), -- if the picture has been modified
    picture_position INT, -- position in fossil's carousel
    -- FK
    id_credit INT NOT NULL,
    CONSTRAINT fk_to_credit_picture_credit
        FOREIGN KEY (id_credit)
        REFERENCES credit (id_credit),
    id_license INT NOT NULL,
    CONSTRAINT fk_to_license_picture_license
        FOREIGN KEY (id_license)
        REFERENCES license (id_license),
    id_fossil INT,
    CONSTRAINT fk_to_depict_picture_fossil
        FOREIGN KEY (id_fossil)
        REFERENCES fossil (id_fossil)
        ON DELETE SET NULL,
    -- table's constraint
    CONSTRAINT unique_fossil_position UNIQUE (id_fossil, picture_position)
)ENGINE=innodb;

-- ---------------------------
-- Articles' tables
-- ---------------------------

CREATE TABLE IF NOT EXISTS article (
    id_article INT PRIMARY KEY AUTO_INCREMENT,
    article_title VARCHAR(150) NOT NULL,
    article_introduction VARCHAR(255) NOT NULL,
    article_published_at DATETIME NOT NULL DEFAULT NOW(),
    article_last_updated_at DATETIME -- added if the article is modified
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS author_article (
    id_author INT NOT NULL,
    CONSTRAINT fk_to_write_author_article_author
        FOREIGN KEY (id_author)
        REFERENCES author (id_author)
        ON DELETE CASCADE,
    id_article INT NOT NULL,
    CONSTRAINT fk_to_write_author_article_article
        FOREIGN KEY (id_article)
        REFERENCES article (id_article)
        ON DELETE CASCADE,
    PRIMARY KEY (id_author, id_article),
    author_position INT NOT NULL -- ex: first author, second author
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS section (
    id_section INT PRIMARY KEY AUTO_INCREMENT,
    section_title VARCHAR(150), -- not required
    section_position INT NOT NULL,
    -- FK
    id_article INT NOT NULL,
    CONSTRAINT fk_to_structure_section_article
        FOREIGN KEY (id_article)
        REFERENCES article (id_article)
        ON DELETE CASCADE,
    -- table's constraint
    CONSTRAINT unique_article_position UNIQUE (id_article, section_position)
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS `block` (
    id_block INT PRIMARY KEY AUTO_INCREMENT,
    block_type ENUM('paragraph', 'image') NOT NULL,
    block_position INT NOT NULL,
    -- FK
    id_section INT NOT NULL,
    CONSTRAINT fk_to_compose_block_section
        FOREIGN KEY (id_section)
        REFERENCES section (id_section)
        ON DELETE CASCADE,
    -- table's constraint
    CONSTRAINT unique_block_position UNIQUE (id_section, block_position)
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS paragraph_block (
    id_block INT NOT NULL,
    CONSTRAINT fk_inherit_paragraph_block_block
        FOREIGN KEY (id_block)
        REFERENCES `block`(id_block)
        ON DELETE CASCADE,
    PRIMARY KEY (id_block),
    paragraph_text TEXT NOT NULL
)ENGINE=innodb;

CREATE TABLE IF NOT EXISTS image_block (
    id_block INT NOT NULL,
    CONSTRAINT fk_inherit_image_block_block
        FOREIGN KEY (id_block)
        REFERENCES `block`(id_block)
        ON DELETE CASCADE,
    PRIMARY KEY (id_block),
    image_caption VARCHAR(150),
    -- FK
    id_picture INT NOT NULL,
    CONSTRAINT fk_to_illustrate_image_block_picture  
        FOREIGN KEY (id_picture)
        REFERENCES picture (id_picture)
)ENGINE=innodb;