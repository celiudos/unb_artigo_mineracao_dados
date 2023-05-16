-- Active: 1684245138463@@127.0.0.1@3306@projfbd

-- TABELAS

CREATE TABLE
    OCUPACAO (
        id INT NOT NULL,
        nome VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    ) ENGINE = InnoDB;

CREATE TABLE
    SEXO (
        id INT NOT NULL,
        nome VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    ) ENGINE = InnoDB;

CREATE TABLE
    REGIAO (
        id INT NOT NULL,
        nome VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    ) ENGINE = InnoDB;

-- Drop all tables

CREATE TABLE
    UF (
        id INT NOT NULL,
        id_regiao INT NOT NULL,
        nome VARCHAR(255) NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (id_regiao) REFERENCES REGIAO(id)
    ) ENGINE = InnoDB;

CREATE TABLE
    RAIS (
        id INT NOT NULL AUTO_INCREMENT,
        id_ocupacao INT NOT NULL,
        id_sexo INT NOT NULL,
        id_uf INT NOT NULL,
        ano INT NOT NULL,
        remuneracao_media FLOAT,
        desligamento INT,
        idade INT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (id_ocupacao) REFERENCES OCUPACAO(id),
        FOREIGN KEY (id_sexo) REFERENCES SEXO(id),
        FOREIGN KEY (id_uf) REFERENCES UF(id)
    ) ENGINE = InnoDB;