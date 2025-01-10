CREATE TABLE IF NOT EXISTS comanda_menu.cashier (
	cashier_id		INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lenght_cheks 	INTEGER DEFAULT 0,
    lenght_products INTEGER DEFAULT 0,
    total_value		FLOAT DEFAULT 0,
	pix				FLOAT DEFAULT 0,
	debit			FLOAT DEFAULT 0,
	credit			FLOAT DEFAULT 0,
	cash			FLOAT DEFAULT 0,
    status			BOOLEAN DEFAULT 1, -- Aberto
    created_at		DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at		DATETIME ON UPDATE CURRENT_TIMESTAMP
);
