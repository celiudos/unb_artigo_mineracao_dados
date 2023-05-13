/*
DROP VIEW solr.vw_distgere_doc4#full_xml;
DROP VIEW solr.vw_distgere_doc4#full;
DROP VIEW solr.vw_distgere_doc4#xml;
DROP VIEW solr.vw_distgere_doc4;
DROP VIEW solr.vw_distgere_doc2#crg;

DROP TYPE distgere_doc4;
*/

CREATE
OR REPLACE TYPE distgere_doc4
AS OBJECT(
    -- REV 001 - solr.views_distgere
    id	                         NUMBER(19),
    iddocumento	                 NUMBER(19),
    idunidadeorganicamacro       NUMBER(19),
    nomeunidadeorganicamacro_str VARCHAR2(60),
    idoficio                     NUMBER(19),
    nomeoficio_str	             VARCHAR2(4000),
    idtipovinculo	             NUMBER(19),
    nometipovinculo_str	         VARCHAR2(100),
    aberta                       NUMBER)
/

CREATE
OR REPLACE force VIEW "SOLR"."VW_DISTGERE_DOC2#CRG"("SQ", "SYS_TIMESTAMP", "ID_GENERO", "ID_DOCUMENTO", "NM_CORE", "TP_ATUALIZACAO", "OBJ_LOG_UNICO") AS
SELECT
    rownum            AS sq,
    SYSDATE           AS sys_timestamp,
    docu.id_genero    AS id_genero,
    docu.id_documento AS id_documento,
    'distgere'        AS nm_core,
    'full'            AS tp_atualizacao,
    NULL              AS obj_log_unico
FROM
    unico.distribuicao_nova    dino
    INNER JOIN unico.documento docu
        ON  docu.id_documento        = dino.id_documento_distribuido
WHERE dino.dt_fim_distribuicao IS NULL
    AND
    (
        (docu.id_genero IN(10,
                           41)
            AND docu.st_envelopado         = 'N'
            AND docu.st_exibir_gerenciador = 'S')
        OR docu.id_genero = 92)
/
COMMENT ON TABLE "SOLR"."VW_DISTGERE_DOC2#CRG"
IS
    'REV 001C - solr.views_distgere'
/

CREATE
OR REPLACE force VIEW "SOLR"."VW_DISTGERE_DOC4"("ID", "IDDOCUMENTO", "IDUNIDADEORGANICAMACRO", "NOMEUNIDADEORGANICAMACRO_STR", "IDOFICIO", "NOMEOFICIO_STR", "IDTIPOVINCULO", "NOMETIPOVINCULO_STR", "ABERTA") AS
SELECT
    dino.id_distribuicao           AS id,
    dino.id_documento_distribuido  AS iddocumento,
    unor.id_unidade_organica_macro AS idunidadeorganicamacro,
    unma.nome                      AS nomeunidadeorganicamacro_str,
    dino.id_oficio                 AS idoficio,
    solr.pkg_solr.fnc_limpar_caracter(ofic.nm_oficio ||
        nvl2(pefi.nome, ' - '                        ||
        regexp_replace(pefi.nome, '(^| )([^ ])([^ ])*', '\2'), '')) AS nomeoficio_str,
    dino.id_tipo_vinculo                                            AS idtipovinculo,
    tivi.nm_tipo_vinculo                                            AS nometipovinculo_str,
    nvl2(dino.dt_fim_distribuicao, 0, 1)                            AS aberta
FROM
    unico.distribuicao_nova       dino
    INNER JOIN unico.tipo_vinculo tivi
        ON  tivi.id_tipo_vinculo = dino.id_tipo_vinculo
    INNER JOIN unico.documento docu
        ON  docu.id_documento = dino.id_documento_distribuido
    INNER JOIN unico.oficio ofic
        ON  ofic.id_oficio = dino.id_oficio
    LEFT JOIN corporativo.unidade_organica unor
        ON  unor.id_unidade_organica = ofic.id_uorg_procuradoria
    LEFT JOIN corporativo.unidade_organica unma
        ON  unma.id_unidade_organica = unor.id_unidade_organica_macro
    LEFT JOIN unico.titular_oficio tiof
        ON  tiof.id_oficio                = ofic.id_oficio
            AND tiof.dt_fim_periodo IS NULL
    LEFT JOIN corporativo.vinculo vinc
        ON  vinc.id_vinculo = tiof.id_vinculo_titular
    LEFT JOIN corporativo.pessoa_fisica pefi
        ON  pefi.id_pessoa = vinc.id_pessoa
WHERE docu.id_genero IN(10,
                        41,
                        92)
/
COMMENT ON TABLE "SOLR"."VW_DISTGERE_DOC4"
IS
    'REV 001 - solr.views_distgere'
/

CREATE OR REPLACE FORCE VIEW "SOLR"."VW_DISTGERE_DOC4#XML" ("ID", "ID_DOCUMENTO", "XML") AS 
SELECT
    id,
    id AS id_documento,
    XMLELEMENT(
        "DOC",
        distgere_doc4(
            id, iddocumento, idunidadeorganicamacro, nomeunidadeorganicamacro_str, idoficio, nomeoficio_str, idtipovinculo, nometipovinculo_str, aberta
        )
    ).getclobval() AS xml
  FROM vw_distgere_doc4 doc
/
COMMENT ON TABLE "SOLR"."VW_DISTGERE_DOC4#XML"
IS
    'REV 001 - solr.views_distgere'
/

