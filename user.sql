-- Usuários - OK
CREATE TABLE IF NOT EXISTS `user` (
	user_id		INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username	VARCHAR(100) NOT NULL,
    email		VARCHAR(100) NOT NULL UNIQUE,
    password	VARCHAR(150) NOT NULL,
    func		VARCHAR(20) NOT NULL,
    created_at	DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at	DATETIME ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `user` (username, email, password, func)
VALUES ('ADM', 'example@test.com', '123', 'garcom');
SELECT * FROM `user`;