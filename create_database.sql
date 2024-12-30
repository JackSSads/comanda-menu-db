CREATE DATABASE IF NOT EXISTS comanda_menu;
DROP DATABASE IF EXISTS comanda_menu;
USE comanda_menu;

-- Desativar restrições para truncar dados
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `order`;
TRUNCATE TABLE `check`;
TRUNCATE TABLE `product`;
SET FOREIGN_KEY_CHECKS = 1;