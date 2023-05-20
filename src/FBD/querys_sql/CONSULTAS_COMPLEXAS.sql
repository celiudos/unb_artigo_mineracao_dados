-- Active: 1683917892325@@127.0.0.1@3306@projfbd

-- ============= CONSULTAS COMPLEXAS  =========================

-- Exibindo quantidade por ano de cargos por gêneros

SELECT
    ano,
    sexo,
    COUNT(*),
    IF(
        MOD(@rownum := @rownum + 1, 2) = 0,
        NULL,
        @rownum
    ) AS rownum
FROM `VW_EMPREGADO_FULL`
GROUP BY ano, sexo;

-- from the query above set as null each even ROW

-- SELECT ano, sexo, COUNT(*), IF(MOD(@rownum := @rownum + 1, 2) = 0, NULL, @rownum) AS rownum

WITH remun_media AS (
        SELECT
            id_ocupacao,
            COUNT(ano) as qnt
        FROM `EMPREGADO`
        GROUP BY
            ano,
            id_ocupacao
        LIMIT 10
    )
SELECT
    *,
    (
        qnt - LAG(qnt, 1) OVER (PARTITION BY productLine )
    ) as diff
FROM remun_media;

-- Quantidade de cargos por gênero

SELECT
    ocupacao,
    sexo,
    COUNT(id_ocupacao)
FROM `VW_EMPREGADO_FULL`
GROUP BY id_ocupacao, sexo
ORDER BY ocupacao, sexo;

-- Exibindo a remuneração média por região

WITH remun_media AS (
        SELECT
            regiao,
            sexo,
            ROUND(MIN(remuneracao_media), 2) as minimo,
            ROUND(MAX(remuneracao_media), 2) as maximo,
            ROUND(STD(remuneracao_media), 2) as desvio_padrao,
            ROUND(AVG(remuneracao_media), 2) as media
        FROM
            `VW_EMPREGADO_SM`
        WHERE
            remuneracao_media > 0
        GROUP BY
            regiao,
            sexo
    )
SELECT
    *,
    ROUND(
        media - LAG(media, 1) OVER (
            PARTITION BY regiao
            ORDER BY regiao, sexo
        ),
        2
    ) as diff
FROM remun_media
ORDER BY regiao, sexo;

-- Exibindo as quantidades de demissões - ANTES da Pandemia

WITH qnt_desligs AS (
        SELECT
            ano,
            regiao,
            sexo,
            COUNT(desligamento) as qnt_desligamento
        FROM
            `VW_EMPREGADO_FULL`
        WHERE ano < 2020
        GROUP BY
            ano,
            regiao,
            sexo
    )
SELECT
    *,
    ROUND(
        qnt_desligamento - LAG(qnt_desligamento, 1) OVER (
            ORDER BY
                ano,
                regiao,
                sexo
        ),
        2
    ) as diff
FROM qnt_desligs as q
ORDER BY ano, regiao, sexo;

-- Exibindo as quantidades de demissões - DEPOIS da Pandemia

WITH qnt_desligs AS (
        SELECT
            ano,
            regiao,
            sexo,
            COUNT(desligamento) as qnt_desligamento
        FROM
            `VW_EMPREGADO_FULL`
        GROUP BY
            ano,
            regiao,
            sexo
    )
SELECT
    *,
    ROUND(
        qnt_desligamento - LAG(qnt_desligamento, 1) OVER (
            PARTITION BY ano,
            regiao
            ORDER BY
                ano,
                regiao,
                sexo
        ),
        2
    ) as diff_deslig_por_ano
FROM qnt_desligs as q
ORDER BY ano, regiao, sexo;

-- Exibindo as quantidades de demissões com dados acumulativos por ano

WITH qnt_desligs AS (
        SELECT
            ano,
            sexo,
            COUNT(desligamento) as qnt_desligamento
        FROM
            `VW_EMPREGADO_FULL`
        GROUP BY ano, sexo
    )
SELECT
    *,
    ROUND(
        qnt_desligamento + LAG(qnt_desligamento, 1) OVER (
            ORDER BY
                ano,
                sexo
        ),
        2
    ) as cum
FROM qnt_desligs as q
ORDER BY ano, sexo;