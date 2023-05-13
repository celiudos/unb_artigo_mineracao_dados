/*
DROP VIEW vw_designagere_doc3#full_xml;
DROP VIEW vw_designagere_doc3#full;
DROP VIEW vw_designagere_doc3#xml;
DROP VIEW vw_designagere_doc3;
DROP VIEW vw_designagere_doc2#crg;

DROP TYPE designagere_doc3;
*/

CREATE OR REPLACE TYPE designagere_doc3
AS OBJECT(
    -- REV 002 - solr.views_designagere
    id                          NUMBER(19),
    iddocumento                 NUMBER(19),
    siglasetor_str              VARCHAR2(32),
    idconcentradorlocalizado    NUMBER(19),
    iddesignado                 NUMBER(19),
    nomedesignado_str           VARCHAR2(128),
    dataprevdevdesignacao_dt    VARCHAR2(32),
    idusuarioinclusaodesignacao NUMBER(19),
    idsetorinclusaodesignacao   NUMBER(19),
    sigilo                      NUMBER(1),
    nosetor                     NUMBER,
    situacao_str                VARCHAR2(16))
/

CREATE 
OR REPLACE force VIEW "SOLR"."VW_DESIGNAGERE_DOC2#CRG"(sq, sys_timestamp, id_genero, id_documento, nm_core, tp_atualizacao, obj_log_unico) AS
SELECT 
    rownum            AS sq,
    SYSDATE           AS sys_timestamp,
    docu.id_genero    AS id_genero,
    docu.id_documento AS id_documento,
    'designagere'     AS nm_core,
    'full'            AS tp_atualizacao,
    NULL              AS obj_log_unico
FROM 
    unico.designacao_documento desigdoc
    INNER JOIN unico.documento docu
        ON  docu.id_documento       = desigdoc.id_documento
WHERE desigdoc.dt_fim_periodo IS NULL
    AND 
    ( 
        (docu.id_genero IN(10, 
                           41)
            AND docu.st_envelopado         = 'N'
            AND docu.st_exibir_gerenciador = 'S')
        OR docu.id_genero = 92)
/
COMMENT ON TABLE "SOLR"."VW_DESIGNAGERE_DOC2#CRG" 
IS 
    'REV 001E - solr.views_designagere'
/

