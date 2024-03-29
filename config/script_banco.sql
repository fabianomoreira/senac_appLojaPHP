DROP DATABASE IF EXISTS appDB;

CREATE DATABASE appDB CHARSET = UTF8 COLLATE = utf8_general_ci;

USE appDB;

-- Criacao da tabela USUARIO

CREATE TABLE usuario(
	id_usuario INT AUTO_INCREMENT,
    login VARCHAR(10) NOT NULL,
    senha VARCHAR(15) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    nascimento DATE,
    endereco VARCHAR(40),
    numero VARCHAR(10),
    complemento VARCHAR(20),
    bairro VARCHAR(25),
    cidade VARCHAR(25),
    estado VARCHAR(2),
    cep VARCHAR(8),
    telefone VARCHAR(10),
	tipo_usuario VARCHAR(20),
    PRIMARY KEY(id_usuario)
);

-- Criacao da tabela ESTADO

CREATE TABLE estado(
	id_estado INT AUTO_INCREMENT,
    uf VARCHAR(2) NOT NULL,
    descricao VARCHAR(25) NOT NULL,
    PRIMARY KEY(id_estado)
);

-- Alteração da estrutura do banco
-- Criando a FOREIGN KEY para estado

ALTER TABLE usuario DROP COLUMN estado;
ALTER TABLE usuario ADD COLUMN id_estado INT NOT NULL;
ALTER TABLE usuario ADD CONSTRAINT fk_estado FOREIGN KEY(id_estado) REFERENCES estado(id_estado);

-- Criacao da tabela TIPO DE USUARIO

CREATE TABLE tipo_usuario(
	id_tipo INT AUTO_INCREMENT,
    descricao VARCHAR(15) NOT NULL,
    PRIMARY KEY(id_tipo)
);

ALTER TABLE usuario DROP COLUMN tipo_usuario;
ALTER TABLE usuario ADD COLUMN id_tipo INT NOT NULL;
ALTER TABLE usuario ADD CONSTRAINT fk_tipo FOREIGN KEY(id_tipo) REFERENCES tipo_usuario(id_tipo);

-- Criacao da tabela PRODUTO

CREATE TABLE produto(
	id_produto INT AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    imagem VARCHAR(100),
    preco DECIMAL(9,2),
    estoque DOUBLE,
    ativo BOOLEAN DEFAULT TRUE,
    PRIMARY KEY(id_produto)
);

-- Criacao da tabela PEDIDO

create table pedido (
    id_pedido   INT AUTO_INCREMENT,
    data_pedido DATETIME,
    id_usuario  INT NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario));

-- Criacao da tabela ITEM PEDIDO

CREATE TABLE item_pedido(
    id_item INT AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    qtd INT,
    valor DECIMAL(9,2),
    PRIMARY KEY(id_item),
    FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);