CREATE TABLE IF NOT EXISTS comanda_menu.check (
    check_id				INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_client				VARCHAR(100) NOT NULL,
    obs					VARCHAR(100) DEFAULT NULL,
    total_value				FLOAT DEFAULT 0,
    status				BOOLEAN DEFAULT 1,
    pay_form				VARCHAR(10) DEFAULT NULL,
    created_for                 	BOOLEAN DEFAULT 0, -- 0 garcom, 1 site
    cashier_id				INTEGER NOT NULL,
    notify_id 				VARCHAR(255),
    created_at				DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at				DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cashier_id)		REFERENCES `cashier` (cashier_id) ON DELETE CASCADE
);
