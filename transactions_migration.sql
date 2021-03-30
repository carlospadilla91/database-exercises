USE bank_db;
DROP TABLE IF EXISTS transactions;
CREATE TABLE IF NOT EXISTS transactions (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    date DATE NOT NULL,
    description VARCHAR (100),
    memo TEXT,
    amount DECIMAL (10,2) NOT NULL,
    transaction_successful TINYINT,
    PRIMARY KEY (id)
);