CREATE TABLE IF NOT EXISTS `product` (
	product_id		INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	product_name 	VARCHAR(30) NOT NULL,
	price			FLOAT NOT NULL,
	category		VARCHAR(15) NOT NULL,
    description 	VARCHAR(100) DEFAULT NULL,
    stock			INTEGER DEFAULT 0,
    image			MEDIUMBLOB DEFAULT NULL,
    created_at		DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at		DATETIME ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE product
MODIFY COLUMN image MEDIUMBLOB DEFAULT NULL;

SELECT * FROM product;

SELECT *
FROM product
WHERE stock > 1;

-- Produtos esgotados - OK
SELECT *
FROM product
WHERE stock = 0;

-- Paginação
SELECT *
FROM comanda_menu.product p
ORDER BY p.product_name
LIMIT 5 OFFSET 5;

SELECT 
	p.product_id,
	p.product_name,
	p.price,
	p.category,
	p.description,
	p.stock,
	p.image,
	(SELECT COUNT(*) FROM comanda_menu.product) AS total_products
FROM comanda_menu.product p
ORDER BY p.product_name
LIMIT 5 OFFSET 0;

-- Atualizar produto - OK
UPDATE comanda_menu.product p
SET product_name = 'Ensopado de camarão',
    p.price = 127.5,
    p.category = 'Frutos do mar',
    p.description = 'Ensopado de camarão com arroz e batata',
    p.stock = 50
WHERE p.product_id = 1;

-- Inserindo produto - OK
INSERT INTO `product` (product_name, price, category, description, stock)
VALUES 
('Ensopado de camarão', 127.5, 'Frutos do mar', 'Ensopado de camarão com arroz e batata.', 10),
('Salmão grelhado', 95.0, 'Frutos do mar', 'Salmão grelhado acompanhado de purê de batatas.', 15),
('Moqueca de peixe', 105.0, 'Frutos do mar', 'Moqueca de peixe com pirão.', 8),
('Picanha na chapa', 150.0, 'Carnes', 'Picanha na chapa com farofa e vinagrete.', 12),
('Costela barbecue', 120.0, 'Carnes', 'Costela ao molho barbecue com fritas.', 7),
('Pizza Margherita', 45.0, 'Massas', 'Pizza clássica de tomate e manjericão.', 20),
('Spaghetti Carbonara', 60.0, 'Massas', 'Spaghetti ao molho carbonara.', 18),
('Bolo de chocolate', 20.0, 'Sobremesas', 'Bolo de chocolate com cobertura cremosa.', 25),
('Brownie', 15.0, 'Sobremesas', 'Brownie com calda de caramelo.', 30),
('Suco de laranja', 8.0, 'Bebidas', 'Suco de laranja natural.', 50);