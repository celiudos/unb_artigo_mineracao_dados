# Artigo de Minieração de Dados (Marcelo Ladeira)

# Instalar

- Utilizar o VSCode e instalar os plugins da opção "Recomendado"
- Instalar a imagem do Dockerfile

# Conhecimento

- Ideia para FBD -> Comparação com WITH e SEM WITH
- Curiosidade: Se utilizar a query SQL com 1.000 registros, então um CSV pesa...
  -- FULL com texto: 103 KB
  -- SIMPES sem texto: 30 KB (100.000 -> 2.8 MB)

## Links

- [Google BigQuery](https://console.cloud.google.com/bigquery?p=basedosdados&d=br_me_rais&t=microdados_vinculos&page=table)
- [CNAE](https://concla.ibge.gov.br/documentacao/cronologia/204-concla/classificacao/por-tema/1365-cnae-2-0.html)
- [CNAE - 620](https://concla.ibge.gov.br/busca-online-cnae.html?view=grupo&tipo=cnae&versao=5&grupo=620)
- [CNAE - 631](https://concla.ibge.gov.br/busca-online-cnae.html?view=grupo&tipo=cnae&versao=5&grupo=631)
- [Agrupando categorias BD](https://ice-panda.medium.com/how-to-get-the-first-row-from-each-group-with-the-maximum-value-of-a-particular-column-in-bigquery-92fadc830a06)

## Dica do irmão da Luciana (Jevuks Matheus - Pós Dr. Economia UFPB)

Pega logo os dicionários... veja os dicionários...ai só puxa da base o que interessar
Pode ecrever um pouco sobre discriminaçao de gênero no mercado de trabalho, a gente poderia escrever sobre a estrutura no setor de TI no Brasil e podiamos tentar responder a questao pra saber se há discriminacao de genero no setor de trabalho de TI.

Uma outra linha, seria verificar a diferenca salarial nao só de genero, mas tb entre setor publico e privado na área de TI e falar um pouco sobre o apagão na área de TI no setor público...

## Dissertação - 2014_MárioHenriquePaesVieira - Indicação Marcelo Ladeira.pdf

Página 6 - O objetivo desta pesquisa é analisar, via técnicas de mineração de dados, 2 perfis que visam melhoria da gestão do programa:

1. a fidelidade das pessoas físicas ao programa

- Enquanto o perfil de fidelidade leva em conta a variação do tempo sobre as pessoas físicas participantes e propõe indicadores para avaliação do programa

2. a obtenção de créditos de consumo pelos beneficiários.

- o perfil de créditos analisa a distribuição dos créditos entre os consumidores

A metodologia CRISP-DM é utilizada e ao longo de suas fases é realizada a integração do banco de dados do PNL com outras bases de dados existentes na SEF.
Para melhoria da qualidade da informação, são removidos ruídos, missing values e outliers.
Estatística é utilizada para extração do conhecimento gerado sobre os perfis desejados.

## Artigo - PROFISSIONAIS DE TI NO NORDESTE EM UM CONTEXTO DE CRISE PROLONGADA.pdf

Página 6 - Utilizamos cinco códigos da Classificação Brasileira de Ocupações (CBO):

- engenheiros em computação - desenvolvedores de software (2122)
- especialistas em informática (2123)
- analistas de sistemas (2124)
- técnicos em programação (3171)
- e técnicos em operação de computadores (3172)

A análise tem como base os dados da Rais, o que implica em focar nos assalariados formais.
Esses profissionais se encontram, sobretudo, concentrados nos Grupos da CNAE

- 620 ("Atividades dos serviços de tecnologia da informação")
- 631 ("Tratamen-to de dados, hospedagem na Internet e outras atividades relacionadas")

# Escopo

[RAIS_vinculos_layout2020.xls](C:\Users\marce\OneDrive\Mineração de Dados\RAIS\Layouts\vínculos)

CNAE

- Aba: subclasse 2.0, Linha 1007

6201500: Desenvolvimento de Programas de Computador Sob Encomenda
6202300: Desenvolvimento e Licenciamento de Programas de Computador Customizáveis
6203100: Desenvolvimento e Licenciamento de Programas de Computador Não-Customizáveis
6204000: Consultoria em Tecnologia da Informação
6209100: Suporte Técnico, Manutenção e Outros Serviços em Tecnologia da Informação
6311900: Tratamento de Dados, Provedores de Serviços de Aplicação e Serviços de Hospedagem na Internet

CBO

- Aba: ocupação, Linha 162

212205: Engenheiro de Aplicativos em Computacao
212210: Engenheiro de Equipamentos em Computacao
212215: Engenheiros de Sistemas Operacionais em Computacao

212305: Administrador de Banco de Dados
212310: Administrador de Redes
212315: Administrador de Sistemas Operacionais
212320: Administrador em Segurança da Informação

212405: Analista de Desenvolvimento de Sistemas
212410: Analista de Redes e de Comunicacao de Dados
212415: Analista de Sistemas de Automacao
212420: Analista de Suporte Computacional

317105: Programador de Internet
317110: Programador de Sistemas de Informacao
317115: Programador de Maquinas - Ferramenta com Comando Numerico
317120: Programador de Multimidia

317205: Operador de Computador (Inclusive Microcomputador)
317210: Tecnico de Apoio ao Usuario de Informatica (Helpdesk)

# Dados

## Hipótese 1: profissionais de TI durante a COVID (2019-2020/ 2020-2021) em relação a salário no Brasil

- Ano: 2019-2020
- Profissão: TI, 2122, 2123, 2124, 3171, 3172
- Abrangência: Brasil
- Alvo: salário

### SQL

```sql

WITH vin AS
(

  SELECT cbo_2002, ano, sigla_uf, valor_remuneracao_media, idade, sexo, raca_cor
  FROM `basedosdados.br_me_rais.microdados_vinculos`

  -- IDS DOS PROFISSIONAIS DE TI
  WHERE cbo_2002 IN ("212205", "212210", "212215", "212305", "212310", "212315", "212320", "212405", "212410", "212415", "212420", "317105", "317110", "317115", "317120", "317205", "317210")

  AND ano IN (2019, 2020)
),

cbo_sin AS
(
  WITH ordered_sinonimo as (
    SELECT
    cbo_2002,
    sinonimo,
    ROW_NUMBER() OVER (PARTITION BY cbo_2002 ORDER BY cbo_2002) as rank
    FROM `basedosdados.br_ibge_cbo_2002.sinonimo`

    -- IDS DOS PROFISSIONAIS DE TI
    WHERE cbo_2002 IN ("212205", "212210", "212215", "212305", "212310", "212315", "212320", "212405", "212410", "212415", "212420", "317105", "317110", "317115", "317120", "317205", "317210")
  )
  SELECT cbo_2002, sinonimo FROM ordered_sinonimo

  -- SELECIONANDO A 1º opção dos sinônimos
  WHERE rank = 1
),

dic_sexo AS
(
  SELECT chave, valor
  FROM `basedosdados.br_me_rais.dicionario`
  WHERE id_tabela = "microdados_vinculos"
  AND nome_coluna = "sexo"
),

dic_raca_cor AS
(
  SELECT chave, valor
  FROM `basedosdados.br_me_rais.dicionario`
  WHERE id_tabela = "microdados_vinculos"
  AND nome_coluna = "raca_cor"
)

SELECT

-- CONTAGEM DE LINHAS
-- COUNT(*)

-- COLUNAS COM INFORMAÇÕES PRIMÁRIAS
vin.ano, vin.sigla_uf,

-- COLUNAS COM INFORMAÇÕES SECUNDÁRIAS
vin.valor_remuneracao_media, vin.idade,

-- COLUNAS COM INFORMAÇÕES CRUZADAS
cbo_sin.cbo_2002 as ocupacao_id,
cbo_sin.sinonimo as ocupacao,

dic_sexo.chave as sexo_id,
dic_sexo.valor as sexo,

dic_raca_cor.chave as raca_cor_id,
dic_raca_cor.valor as raca_cor,

FROM vin

LEFT JOIN cbo_sin
ON vin.cbo_2002 = cbo_sin.cbo_2002

LEFT JOIN dic_sexo
ON vin.sexo = dic_sexo.chave

LEFT JOIN dic_raca_cor
ON vin.raca_cor = dic_raca_cor.chave

LIMIT 100

```

=======

Simples

```sql

SELECT

-- CONTAGEM DE LINHAS
-- COUNT(*)

-- COLUNAS COM INFORMAÇÕES PRIMÁRIAS
vin.ano, vin.sigla_uf,

-- COLUNAS COM INFORMAÇÕES SECUNDÁRIAS
vin.valor_remuneracao_media, vin.idade,
vin.cbo_2002 as ocupacao_id,
vin.sexo as sexo_id,
vin.raca_cor as raca_cor_id

FROM `basedosdados.br_me_rais.microdados_vinculos` as vin

-- IDS DOS PROFISSIONAIS DE TI
WHERE vin.cbo_2002 IN ("212205", "212210", "212215", "212305", "212310", "212315", "212320", "212405", "212410", "212415", "212420", "317105", "317110", "317115", "317120", "317205", "317210")

AND vin.ano IN (2019, 2020)

LIMIT 100

```
