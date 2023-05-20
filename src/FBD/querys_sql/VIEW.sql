-- Active: 1683917892325@@127.0.0.1@3306@projfbd

-- ============= CRIANDO VIEW =========================

USE projfbd;

-- Criando view com join da Rais em todas as outras tabelas
DROP VIEW IF EXISTS  `VW_EMPREGADO_FULL`;

CREATE VIEW VW_EMPREGADO_FULL AS
	SELECT
	    e.*,
	    OCUPACAO.nome AS ocupacao,
	    SEXO.nome AS sexo,
	    UF.nome AS uf,
	    REGIAO.nome AS regiao
	FROM EMPREGADO as e
	    INNER JOIN OCUPACAO ON e.id_ocupacao = OCUPACAO.id
	    INNER JOIN SEXO ON e.id_sexo = SEXO.id
	    INNER JOIN UF ON e.id_uf = UF.id
	    INNER JOIN REGIAO ON UF.id_regiao = REGIAO.id -- LIMIT 10;
;
-- Criando view com join da Rais em todas as outras tabelas

DROP VIEW IF EXISTS `VW_EMPREGADO_SM`;
CREATE VIEW VW_EMPREGADO_SM AS
	SELECT
	    e.*,
	    OCUPACAO.nome AS ocupacao,
	    SEXO.nome AS sexo,
	    UF.nome AS uf,
	    REGIAO.nome AS regiao
	FROM EMPREGADO as e
	    INNER JOIN OCUPACAO ON e.id_ocupacao = OCUPACAO.id
	    INNER JOIN SEXO ON e.id_sexo = SEXO.id
	    INNER JOIN UF ON e.id_uf = UF.id
	    INNER JOIN REGIAO ON UF.id_regiao = REGIAO.id
      LIMIT 500000;
;