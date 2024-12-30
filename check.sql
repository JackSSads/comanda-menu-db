CREATE TABLE IF NOT EXISTS comanda_menu.`check` (
	check_id					INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_client					VARCHAR(100) NOT NULL,
    obs							VARCHAR(100) DEFAULT NULL,
    total_value					FLOAT DEFAULT 0,
    status						BOOLEAN DEFAULT 1,
    pay_form					VARCHAR(10) DEFAULT NULL,
    cashier_id					INTEGER NOT NULL,
    created_at					DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at					DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cashier_id)	REFERENCES `cashier` (cashier_id) ON DELETE CASCADE
);

-- Comandas status - OK
select *
from comanda_menu.`check`
where status = 1;

-- Cadastrando comandas
INSERT INTO comanda_menu.check (name_client, cashier_id)
VALUES 
('Jack', 1),
('Bianca', 1),
('Mariana', 1),
('Carlos', 1),
('Fernanda', 1),
('Luiz', 1),
('Ana', 1),
('Pedro', 1),
('Juliana', 1),
('Gabriel', 1);

-- Atualizar  valor total da comanda
UPDATE comanda_menu.check c
SET
	total_value = (
		SELECT sum(o.quantity * p.price)
		FROM comanda_menu.order o
		JOIN comanda_menu.product p
			ON o.product_id = p.product_id
		WHERE o.check_id = c.check_id
    )
WHERE c.check_id = 5;

-- Fechar comanda
UPDATE comanda_menu.check c
SET status = 0, pay_form = 'credit'
WHERE c.check_id = 7;
