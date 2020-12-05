
CREATE DATABASE search_beers;


USE search_beers;


CREATE TABLE usuario (
codigo INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(128) NOT NULL,
email VARCHAR(128) NOT NULL,
login VARCHAR(128) NOT NULL,
senha VARCHAR(128) NOT NULL,
perfil VARCHAR(45));



CREATE TABLE produto (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(128) NOT NULL,
origem VARCHAR(128) NOT NULL,
fabricante VARCHAR(128) NOT NULL,
volume INT NOT NULL,
preco DECIMAL(10,2) NOT NULL,
teor_alcoolico VARCHAR(45) NOT NULL,
foto VARCHAR(45) NOT NULL,
usuario_codigo INT,
FOREIGN KEY (usuario_codigo) REFERENCES usuario (codigo));

INSERT INTO usuario(nome,login,senha,email,perfil) VALUES
('Christian Marcelino Baptista','christianmb','123456','christian@hotmail.com','Administrador');

INSERT INTO produto (nome,origem,fabricante,volume,preco,teor_alcoolico,foto,usuario_codigo) VALUES
('Colorado Appia','Ribeirão Preto','Colorado',600,8.98,' 5 % ','/imagens/colorado-appia.png/',1);








