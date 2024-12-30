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

-- Inserindo dados
INSERT INTO cashier (lenght_cheks) VALUES (0);

SELECT * FROM cashier LIMIT 1;

-- Atualizando caixa
UPDATE comanda_menu.cashier c
SET
	c.lenght_cheks = (
		SELECT COUNT(*)
		FROM comanda_menu.check c
		WHERE c.status = 0
    ),
	c.lenght_products = (
		SELECT SUM(o.quantity)
		FROM comanda_menu.order o
        JOIN comanda_menu.check c
			USING(check_id)
		WHERE c.status = 0
    ),
    c.total_value = (
		SELECT 
			SUM(c.total_value)
		FROM comanda_menu.check c
		WHERE c.status = 0
    ),
    c.pix = (
		SELECT 
			SUM(c.total_value)
		FROM comanda_menu.check c
		WHERE c.status = 0 
		AND c.pay_form = 'pix'
    ),
    c.debit = (
		SELECT 
			SUM(c.total_value)
		FROM comanda_menu.check c
		WHERE c.status = 0 
		AND c.pay_form = 'debit'
    ),
    c.credit = (
		SELECT 
			SUM(c.total_value)
		FROM comanda_menu.check c
		WHERE c.status = 0 
		AND c.pay_form = 'credit'
    )
WHERE c.cashier_id = 1;