-- Active: 1684245138463@@127.0.0.1@3306@projfbd

-- ============= CRIANDO TRIGGER =========================

DELIMITER $$

CREATE TRIGGER IF NOT EXISTS TRIGGER_CHECK_INSERT_EMPREGADO
BEFORE INSERT ON EMPREGADO FOR EACH ROW BEGIN
	IF NEW.idade < 14 THEN SET NEW.idade = 14;
	END IF;
END;

$$

DELIMITER;

-- ======== TESTANDO

INSERT INTO
    EMPREGADO (
        id_ocupacao,
        id_sexo,
        id_uf,
        ano,
        remuneracao_media,
        desligamento,
        idade
    )
VALUES (212205, 1, 11, 2020, 111.11, 0, 11);

SELECT * FROM EMPREGADO WHERE id_ocupacao  = 212205 AND ano = 2020 AND id_sexo = 1 AND remuneracao_media < 112;