USE codeup_test_db;
DROP TABLE IF EXISTS books;
CREATE TABLE IF NOT EXISTS books (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR (100) NOT NULL,
    author VARCHAR (100) NOT NULL DEFAULT 'Unknown',
    date_published DATE NOT NULL,
    description TEXT,
    bestseller_weeks SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);