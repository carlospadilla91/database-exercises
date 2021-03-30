USE codeup_test_db;
DROP TABLE IF EXISTS pizza_order;
CREATE TABLE IF NOT EXISTS pizza_order (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR (50) NOT NULL DEFAULT 'Guest',
    phone VARCHAR (20) NOT NULL,
    email VARCHAR (50) DEFAULT 'No email given',
    address TEXT NOT NULL,
    pizza_size SMALLINT NOT NULL,
    total_cost DECIMAL (6,2) NOT NULL,
    description TEXT NOT NULL,
    isDelivered TINYINT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    PRIMARY KEY (id)
);

