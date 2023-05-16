-- Active: 1684245138463@@127.0.0.1@3306@projfbd

-- ============= CRIANDO PROCEDURE =========================

-- Criando view com join da Rais em todas as outras tabelas

DROP VIEW `RAIS_FULL`;

CREATE VIEW RAIS_FULL AS
	SELECT
	    r.*,
	    OCUPACAO.nome AS ocupacao,
	    SEXO.nome AS sexo,
	    UF.nome AS uf,
	    REGIAO.nome AS regiao
	FROM RAIS as r
	    INNER JOIN OCUPACAO ON r.id_ocupacao = OCUPACAO.id
	    INNER JOIN SEXO ON r.id_sexo = SEXO.id
	    INNER JOIN UF ON r.id_uf = UF.id
	    INNER JOIN REGIAO ON UF.id_regiao = REGIAO.id -- LIMIT 10;
;