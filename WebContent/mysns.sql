SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_results = utf8;
CREATE DATABASE IF NOT EXISTS mysns
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE feed ADD COLUMN video VARCHAR(1024) AFTER images;

USE mysns;

CREATE TABLE IF NOT EXISTS user(
    id VARCHAR(128) PRIMARY KEY, -- "email"
    password VARCHAR(32),
    name VARCHAR(32),
    phonenum VARCHAR(128),
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS feed(
    no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id VARCHAR(128), -- "email"
    content VARCHAR(4096),
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    images VARCHAR(1024),
    video VARCHAR(1024)
);