CREATE 
OR REPLACE force VIEW "SOLR"."VW_DESIGNAGERE_DOC3"("ID", "IDDOCUMENTO", "SIGLASETOR_STR", "IDCONCENTRADORLOCALIZADO", "IDDESIGNADO", "NOMEDESIGNADO_STR", "DATAPREVDEVDESIGNACAO_DT", "IDUSUARIOINCLUSAODESIGNACAO", "IDSETORINCLUSAODESIGNACAO", "SIGILO", "NOSETOR", "SITUACAO_STR") AS
SELECT 
    desigdoc.id_designacao_documento                                          AS id,
    docu.id_documento                                                         AS iddocumento,
    conc_dedo.sg_concentrador                                                 AS siglasetor_str,
    conc_dedo.id_concentrador                                                 AS idconcentradorlocalizado,
    aut_usu.id_usuario                                                        AS iddesignado,
    pefi_dedo.nome                                                            AS nomedesignado_str,
    TO_CHAR(desigdoc.dt_previsao_devolucao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataprevdevdesignacao_dt,
    desigdoc.id_usuario_inclusao                                              AS idusuarioinclusaodesignacao,
    desigdoc.id_uorg_inclusao                                                 AS idsetorinclusaodesignacao,
    desigdoc.st_sigilosa                                                      AS sigilo,
    CASE 
        WHEN(conc_dedo.id_concentrador = docu.id_concentrador_localizado) 
        THEN 1 
        ELSE 0 
    END AS nosetor,
    CASE
        WHEN desigdoc.dt_fim_periodo IS NULL 
        THEN 'Aberta'
        ELSE 'Finalizada'
    END AS situacao_str
FROM 
    unico.designacao_documento desigdoc
    INNER JOIN unico.documento docu
        ON  docu.id_documento = desigdoc.id_documento
    JOIN unico.concentrador conc_dedo
        ON  conc_dedo.id_unidade_organica = desigdoc.id_uorg_setor_designado
    INNER JOIN corporativo.vinculo vinc_dedo
        ON  vinc_dedo.id_vinculo = desigdoc.id_vinculo
    INNER JOIN corporativo.pessoa_fisica pefi_dedo
        ON  pefi_dedo.id_pessoa = vinc_dedo.id_pessoa
    INNER JOIN autoriza.usuario aut_usu
        ON  aut_usu.id_pessoa_fisica = pefi_dedo.id_pessoa
WHERE docu.id_genero IN(10, 
                        41, 
                        92)
/
COMMENT ON TABLE "SOLR"."VW_DESIGNAGERE_DOC3" 
IS 
    'REV 002A - solr.views_designagere'
/

CREATE OR REPLACE FORCE VIEW "SOLR"."VW_DESIGNAGERE_DOC3#XML" (id, id_documento, xml)
AS
SELECT
    id,
    id AS id_documento,
    XMLELEMENT(
        "DOC",
        designagere_doc3(
            id, iddocumento, siglasetor_str, idconcentradorlocalizado, iddesignado, nomedesignado_str, dataprevdevdesignacao_dt, idusuarioinclusaodesignacao, idsetorinclusaodesignacao, sigilo, nosetor, situacao_str
        )
    ).getclobval() AS xml
  FROM vw_designagere_doc3 doc
/
COMMENT ON TABLE "SOLR"."VW_DESIGNAGERE_DOC3#XML" IS 'REV 002 - solr.views_designagere'
/

CREATE 
OR REPLACE force VIEW "SOLR"."VW_DESIGNAGERE_DOC3#FULL"("SQ", "ID", "IDDOCUMENTO", "SIGLASETOR_STR", "IDCONCENTRADORLOCALIZADO", "IDDESIGNADO", "NOMEDESIGNADO_STR", "DATAPREVDEVDESIGNACAO_DT", "IDUSUARIOINCLUSAODESIGNACAO", "IDSETORINCLUSAODESIGNACAO", "SIGILO", "NOSETOR", "SITUACAO_STR") AS
SELECT 
    tb.sq                                                                     AS sq,
    desigdoc.id_designacao_documento                                          AS id,
    docu.id_documento                                                         AS iddocumento,
    conc_dedo.sg_concentrador                                                 AS siglasetor_str,
    conc_dedo.id_concentrador                                                 AS idconcentradorlocalizado,
    aut_usu.id_usuario                                                        AS iddesignado,
    pefi_dedo.nome                                                            AS nomedesignado_str,
    TO_CHAR(desigdoc.dt_previsao_devolucao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataprevdevdesignacao_dt,
    desigdoc.id_usuario_inclusao                                              AS idusuarioinclusaodesignacao,
    desigdoc.id_uorg_inclusao                                                 AS idsetorinclusaodesignacao,
    desigdoc.st_sigilosa                                                      AS sigilo,
    CASE 
        WHEN(conc_dedo.id_concentrador = docu.id_concentrador_localizado) 
        THEN 1 
        ELSE 0 
    END      AS nosetor,
    'Aberta' AS situacao_str
FROM 
    unico.designacao_documento desigdoc
    INNER JOIN unico.documento docu
        ON  docu.id_documento = desigdoc.id_documento
    JOIN unico.concentrador conc_dedo
        ON  conc_dedo.id_unidade_organica = desigdoc.id_uorg_setor_designado
    INNER JOIN corporativo.vinculo vinc_dedo
        ON  vinc_dedo.id_vinculo = desigdoc.id_vinculo
    INNER JOIN corporativo.pessoa_fisica pefi_dedo
        ON  pefi_dedo.id_pessoa = vinc_dedo.id_pessoa
    INNER JOIN autoriza.usuario aut_usu
        ON  aut_usu.id_pessoa_fisica = pefi_dedo.id_pessoa
    INNER JOIN solr.crg_solr_atualizacao tb
        ON  tb.id_documento = docu.id_documento
WHERE( 
        (docu.id_genero IN(10, 
                           41)
            AND docu.st_envelopado         = 'N'
            AND docu.st_exibir_gerenciador = 'S')
        OR docu.id_genero = 92)
    AND desigdoc.dt_fim_periodo IS NULL
    AND tb.nm_core                    = 'designagere'
    AND tb.tp_atualizacao             = 'full'
/
COMMENT ON TABLE "SOLR"."VW_DESIGNAGERE_DOC3#FULL" 
IS 
    'REV 002A - solr.views_designagere'
/

CREATE OR REPLACE FORCE VIEW "SOLR"."VW_DESIGNAGERE_DOC3#FULL_XML" (sq, xml)
AS
SELECT
    sq,
    XMLELEMENT(
        "DOC",
        designagere_doc3(
            id, iddocumento, siglasetor_str, idconcentradorlocalizado, iddesignado, nomedesignado_str, dataprevdevdesignacao_dt, idusuarioinclusaodesignacao, idsetorinclusaodesignacao, sigilo, nosetor, situacao_str
        )
    ).getclobval() AS xml
  FROM vw_designagere_doc3#full doc
/
COMMENT ON TABLE "SOLR"."VW_DESIGNAGERE_DOC3#FULL_XML" IS 'REV 002 - solr.views_designagere'
/

DROP SYNONYM vw_designagere_doc_atual
/
CREATE SYNONYM vw_designagere_doc_atual FOR solr.vw_designagere_doc3
/

DROP SYNONYM solr.vw_designagere_doc#crg_s
/
CREATE SYNONYM solr.vw_designagere_doc#crg_s FOR solr.vw_designagere_doc2#crg
/

DROP SYNONYM solr.vw_designagere_doc_s
/
CREATE SYNONYM solr.vw_designagere_doc_s FOR solr.vw_designagere_doc3
/

DROP SYNONYM solr.vw_designagere_doc#xml_s
/
CREATE SYNONYM solr.vw_designagere_doc#xml_s FOR solr.vw_designagere_doc3#xml
/

DROP SYNONYM solr.vw_designagere_doc#full_s
/
CREATE SYNONYM solr.vw_designagere_doc#full_s FOR solr.vw_designagere_doc3#full
/

DROP SYNONYM solr.vw_designagere_doc#full_xml_s
/
CREATE SYNONYM solr.vw_designagere_doc#full_xml_s FOR solr.vw_designagere_doc3#full_xml
/

GRANT 
SELECT ON vw_designagere_doc3 TO unico_web
/
GRANT 
SELECT ON vw_designagere_doc3#full_xml TO unico_web
/
GRANT 
SELECT ON vw_designagere_doc3#full TO unico_web
/
GRANT 
SELECT ON vw_designagere_doc3#xml TO unico_web
/
GRANT 
SELECT ON vw_designagere_doc2#crg TO unico_web
/

GRANT 
SELECT ON vw_designagere_doc3 TO rl_unico_r
/
GRANT 
SELECT ON vw_designagere_doc3#full_xml TO rl_unico_r
/
GRANT 
SELECT ON vw_designagere_doc3#full TO rl_unico_r
/
GRANT 
SELECT ON vw_designagere_doc3#xml TO rl_unico_r
/
GRANT 
SELECT ON vw_designagere_doc2#crg TO rl_unico_r
/


GRANT 
EXECUTE ON solr.designagere_doc3 TO unico_web
/
GRANT 
EXECUTE ON solr.designagere_doc3 TO rl_unico_r
/
