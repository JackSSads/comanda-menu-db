CREATE TABLE IF NOT EXISTS `setting` (
	setting_id					INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	estabishment_name			VARCHAR(100),
    serveice_change				BOOLEAN DEFAULT 0,
    service_change_percentage	FLOAT DEFAULT 0,
    image_pix					MEDIUMBLOB DEFAULT NULL,
    color						VARCHAR(30) DEFAULT NULL,
    created_at					DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at					DATETIME ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `setting` (estabishment_name, serveice_change, service_change_percentage)
VALUES ('Minha Loja', 0, 0);

SELECT * FROM `setting`;

SELECT image_pix FROM comanda_menu.setting LIMIT 1;
