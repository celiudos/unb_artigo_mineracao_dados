-- Active: 1684245138463@@127.0.0.1@3306@projfbd

-- ============= CONSULTAS COMPLEXAS  =========================

-- Exibindo quantidade por ano de cargos por gêneros

SELECT ano, sexo, COUNT(*)
FROM `VW_EMPREGADO_FULL`
GROUP BY ano, sexo;

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
            ROUND(AVG(remuneracao_media), 2) as media,
            ROUND(MIN(remuneracao_media), 2) as minimo,
            ROUND(MAX(remuneracao_media), 2) as maximo,
            ROUND(STD(remuneracao_media), 2) as desvio_padrao
        FROM
            `VW_EMPREGADO_FULL`
        WHERE
            remuneracao_media > 0
        GROUP BY
            regiao,
            sexo
    )
SELECT
    *,
    ROUND(
        desvio_padrao - LAG(desvio_padrao, 1) OVER (
            ORDER BY
                regiao,
                sexo
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
        WHERE ano >= 2020
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