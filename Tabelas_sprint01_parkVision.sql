create database BD_projetoV1_PI;

use BD_projetoV1_PI;

create table usuarios(
id_usuario int primary key auto_increment,
nome varchar(40) not null,
sobrenome varchar(40) not null,
data_nasc date default 'não informada',
constraint CHK_data_nasc check(data_nasc >'1910-01-01'),
telefone varchar(50) not null,
data_cadastro datetime default current_timestamp,
status_cliente  boolean,
cnpj char(14) null 
);

create table estacionamento(
id_estacionamento int primary key auto_increment,
qtd_vagas int default 1,
cep varchar(120) not null,
tamanho decimal (10,4) not null,
tipo_estacionamento varchar(90),
constraint CHK_estacionamento check( tipo_estacionamento in('aberto','fechado'))
);

create table vaga(
id_vaga int primary key auto_increment,
numero_vaga int not null,
status_vaga boolean
);

INSERT INTO usuarios (nome, sobrenome, data_nasc, telefone, status_cliente, cnpj) VALUES 
('Carlos', 'Silva', '1985-04-12', '11999998888', 1, NULL),
('Ana', 'Oliveira', '1992-08-23', '11988887777', 1, '12345678000199'),
('Bruno', 'Santos', '1978-11-02', '21977776666', 0, NULL),
('Mariana', 'Costa', '2000-01-15', '31966665555', 1, '98765432000188'),
('Ricardo', 'Almeida', NULL, '11955554444', 1, NULL); -- data_nasc como NULL (não informada)

