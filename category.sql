CREATE TABLE IF NOT EXISTS comanda_menu.category (
	category_id		INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_category	VARCHAR(50) NOT NULL,
    screen			VARCHAR(20) NOT NULL,
    created_at		DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at		DATETIME ON UPDATE CURRENT_TIMESTAMP
)

SELECT * FROM comanda_menu.category;

INSERT INTO comanda_menu.category (name_category, screen)
VALUES ('Bebidas', 'bar')