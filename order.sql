CREATE TABLE IF NOT EXISTS comanda_menu.`order` (
	order_id     				INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    check_id      				INTEGER NOT NULL,
    product_id    				INTEGER NOT NULL,
    quantity      				INTEGER DEFAULT 1,
    status						BOOLEAN DEFAULT 1,
    obs           				VARCHAR(100) DEFAULT NULL,
    created_at					DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at					DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (check_id) 		REFERENCES `check` (check_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) 	REFERENCES `product` (product_id) ON DELETE CASCADE
);

--  Todos os pedidos
select
	o.order_id,
	c.name_client,
	p.product_name,
	o.quantity,
	o.status,
	o.created_at,
	c.pay_form
FROM comanda_menu.`check` as c
JOIN comanda_menu.`order` as o
	ON c.check_id = o.check_id
JOIN comanda_menu.`product` p
	ON p.product_id = o.product_id
order by o.created_at;
	
-- Pedidos status
SELECT 
    o.order_id,
    c.name_client,
    c.pay_form,
    c.check_id,
    p.product_id,
    p.product_name,
    p.category,
    o.quantity,
    o.status,
    o.created_at
FROM comanda_menu.order as o
JOIN comanda_menu.check as c
    ON c.check_id = o.check_id
JOIN comanda_menu.product p
    ON p.product_id = o.product_id
WHERE o.status = 1
ORDER BY o.created_at;

-- Pedidos da comanda
SELECT
    o.order_id,
    c.name_client,
    p.product_name,
    o.quantity,
    o.status,
    o.created_at,
    c.pay_form,
    SUM(p.price * o.quantity) AS total_price
FROM comanda_menu.`check` AS c
JOIN comanda_menu.`order` AS o
    ON c.check_id = o.check_id
JOIN comanda_menu.`product` AS p
    ON p.product_id = o.product_id
WHERE c.check_id = 1
GROUP BY
    o.order_id,
    c.name_client,
    p.product_name,
    o.quantity,
    o.status,
    o.created_at,
    c.pay_form;


-- Inserindo pedidos
INSERT INTO comanda_menu.`order` (check_id, product_id, quantity, obs)
VALUES 
(31, 1, 2, 'Sem pimenta'),
(32, 3, 1, 'Acompanhado de arroz extra'),
(33, 5, 3, 'Molho à parte'),
(34, 8, 2, 'Com menos açúcar'),
(35, 6, 1, 'Adicionar bacon'),
(36, 2, 2, 'Sem salada'),
(37, 4, 4, 'Com farofa extra'),
(38, 9, 1, 'Acompanhado de chantilly'),
(39, 7, 2, 'Com bastante molho'),
(40, 10, 3, 'Sem gelo');

INSERT INTO `order` (check_id, product_id, quantity, obs)
VALUES (1, 3, 1, NULL);

-- Calculando quantidade de produtos vendidos
select sum(o.quantity) AS quantity_product_ordered
from comanda_menu.order o;

-- Calculando valor total vendidos
SELECT
    SUM(o.quantity * p.price) AS total_value
FROM comanda_menu.order o
JOIN comanda_menu.product p
    ON o.product_id = p.product_id;
    
DELETE FROM comanda_menu.order o
WHERE o.order_id = 11;


SELECT SUM(o.quantity)
FROM comanda_menu.order o
JOIN comanda_menu.check c
	ON o.check_id = c.check_id
WHERE c.status = 0