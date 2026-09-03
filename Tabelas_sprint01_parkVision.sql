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
