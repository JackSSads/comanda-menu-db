CREATE TABLE IF NOT EXISTS comanda_menu.setting (
	setting_id			INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	estabishment_name		VARCHAR(100),
	serveice_change			BOOLEAN DEFAULT 0,
	service_change_percentage	FLOAT DEFAULT 0,
	image_pix			MEDIUMBLOB DEFAULT NULL,
	color				VARCHAR(30) DEFAULT NULL,
	service_change_printer		BOOLEAN DEFAULT 0,
	printer_name				VARCHAR(30) DEFAULT NULL,
	created_at			DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at			DATETIME ON UPDATE CURRENT_TIMESTAMP
);
