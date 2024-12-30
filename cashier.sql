CREATE TABLE IF NOT EXISTS cashier (
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

SELECT * FROM cashier LIMIT 1;

-- Inserindo dados
INSERT INTO cashier (lenght_cheks) VALUES (0);

UPDATE cashier
SET
	lenght_cheks = 10,
	lenght_products = 10,
	total_value = @quantity_products,
	status = 0
WHERE cashier_id = 1;

UPDATE cashier
SET
	lenght_cheks = 10,
	lenght_products = 10,
	total_value = @quantity_products,
	status = 0
WHERE cashier_id = 1;