CREATE
OR REPLACE force VIEW "SOLR"."VW_DISTGERE_DOC4#FULL"("SQ", "ID", "IDDOCUMENTO", "IDUNIDADEORGANICAMACRO", "NOMEUNIDADEORGANICAMACRO_STR", "IDOFICIO", "NOMEOFICIO_STR", "IDTIPOVINCULO", "NOMETIPOVINCULO_STR", "ABERTA") AS
SELECT
    tb.sq                          AS sq,
    dino.id_distribuicao           AS id,
    dino.id_documento_distribuido  AS iddocumento,
    unor.id_unidade_organica_macro AS idunidadeorganicamacro,
    unma.nome                      AS nomeunidadeorganicamacro_str,
    dino.id_oficio                 AS idoficio,
    solr.pkg_solr.fnc_limpar_caracter(ofic.nm_oficio ||
        nvl2(pefi.nome, ' - '                        ||
        regexp_replace(pefi.nome, '(^| )([^ ])([^ ])*', '\2'), '')) AS nomeoficio_str,
    dino.id_tipo_vinculo                                            AS idtipovinculo,
    tivi.nm_tipo_vinculo                                            AS nometipovinculo_str,
    1                                                               AS aberta
FROM
    unico.distribuicao_nova       dino
    INNER JOIN unico.tipo_vinculo tivi
        ON  tivi.id_tipo_vinculo = dino.id_tipo_vinculo
    INNER JOIN unico.documento docu
        ON  docu.id_documento = dino.id_documento_distribuido
    INNER JOIN unico.oficio ofic
        ON  ofic.id_oficio = dino.id_oficio
    LEFT JOIN corporativo.unidade_organica unor
        ON  unor.id_unidade_organica = ofic.id_uorg_procuradoria
    LEFT JOIN corporativo.unidade_organica unma
        ON  unma.id_unidade_organica = unor.id_unidade_organica_macro
    LEFT JOIN unico.titular_oficio tiof
        ON  tiof.id_oficio                = ofic.id_oficio
            AND tiof.dt_fim_periodo IS NULL
    LEFT JOIN corporativo.vinculo vinc
        ON  vinc.id_vinculo = tiof.id_vinculo_titular
    LEFT JOIN corporativo.pessoa_fisica pefi
        ON  pefi.id_pessoa = vinc.id_pessoa
    INNER JOIN solr.crg_solr_atualizacao tb
        ON  tb.id_documento = dino.id_documento_distribuido
WHERE(
        (docu.id_genero IN(10,
                           41)
            AND docu.st_envelopado         = 'N'
            AND docu.st_exibir_gerenciador = 'S')
        OR docu.id_genero = 92)
    AND dino.dt_fim_distribuicao IS NULL
    AND tb.nm_core                     = 'distgere'
    AND tp_atualizacao                 = 'full'
/
COMMENT ON TABLE "SOLR"."VW_DISTGERE_DOC4#FULL"
IS
    'REV 001 - solr.views_distgere'
/

CREATE OR REPLACE FORCE VIEW "SOLR"."VW_DISTGERE_DOC4#FULL_XML" ("SQ", "XML") AS 
SELECT
    sq,
    XMLELEMENT(
        "DOC",
        distgere_doc4(
            id, iddocumento, idunidadeorganicamacro, nomeunidadeorganicamacro_str, idoficio, nomeoficio_str, idtipovinculo, nometipovinculo_str, aberta
        )
    ).getclobval() AS xml
  FROM vw_distgere_doc4#full doc;
/
COMMENT ON TABLE "SOLR"."VW_DISTGERE_DOC4#FULL_XML"
IS
    'REV 001 - solr.views_distgere'
/

DROP SYNONYM vw_distgere_doc_atual
/
CREATE SYNONYM vw_distgere_doc_atual FOR solr.vw_distgere_doc4
/

DROP SYNONYM solr.vw_distgere_doc#crg_s
/
CREATE SYNONYM solr.vw_distgere_doc#crg_s FOR solr.vw_distgere_doc2#crg
/

DROP SYNONYM solr.vw_distgere_doc_s
/
CREATE SYNONYM solr.vw_distgere_doc_s FOR solr.vw_distgere_doc4
/

DROP SYNONYM solr.vw_distgere_doc#xml_s
/
CREATE SYNONYM solr.vw_distgere_doc#xml_s FOR solr.vw_distgere_doc4#xml
/

DROP SYNONYM solr.vw_distgere_doc#full_s
/
CREATE SYNONYM solr.vw_distgere_doc#full_s FOR solr.vw_distgere_doc4#full
/

DROP SYNONYM solr.vw_distgere_doc#full_xml_s
/
CREATE SYNONYM solr.vw_distgere_doc#full_xml_s FOR solr.vw_distgere_doc4#full_xml
/

GRANT 
SELECT ON solr.vw_distgere_doc4 TO unico_web
/
GRANT 
SELECT ON solr.vw_distgere_doc4#full_xml TO unico_web
/
GRANT 
SELECT ON solr.vw_distgere_doc4#full TO unico_web
/
GRANT 
SELECT ON solr.vw_distgere_doc4#xml TO unico_web
/
GRANT 
SELECT ON solr.vw_distgere_doc2#crg TO unico_web
/

GRANT 
SELECT ON solr.vw_distgere_doc4 TO rl_unico_r
/
GRANT 
SELECT ON solr.vw_distgere_doc4#full_xml TO rl_unico_r
/
GRANT 
SELECT ON solr.vw_distgere_doc4#full TO rl_unico_r
/
GRANT 
SELECT ON solr.vw_distgere_doc4#xml TO rl_unico_r
/
GRANT 
SELECT ON solr.vw_distgere_doc2#crg TO rl_unico_r
/

GRANT 
EXECUTE ON distgere_doc4 TO unico_web
/
GRANT 
EXECUTE ON distgere_doc4 TO rl_unico_r
/
