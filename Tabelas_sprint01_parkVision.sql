CREATE DATABASE BD_projetoV1_PI;
USE BD_projetoV1_PI;
CREATE TABLE usuarios(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
sobrenome VARCHAR(40) NOT NULL,
data_nasc DATE DEFAULT NULL,
CONSTRAINT CHK_data_nasc CHECK(data_nasc >'1910-01-01'),
telefone VARCHAR(50) NOT NULL,
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
status_cliente  BOOLEAN,
cnpj CHAR(14) NULL 
);
CREATE TABLE estacionamento(
id_estacionamento INT PRIMARY KEY AUTO_INCREMENT,
qtd_vagas INT DEFAULT 1,
cep VARCHAR(120) NOT NULL,
tamanho DECIMAL (7,4) NOT NULL,
tipo_estacionamento VARCHAR(90),
CONSTRAINT CHK_estacionamento CHECK( tipo_estacionamento IN('aberto','fechado'))
);
CREATE TABLE vaga(
id_vaga INT PRIMARY KEY AUTO_INCREMENT,
numero_vaga INT NOT NULL,
status_vaga BOOLEAN
);
INSERT INTO usuarios (nome, sobrenome, data_nasc, telefone, status_cliente, cnpj) VALUES 
('Carlos', 'Silva', '1985-04-12', '11999998888', 1, NULL),
('Ana', 'Oliveira', '1992-08-23', '11988887777', 1, '12345678000199'),
('Bruno', 'Santos', '1978-11-02', '21977776666', 0, NULL),
('Mariana', 'Costa', '2000-01-15', '31966665555', 1, '98765432000188'),
('Ricardo', 'Almeida', NULL, '11955554444', 1, NULL); 
INSERT INTO estacionamento (qtd_vagas, cep, tamanho, tipo_estacionamento) VALUES 
(50, '01001-000', 500.5000, 'fechado'),
(20, '02002-000', 250.0000, 'aberto'),
(100, '03003-000', 120.7500, 'fechado'),
(15, '04004-120', 150.0000, 'aberto'),
(80, '05005-400', 950.0000, 'fechado'),
(35, '06006-300', 410.2500, 'aberto');
INSERT INTO vaga (numero_vaga, status_vaga) VALUES 
(101, 1), (102, 0), (103, 1),(104, 0),(201, 1),(202, 1),(203, 0);
SELECT 
    CONCAT('consulta de Perfil de : ',nome, ' ', sobrenome) AS 'Nome:',
    CONCAT(telefone) AS 'telefone:',
    CONCAT(data_cadastro) AS 'Data de instalação:',
    CONCAT(cnpj) AS 'CNPJ:',
   CASE
		WHEN status_cliente = 1 THEN 'Cliente Ativo'
        WHEN status_cliente = 0 THEN 'Cliente inativo'
   END AS 'Status'
FROM usuarios
WHERE id_usuario = 2;
ALTER TABLE vaga ADD COLUMN vagas_ociosas INT, ADD CONSTRAINT CHK_vagas_ociosas CHECK( vagas_ociosas >=0);
SET SQL_SAFE_UPDATES = 0;
UPDATE vaga SET vagas_ociosas = 10;
SET SQL_SAFE_UPDATES = 1;
SELECT  
	CONCAT(numero_vaga) AS 'numeração da vaga',
    CONCAT(vagas_ociosas) AS 'quantidade vagas ociosas',
    CASE 
		WHEN status_vaga = 1 THEN 'Vaga ocupada'
        WHEN status_vaga = 0 THEN 'vaga pode ser ocupada'
    END AS 'Status da vaga'
FROM vaga WHERE id_vaga = 2;
SELECT 
     CONCAT(qtd_vagas) AS 'quantidade de vagas do estcionamento',
     CONCAT(cep) AS 'CEP',
     CONCAT(tamanho) AS 'Tamanho em M^2',
     CONCAT(tipo_estacionamento) AS 'Tipo de estacionamento'
FROM estacionamento WHERE id_estacionamento = 1;

select * from vaga;
select * from estacionamento;
select * from usuarios;


