CREATE TABLE IF NOT EXISTS comanda_menu.order (
	order_id     			INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	check_id      			INTEGER NOT NULL,
	product_id    			INTEGER NOT NULL,
	quantity      			INTEGER DEFAULT 1,
	status				BOOLEAN DEFAULT 1,
	obs           			VARCHAR(100) DEFAULT NULL,
	created_at			DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at			DATETIME ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (check_id) 		REFERENCES comanda_menu.check (check_id) ON DELETE CASCADE,
	FOREIGN KEY (product_id) 	REFERENCES comanda_menu.product (product_id) ON DELETE CASCADE
);
