CREATE DATABASE BD_projetoV1_PI;

USE BD_projetoV1_PI;

CREATE TABLE usuarios(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
sobrenome VARCHAR(40) NOT NULL,
data_nasc DATE DEFAULT NULL, 
CONSTRAINT CHK_data_nasc CHECK(data_nasc >'1910-01-01'),
telefone VARCHAR(50) NULL,
email VARCHAR(120) NOT NULL,
senha VARCHAR(30) NOT null,
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
status_cliente  VARCHAR(120), -- modificar pois status pode mudar com o tempo
CONSTRAINT CHK_status CHECK(status_cliente IN("ativo","inativo","análise","manutenção")),
cnpj CHAR(14) NULL, -- CPF CEO
CPF CHAR(11),
CONSTRAINT CHK_cnpj_ou_cpf CHECK(cpf IS NOT NULL OR cnpj IS NOT NULL)
);
SELECT 
    CONCAT('consulta de Perfil de : ',nome, ' ', sobrenome) AS 'Nome:',
    CONCAT(data_nasc) AS 'Data de nascimento',
    CONCAT(telefone) AS 'telefone:',
    CONCAT(email) AS 'email',
    CONCAT(data_cadastro) AS 'Data de instalação:',
    CONCAT(cnpj) AS 'CNPJ:',
    CONCAT(cpf) AS 'CPF',
   CASE
		WHEN status_cliente = 'ativo' THEN 'Cliente Ativo'
        WHEN status_cliente = 'inativo' THEN 'Cliente inativo'
        WHEN status_cliente = 'em Processo' THEN 'Cliente em processo de migração'
   END AS 'Status'
FROM usuarios
WHERE id_usuario = 2;

CREATE TABLE estacionamento(
id_estacionamento INT PRIMARY KEY AUTO_INCREMENT,
qtd_vagas INT DEFAULT 1,
cep VARCHAR(120) NOT NULL,
tamanho DECIMAL (7,4) NOT NULL,
tipo_estacionamento VARCHAR(90),
preco_inicial DECIMAL(5,2) NOT NULL,
CONSTRAINT CHK_estacionamento CHECK( tipo_estacionamento IN('aberto','fechado'))
);
SELECT 
     CONCAT(qtd_vagas) AS 'quantidade de vagas do estcionamento',
     CONCAT(cep) AS 'CEP',
     CONCAT(tamanho) AS 'Tamanho em M^2',
     CONCAT(tipo_estacionamento) AS 'Tipo de estacionamento',
     CONCAT(preco_inicial) AS 'Preço inicial da hora do estacionamento'
FROM estacionamento WHERE id_estacionamento = 1;




CREATE TABLE vaga(
    id_vaga INT PRIMARY KEY AUTO_INCREMENT,
    numero_vaga INT NOT NULL,
    status_vaga BOOLEAN,
    vaga_ociosa INT,
    CONSTRAINT CHK_vagas_ociosas CHECK(vaga_ociosa >= 0)
);
SELECT  
	CONCAT(numero_vaga) AS 'numeração da vaga',
    CONCAT(vaga_ociosa) AS 'quantidade vagas ociosas',
    CASE 
		WHEN status_vaga = 1 THEN 'Vaga ocupada'
        WHEN status_vaga = 0 THEN 'vaga pode ser ocupada'
    END AS 'Status da vaga'
FROM vaga WHERE id_vaga = 2;


CREATE TABLE sensor (
id_sensor INT PRIMARY KEY AUTO_INCREMENT,
localizacao varchar(90) NOT NULL DEFAULT 'Posição nao informada'
);
-- cadastro mensagens 
CREATE TABLE alertas(
id_alerta INT PRIMARY KEY AUTO_INCREMENT,
mensagem VARCHAR(90),
data_hora DATETIME DEFAULT NOW()
);

SELECT 
	CONCAT(mensagem) AS 'Mensagem',
    CONCAT(data_hora) AS 'Data e hora do Aviso'
 FROM alerta ;
-- cadastro de troca de preço 

CREATE TABLE historico_preco(
id_troca_preco INT PRIMARY KEY AUTO_INCREMENT,
preco_inicial DECIMAL(5,2) NOT NULL,
preco_modificado DECIMAL(5,2) NOT NULL,
motivo VARCHAR(150) NOT NULL,
data_modf DATE NOT NULL
);

select * from vaga;
select * from estacionamento;
select * from usuarios;


-- 1. USUARIOS
INSERT INTO usuarios (nome, sobrenome, data_nasc, telefone, email, senha, status_cliente, cnpj, cpf) VALUES
('Carlos', 'Eduardo', '1990-05-15', '(11) 98765-4321', 'carlos@email.com', 'senha123', 'ativo', NULL, '12345678901'),
('Empresa', 'Estacione', '1985-10-20', '(11) 3333-4444', 'contato@estacione.com', 'senha456', 'análise', '12345678000199', NULL);

-- 2. ESTACIONAMENTO
INSERT INTO estacionamento (qtd_vagas, cep, tamanho, tipo_estacionamento, preco_inicial) VALUES
(50, '01001-000', 250.50, 'aberto', 12.00),
(100, '04538-132', 500.00, 'fechado', 18.50);

-- 3. VAGA
INSERT INTO vaga (numero_vaga, status_vaga, vaga_ociosa) VALUES
(101, 1, 0),
(102, 0, 15);

-- 4. SENSOR
INSERT INTO sensor (localizacao) VALUES
('Setor A - Vaga 101'),
(DEFAULT);

-- 5. ALERTAS
INSERT INTO alertas (mensagem) VALUES
('Sensor 1 detectou ocupação na vaga.'),
('Ociosidade da vaga 102 ultrapassou o limite.');

-- 6. HISTORICO_PRECO
INSERT INTO historico_preco (preco_inicial, preco_modificado, motivo, data_modf) VALUES
(10.00, 12.00, 'Reajuste anual de inflação', '2026-01-10'),
(12.00, 15.00, 'Aumento de demanda na alta temporada', '2026-06-01');


