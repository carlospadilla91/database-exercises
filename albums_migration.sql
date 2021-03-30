-- USE codeup_test_db;
--
-- DROP TABLE IF EXISTS albums;
--
-- CREATE TABLE albums (
--     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
--     artist VARCHAR(75) NOT NULL,
--     name VALUE(75) NOT NULL,
--     release_date INT UNSIGNED NOT NULL,
--     sales DECIMAL(10,2) UNSIGNED NOT NULL,
--     genre VARCHAR(50) NOT NULL,
--     PRIMARY KEY(id)

USE codeup_test_db;
DROP TABLE IF EXISTS albums;
CREATE TABLE IF NOT EXISTS albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR (100) NOT NULL,
    album_name VARCHAR (100) NOT NULL,
    release_date INT NOT NULL,
    sales DECIMAL(10, 2) NOT NULL,
    genre VARCHAR (100),
    PRIMARY KEY (id)
);