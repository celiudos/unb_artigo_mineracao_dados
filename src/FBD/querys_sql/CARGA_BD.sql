-- Active: 1684245138463@@127.0.0.1@3306@projfbd

USE projfbd;

-- ============= INSERINDO OS DADOS (CARGA) =========================

INSERT INTO OCUPACAO (id, nome)
VALUES (
        212405,
        'Analista de Desenvolvimento de Sistemas'
    ), (
        317110,
        'Programador de Sistemas de Informacao'
    ), (
        212420,
        'Analista de Suporte Computacional'
    ), (
        317210,
        'Tecnico de Apoio ao Usuario de Informatica (Helpdesk)'
    ), (
        212410,
        'Analista de Redes e de Comunicacao de Dados'
    ), (
        317205,
        'Operador de Computador (Inclusive Microcomputador)'
    ), (
        212315,
        'Administrador de Sistemas Operacionais'
    ), (
        212415,
        'Analista de Sistemas de Automacao'
    ), (
        212310,
        'Administrador de Redes'
    ), (
        212205,
        'Engenheiro de Aplicativos em Computacao'
    ), (
        212305,
        'Administrador de Banco de Dados'
    ), (
        212320,
        'Administrador em Segurança da Informação'
    ), (
        317105,
        'Programador de Internet'
    ), (
        212215,
        'Engenheiros de Sistemas Operacionais em Computacao'
    ), (
        317115,
        'Programador de Maquinas - Ferramenta com Comando Numerico'
    ), (
        317120,
        'Programador de Multimidia'
    ), (
        212210,
        'Engenheiro de Equipamentos em Computacao'
    );

-- ==== TABELA: SEXO

INSERT INTO SEXO (id, nome) VALUES (1, 'Masculino'), (2, 'Feminino');

-- ==== TABELA: REGIAO

INSERT INTO REGIAO (id, nome)
VALUES (3, 'Sudeste'), (4, 'Sul'), (1, 'Nordeste'), (2, 'Norte'), (0, 'Centro-Oeste');

-- ==== TABELA: UF

INSERT INTO
    UF (id, id_regiao, nome)
VALUES (25, 3, 'SP'), (18, 3, 'RJ'), (10, 3, 'MG'), (22, 4, 'RS'), (17, 4, 'PR'), (23, 4, 'SC'), (6, 0, 'DF'), (20, 2, 'RO'), (15, 1, 'PE'), (4, 1, 'BA'), (5, 1, 'CE'), (7, 3, 'ES'), (8, 0, 'GO'), (12, 0, 'MT'), (13, 2, 'PA'), (14, 1, 'PB'), (2, 2, 'AM'), (11, 0, 'MS'), (19, 1, 'RN'), (9, 1, 'MA'), (16, 1, 'PI'), (1, 1, 'AL'), (24, 1, 'SE'), (26, 2, 'TO'), (0, 2, 'AC'), (3, 2, 'AP'), (21, 2, 'RR');

-- ==== TABELA: RAIS (Apenas um exemplo. Pois a carga será feita atravé de um script Python)

-- INSERT INTO
--     RAIS (
--         id_ocupacao,
--         id_sexo,
--         id_uf,
--         ano,
--         remuneracao_media,
--         desligamento,
--         idade
--     )
-- VALUES (212415, 1, 25, 2020, 539.64, 0, 18);