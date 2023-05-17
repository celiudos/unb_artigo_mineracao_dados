-- Active: 1684245138463@@127.0.0.1@3306@projfbd

-- ============= CRIANDO TRIGGER =========================

DELIMITER $$
CREATE TRIGGER
    TRIGGER_CHECK_INSERT_RAIS BEFORE INSERT ON RAIS
    FOR EACH ROW
    BEGIN
      IF NEW.idade < 14 THEN
        SET NEW.idade = 14;
      END IF;
    END;
$$
DELIMITER;

-- ======== TESTANDO

-- INSERT INTO
--     RAIS (
--         id_ocupacao,
--         id_sexo,
--         id_uf,
--         ano,
--         remuneracao_media,
--         desligamento,
--         idade
--         -- ocupacao,
--         -- sexo,
--         -- uf,
--         -- regiao
--     )
-- VALUES (
--         212205,
--         1,
--         11,
--         2020,
--         111.11,
--         0,
--         11
--         -- 'Engenheiro de Aplicativos em Computacao',
--         -- 'Masculino',
--         -- 'MS',
--         -- 'Centro-Oeste'
--     );