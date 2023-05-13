/*
DROP VIEW vw_gerenciador_doc07#full_xml;
DROP VIEW vw_gerenciador_doc07#full;
DROP VIEW vw_gerenciador_doc07#xml;
DROP VIEW vw_gerenciador_doc07_92#xml;
DROP VIEW vw_gerenciador_doc07_41#xml;
DROP VIEW vw_gerenciador_doc07_10#xml;
DROP VIEW vw_gerenciador_doc07;
DROP VIEW vw_gerenciador_doc07_92;
DROP VIEW vw_gerenciador_doc07_41;
DROP VIEW vw_gerenciador_doc07_10;
DROP VIEW vw_gerenciador_doc07#crg;

DROP VIEW vw_gerenciador_doc07_designa;
DROP VIEW vw_gerenciador_doc07_ofictitu;
DROP VIEW vw_gerenciador_doc07_rotulo;
DROP VIEW vw_gerenciador_doc07_visipess;
DROP VIEW vw_gerenciador_doc07_visisetr;
DROP VIEW vw_gerenciador_doc07_aviso;
DROP VIEW vw_gerenciador_doc07_notaexp;

DROP TYPE gerenciador_doc07;
DROP TYPE gerenciador_doc07_visipess_tb;
DROP TYPE gerenciador_doc07_visipess;
DROP TYPE gerenciador_doc07_visisetr_tb;
DROP TYPE gerenciador_doc07_visisetr;
DROP TYPE gerenciador_doc07_rotulo_tb;
DROP TYPE gerenciador_doc07_rotulo;
DROP TYPE gerenciador_doc07_designa_tb;
DROP TYPE gerenciador_doc07_designa;
DROP TYPE gerenciador_doc07_ofictitu_tb;
DROP TYPE gerenciador_doc07_ofictitu;
DROP TYPE gerenciador_doc07_aviso_tb;
DROP TYPE gerenciador_doc07_aviso;
DROP TYPE gerenciador_doc07_notaexp_tb;
DROP TYPE gerenciador_doc07_notaexp;

DROP SYNONYM solr.vw_gerenciador_doc#crg_s;
DROP SYNONYM solr.vw_gerenciador_doc_visipess_s;
DROP SYNONYM solr.vw_gerenciador_doc_visisetr_s;
DROP SYNONYM solr.vw_gerenciador_doc_rotulo_s;
DROP SYNONYM solr.vw_gerenciador_doc_designa_s;
DROP SYNONYM solr.vw_gerenciador_doc_ofictitu_s;
DROP SYNONYM solr.vw_gerenciador_doc_aviso_s;
DROP SYNONYM solr.vw_gerenciador_doc_notaexp_s;
DROP SYNONYM solr.vw_gerenciador_doc_s;
DROP SYNONYM solr.vw_gerenciador_doc#xml_s;
DROP SYNONYM solr.vw_gerenciador_doc#full_s;
DROP SYNONYM solr.vw_gerenciador_doc#full_xml_s;
*/

/*
Tabelas de dependência - Gerenciador, gênero 10:

- UNICO.ANOTACAO                   - c/ trigger (vw_gerenciador_doc07_10)
- UNICO.AUTO_ADMINISTRATIVO        - c/ trigger (vw_gerenciador_doc07_10)
- UNICO.CONTROLE_PRAZO_FINALIZACAO - c/ trigger (vw_gerenciador_doc07_10)
- UNICO.DESIGNACAO_DOCUMENTO       - c/ trigger (views auxiliares)
- UNICO.DISTRIBUICAO_NOVA          - c/ trigger (vw_gerenciador_doc07_10  e views auxiliares)
- UNICO.DOCUMENTO                  - c/ trigger (vw_gerenciador_doc07_10  e views auxiliares)
- UNICO.ITEM_CNMP_DOCUMENTO        - c/ trigger (vw_gerenciador_doc07_10)
- UNICO.NOTA_EXPEDIENTE            - c/ trigger (views auxiliares)
- UNICO.ROTULO_DOCUMENTO           - c/ trigger (views auxiliares)
- UNICO.VISIBILIDADE               - c/ trigger (views auxiliares)

- CORPORATIVO.PESSOA_FISICA        - s/ trigger (vw_gerenciador_doc07_10  e views auxiliares)
- CORPORATIVO.UNIDADE_ORGANICA     - s/ trigger (vw_gerenciador_doc07_10)
- CORPORATIVO.VINCULO              - s/ trigger (vw_gerenciador_doc07_10  e views auxiliares)
- PCPE.INTEGRACAO                  - s/ trigger (views auxiliares)
- SOLR.AGG_MINUTA_JUNTADA          - s/ trigger (vw_gerenciador_doc07_10)
- UNICO.AREA_ATUACAO               - s/ trigger (vw_gerenciador_doc07_10)
- UNICO.COMPLEMENTO_SITUACAO_AE    - s/ trigger (vw_gerenciador_doc07_10)
- UNICO.GENERO                     - s/ trigger (vw_gerenciador_doc07_10)
- UNICO.HISTORICO_SITUACAO_AE      - s/ trigger (vw_gerenciador_doc07_10)
- UNICO.ITEM_CNMP                  - s/ trigger (vw_gerenciador_doc07_10)
- UNICO.OFICIO                     - s/ trigger (vw_gerenciador_doc07_10  e views auxiliares)
- UNICO.ORGAO_GOVERNO              - s/ trigger (views auxiliares)
- UNICO.ROTULO                     - s/ trigger (views auxiliares)
- UNICO.ROTULO_UNIDADE             - s/ trigger (views auxiliares)
- UNICO.TIPO_CLASSE_CNMP           - s/ trigger (vw_gerenciador_doc07_10)
- UNICO.TIPO_NATUREZA              - s/ trigger (vw_gerenciador_doc07_10)
- UNICO.TIPO_SITUACAO_AE           - s/ trigger (vw_gerenciador_doc07_10)
- UNICO.TIPO_VINCULO               - s/ trigger (vw_gerenciador_doc07_10)
- UNICO.TITULAR_OFICIO             - s/ trigger (vw_gerenciador_doc07_10  e views auxiliares)

- ignorar UNICO.CONCENTRADOR       - c/ trigger (vw_gerenciador_doc07_10  e views auxiliares) - ignorar, pois não grava ID_DOCUMENTO
- ignorar UNICO.MOVIMENTACAO       - c/ trigger (vw_gerenciador_doc07_10) - ignorar, pois grava como se fosse alteração em DOCUMENTO, a partir de SELECT em UNICO.REFERENCIA_NOVA e UNICO.DOCUMENTO

- Baseado nas dependências acima, o SELECT básico na SOLR.SOLR_UNICO_LOG2 ficaria (observar que todas as tabelas são do owner 'UNICO'):
  SELECT *
    FROM solr.solr_unico_log2 l
   WHERE l.type         IN ( 'I', 'U' )
     AND l.id_genero    = 10
     AND l.id_documento IS NOT NULL
     AND l.owner        = 'UNICO'
     AND l.table_name   IN ('ANOTACAO', 'AUTO_ADMINISTRATIVO', 'CONTROLE_PRAZO_FINALIZACAO', 'DESIGNACAO_DOCUMENTO', 'DISTRIBUICAO_NOVA', 'DOCUMENTO', 'ITEM_CNMP_DOCUMENTO', 'NOTA_EXPEDIENTE', 'ROTULO_DOCUMENTO', 'VISIBILIDADE')

Tabelas de dependência - Gerenciador, gênero 41:

- UNICO.ANOTACAO                 - c/ trigger (vw_gerenciador_doc07_41)
- UNICO.DESIGNACAO_DOCUMENTO     - c/ trigger (views auxiliares)
- UNICO.DISTRIBUICAO_NOVA        - c/ trigger (views auxiliares)
- UNICO.DOCUMENTO                - c/ trigger (vw_gerenciador_doc07_41  e views auxiliares)
- UNICO.DOCUMENTO_ADMINISTRATIVO - c/ trigger (vw_gerenciador_doc07_41)
- UNICO.NOTA_EXPEDIENTE          - c/ trigger (views auxiliares)
- UNICO.ROTULO_DOCUMENTO         - c/ trigger (views auxiliares)
- UNICO.VISIBILIDADE             - c/ trigger (views auxiliares)

- CORPORATIVO.PESSOA_FISICA      - s/ trigger (views auxiliares)
- CORPORATIVO.VINCULO            - s/ trigger (views auxiliares)
- PCPE.INTEGRACAO                - s/ trigger (views auxiliares)
- SOLR.AGG_MINUTA_JUNTADA        - s/ trigger (vw_gerenciador_doc07_41)
- UNICO.ASSUNTO                  - s/ trigger (vw_gerenciador_doc07_41)
- UNICO.GENERO                   - s/ trigger (vw_gerenciador_doc07_41)
- UNICO.OFICIO                   - s/ trigger (views auxiliares)
- UNICO.ORGAO_GOVERNO            - s/ trigger (views auxiliares)
- UNICO.ROTULO                   - s/ trigger (views auxiliares)
- UNICO.ROTULO_UNIDADE           - s/ trigger (views auxiliares)
- UNICO.TIPO_DOCUMENTO           - s/ trigger (vw_gerenciador_doc07_41)
- UNICO.TITULAR_OFICIO           - s/ trigger (views auxiliares)

- ignorar UNICO.CONCENTRADOR     - c/ trigger (vw_gerenciador_doc07_41  e views auxiliares) - ignorar, pois não grava ID_DOCUMENTO
- ignorar UNICO.MOVIMENTACAO     - c/ trigger (vw_gerenciador_doc07_41) - ignorar, pois grava como se fosse alteração em DOCUMENTO, a partir de SELECT em UNICO.REFERENCIA_NOVA e UNICO.DOCUMENTO

- Baseado nas dependências acima, o SELECT básico na SOLR.SOLR_UNICO_LOG2 ficaria (observar que todas as tabelas são do owner 'UNICO'):
  SELECT *
    FROM solr.solr_unico_log2 l
   WHERE l.type         IN ( 'I', 'U' )
     AND l.id_genero    = 41
     AND l.id_documento IS NOT NULL
     AND l.owner        = 'UNICO'
     AND l.table_name   IN ('ANOTACAO', 'DESIGNACAO_DOCUMENTO', 'DISTRIBUICAO_NOVA', 'DOCUMENTO', 'DOCUMENTO_ADMINISTRATIVO', 'NOTA_EXPEDIENTE', 'ROTULO_DOCUMENTO', 'VISIBILIDADE')

Tabelas de dependência - Gerenciador, gênero 92:

- PCPE.AVISO_COMUNICACAO           - c/ trigger (views auxiliares)
- UNICO.ANOTACAO                   - c/ trigger (vw_gerenciador_doc07_92)
- UNICO.AUTUACAO                   - c/ trigger (vw_gerenciador_doc07_92)
- UNICO.CLASSIFICACAO_PROCESSO     - c/ trigger (vw_gerenciador_doc07_92)
- UNICO.DESIGNACAO_DOCUMENTO       - c/ trigger (views auxiliares)
- UNICO.DISTRIBUICAO_NOVA          - c/ trigger (vw_gerenciador_doc07_92 e views auxiliares)
- UNICO.DOCUMENTO                  - c/ trigger (vw_gerenciador_doc07_92 e views auxiliares)
- UNICO.ENTRADA_PROCURADORIA       - c/ trigger (vw_gerenciador_doc07_92)
- UNICO.IPL_TCO                    - c/ trigger (vw_gerenciador_doc07_92)
- UNICO.IPL_TCO_MANI_DILACAO_PRAZO - c/ trigger (vw_gerenciador_doc07_92)
- UNICO.ITEM_CNMP_DOCUMENTO        - c/ trigger (vw_gerenciador_doc07_92)
- UNICO.NOTA_EXPEDIENTE            - c/ trigger (views auxiliares)
- UNICO.PROCESSO_JUDICIAL          - c/ trigger (vw_gerenciador_doc07_92)
- UNICO.REFERENCIA_NOVA            - c/ trigger (vw_gerenciador_doc07_92)
- UNICO.ROTULO_DOCUMENTO           - c/ trigger (views auxiliares)
- UNICO.VISIBILIDADE               - c/ trigger (views auxiliares)

- CORPORATIVO.ESTADO               - s/ trigger (vw_gerenciador_doc07_92)
- CORPORATIVO.MUNICIPIO            - s/ trigger (vw_gerenciador_doc07_92)
- CORPORATIVO.PESSOA_FISICA        - s/ trigger (views auxiliares)
- CORPORATIVO.UNIDADE_ORGANICA     - s/ trigger (vw_gerenciador_doc07_92)
- CORPORATIVO.VINCULO              - s/ trigger (views auxiliares)
- PCPE.INTEGRACAO                  - s/ trigger (views auxiliares)
- SOLR.AGG_AVISO_COMUNICACAO       - s/ trigger (vw_gerenciador_doc07_92)
- SOLR.AGG_IDOSOS_E_REUS_PRESOS    - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.AREA_ATUACAO               - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.CLASSE_JUDICIARIA          - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.COMPLEMENTO_ENTRADA        - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.DETALHAMENTO_ENTRADA       - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.GENERO                     - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.ITEM_CNMP                  - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.JUIZ_RELATOR               - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.MOVIMENTACAO_JUDICIAL      - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.OFICIO                     - s/ trigger (vw_gerenciador_doc07_92 e views auxiliares)
- UNICO.OPERACAO                   - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.ORGAO_GOVERNO              - s/ trigger (vw_gerenciador_doc07_92 e views auxiliares)
- UNICO.ORGAO_JULGADOR             - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.ROTULO                     - s/ trigger (views auxiliares)
- UNICO.ROTULO_UNIDADE             - s/ trigger (views auxiliares)
- UNICO.SITUACAO_AUTUACAO          - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.TIPO_ENTRADA               - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.TIPO_VINCULO               - s/ trigger (vw_gerenciador_doc07_92)
- UNICO.TITULAR_OFICIO             - s/ trigger (views auxiliares)

- ignorar UNICO.CONCENTRADOR       - c/ trigger (vw_gerenciador_doc07_92  e views auxiliares) - ignorar, pois não grava ID_DOCUMENTO
- ignorar UNICO.MOVIMENTACAO       - c/ trigger (vw_gerenciador_doc07_92) - ignorar, pois grava como se fosse alteração em DOCUMENTO, a partir de SELECT em UNICO.REFERENCIA_NOVA e UNICO.DOCUMENTO
- ignorar UNICO.MANIFESTACAO       - c/ trigger (vw_gerenciador_doc07_92) - ignorar, pois grava como se fosse alteração em DOCUMENTO, a partir de SELECT em UNICO.AUTUACAO

- Baseado nas dependências acima, o SELECT básico na SOLR.SOLR_UNICO_LOG2 ficaria (observar que todas as tabelas são do owner 'UNICO'):
  SELECT *
    FROM solr.solr_unico_log2 l
   WHERE l.type         IN ( 'I', 'U' )
     AND l.id_genero    = 92
     AND l.id_documento IS NOT NULL
     AND l.table_name   IN ('AVISO_COMUNICACAO', 'ANOTACAO', 'AUTUACAO', 'CLASSIFICACAO_PROCESSO', 'DESIGNACAO_DOCUMENTO', 'DISTRIBUICAO_NOVA', 'DOCUMENTO', 'ENTRADA_PROCURADORIA', 'IPL_TCO', 'IPL_TCO_MANI_DILACAO_PRAZO', 'ITEM_CNMP_DOCUMENTO', 'NOTA_EXPEDIENTE', 'PROCESSO_JUDICIAL', 'REFERENCIA_NOVA', 'ROTULO_DOCUMENTO', 'VISIBILIDADE')

*/

CREATE
OR REPLACE type gerenciador_doc07_visipess AS object
(
    -- REV 001 - solr.views_gerenciador
    id_documento      NUMBER(19),
    id_usuario_acessa NUMBER(19),
    constructor

FUNCTION gerenciador_doc07_visipess
    RETURN self AS result);

CREATE
OR REPLACE type gerenciador_doc07_visipess_tb AS
-- REV 001 - solr.views_gerenciador
TABLE OF gerenciador_doc07_visipess;


CREATE
OR REPLACE type gerenciador_doc07_visisetr AS object
(
    -- REV 001 - solr.views_gerenciador
    id_documento   NUMBER(19),
    id_uorg_acessa NUMBER(19),
    constructor

FUNCTION gerenciador_doc07_visisetr
    RETURN self AS result);

CREATE
OR REPLACE type gerenciador_doc07_visisetr_tb AS
-- REV 001 - solr.views_gerenciador
TABLE OF gerenciador_doc07_visisetr;


CREATE
OR REPLACE type gerenciador_doc07_rotulo AS object
(
    -- REV 001 - solr.views_gerenciador
    id_documento NUMBER(19),
    rotulo       VARCHAR2(512),
    constructor

FUNCTION gerenciador_doc07_rotulo
    RETURN self AS result);

CREATE
OR REPLACE type gerenciador_doc07_rotulo_tb AS
-- REV 001 - solr.views_gerenciador
TABLE OF gerenciador_doc07_rotulo;


CREATE
OR REPLACE type gerenciador_doc07_designa AS object
(
    -- REV 001 - solr.views_gerenciador
    id_documento NUMBER(19),
    designacao   VARCHAR2(256),
    constructor

FUNCTION gerenciador_doc07_designa
    RETURN self AS result);

CREATE
OR REPLACE type gerenciador_doc07_designa_tb AS
-- REV 001 - solr.views_gerenciador
TABLE OF gerenciador_doc07_designa;


CREATE
OR REPLACE type gerenciador_doc07_ofictitu AS object
(
    -- REV 001 - solr.views_gerenciador
    id_documento  NUMBER(19),
    oficiotitular VARCHAR2(4000),
    constructor

FUNCTION gerenciador_doc07_ofictitu
    RETURN self AS result);

CREATE
OR REPLACE type gerenciador_doc07_ofictitu_tb AS
-- REV 001 - solr.views_gerenciador
TABLE OF gerenciador_doc07_ofictitu;


CREATE
OR REPLACE type gerenciador_doc07_aviso AS object
(
    -- REV 001 - solr.views_gerenciador
    id_documento NUMBER(19),
    aviso        VARCHAR2(391),
    constructor

FUNCTION gerenciador_doc07_aviso
    RETURN self AS result);


CREATE
OR REPLACE type gerenciador_doc07_aviso_tb AS
-- REV 001 - solr.views_gerenciador
TABLE OF gerenciador_doc07_aviso;


CREATE
OR REPLACE type gerenciador_doc07_notaexp AS object
(
    -- REV 001 - solr.views_gerenciador
	id_documento	              NUMBER(19),
	id_unidade_organica_cadastro  NUMBER(19),
	constructor

FUNCTION gerenciador_doc07_notaexp
    RETURN self AS result);


CREATE
OR REPLACE type gerenciador_doc07_notaexp_tb AS
-- REV 001 - solr.views_gerenciador
TABLE OF gerenciador_doc07_notaexp;


CREATE
OR REPLACE type gerenciador_doc07 AS object
(
    -- REV 001B - solr.views_gerenciador
    id                             NUMBER(19),
    etiquetaexpediente_str         VARCHAR2(70),
    idgenero                       NUMBER(19),
    nomegenero_str                 VARCHAR2(50),
    nomesigilo_str                 VARCHAR2(12),
    datamovimentacao_dt            VARCHAR2(24),
    datarecebimento_dt             VARCHAR2(24),
    eletronico                     NUMBER,
    nomeconcentradororigem_str     VARCHAR2(1000),
    nomeconcentradorlocalizado_str VARCHAR2(1025),
    idconcentradorlocalizado       NUMBER(19),
    areceber                       NUMBER,
    assunto_str                    VARCHAR2(2000),
    idvisao                        NUMBER,
    idtiponatureza                 NUMBER,
    nometiponatureza_str           VARCHAR2(100),
    envelopado                     CHAR(1),
    exibirgerenciador              CHAR(1),
    arquivado                      CHAR(1),
    resumo_str                     VARCHAR2(4000),
    situacaodocumento_str          VARCHAR2(18),
    dataautuacao_dt                VARCHAR2(24),
    siglaclasse_str                VARCHAR2(100),
    dataprazofim_dt                VARCHAR2(24),
    nomeareaatuacao_str            VARCHAR2(50),
    nometiposituacaoae_str         VARCHAR2(203),
    nomedesignado_str              VARCHAR2(1),
    dataprevdevdesignacao_dt       VARCHAR2(1),
    idusuarioinclusaodesignacao    VARCHAR2(1),
    idsetorinclusaodesignacao      VARCHAR2(1),
    situacaosigilodesignacao       VARCHAR2(1),
    qtdedesignadosforasetor        NUMBER,
    minuta                         NUMBER,
    minutadocsjuntados             NUMBER,
    textoultimaanotacao_str        VARCHAR2(1000),
    textopesquisa                  VARCHAR2(1),
    iddistribuicaoresponsavel      NUMBER,
    idmacroresponsavel_str         NUMBER,
    nomemacroresponsavel_str       VARCHAR2(60),
    idoficioresponsavel_str        NUMBER,
    nomeoficioresponsavel_str      VARCHAR2(4000),
    idtipovinculoresponsavel_str   NUMBER,
    nometipovinculoresponsavel_str VARCHAR2(100),
    idorgaojulgador                NUMBER,
    orgaojulgador_str              VARCHAR2(100),
    linkprocesso_str               VARCHAR2(541),
    idunidadeorganica              NUMBER,
    idareaatuacao                  NUMBER,
    areaatuacao_str                VARCHAR2(50),
    idrelator                      NUMBER,
    relator_str                    VARCHAR2(100),
    idautuacao                     NUMBER,
    etiquetaautuacao_str           VARCHAR2(70),
    numeroprotocoloregistro_str    VARCHAR2(100),
    idoperacaopolicial             NUMBER,
    operacaopolicial_str           VARCHAR2(100),
    entrada_dt                     VARCHAR2(24),
    idorgaogerador                 NUMBER,
    orgaogerador_str               VARCHAR2(300),
    orgaogeradordominio_str        VARCHAR2(1),
    urgente_str                    VARCHAR2(1),
    semprioridade_str              VARCHAR2(1),
    idclassejudiciaria             NUMBER,
    classejudiciaria_str           VARCHAR2(150),
    idtipodistribuicao             VARCHAR2(1),
    tipodistribuicao_str           VARCHAR2(1),
    idoficio                       VARCHAR2(1),
    reupreso_str                   VARCHAR2(1),
    parteprioritaria_str           VARCHAR2(1),
    iddesignado                    VARCHAR2(1),
    existeprazodevolucao_str       VARCHAR2(1),
    prazodevolucao_dt              VARCHAR2(24),
    penaminima_dt                  VARCHAR2(24),
    penamaxima_dt                  VARCHAR2(24),
    penaminimaconcreta_dt          VARCHAR2(24),
    uf_str                         VARCHAR2(2),
    latitude                       NUMBER,
    longitude                      NUMBER,
    idsituacaoautuacao             NUMBER,
    situacaoautuacao_str           VARCHAR2(100),
    limiteparaconclusao_dt         VARCHAR2(24),
    entradampfcd_str               VARCHAR2(1),
    entradampf_str                 VARCHAR2(10),
    assuntonivel_str               VARCHAR2(543),
    possuiintimacao_str            NUMBER,
    possuiintimacaopendente_str    NUMBER,
    temintimacaocomerroenvio_str   VARCHAR2(1),
    anotacoes                      VARCHAR2(1),
    datareferencia_dt              VARCHAR2(1),
    siglaprocdistribuicao_str      VARCHAR2(1),
    nompf_str                      VARCHAR2(3),
    nosetor_str                    VARCHAR2(1),
    tipoapenso_str                 VARCHAR2(10),
    motivoentrada_str              VARCHAR2(266),
    ultimasaidaunidade_str         VARCHAR2(1),
    origemoutraunidademacro        NUMBER,
    orgaogeradorsigla_str          VARCHAR2(10),
    possuimanifestacaoentrada_str  VARCHAR2(3),
    manifestacaoentradaatual_str   VARCHAR2(70),
    situacaoassinatura_str         VARCHAR2(31),
    iddocmanifestacaoentradaatual  NUMBER,
    dtmanifestacaoentradaatual_dt  VARCHAR2(24),
    juizrelator_str                VARCHAR2(100),
    materiarepetitiva_str          VARCHAR2(3),
    reupresoclassificacao_str      VARCHAR2(3),
    dtlocalizacao_dt               VARCHAR2(24),
    datatempoparado_dt 			   VARCHAR2(24),	
    grupotematicoprincipal_str     VARCHAR2(200),
    temintimacaopendentenova_str   NUMBER,	 
          

    lst_visipess gerenciador_doc07_visipess_tb,
    lst_visisetr gerenciador_doc07_visisetr_tb,
    lst_rotulo gerenciador_doc07_rotulo_tb,
    lst_designa gerenciador_doc07_designa_tb,
    lst_ofictitu gerenciador_doc07_ofictitu_tb,
    lst_aviso gerenciador_doc07_aviso_tb,
    lst_notaexp gerenciador_doc07_notaexp_tb);


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07#CRG"(sq, sys_timestamp, id_genero, id_documento, nm_core, tp_atualizacao, obj_log_unico) AS
SELECT
    rownum            AS sq,
    SYSDATE           AS sys_timestamp,
    docu.id_genero    AS id_genero,
    docu.id_documento AS id_documento,
    'gerenciador'     AS nm_core,
    'full'            AS tp_atualizacao,
    NULL              AS obj_log_unico
FROM
    unico.documento               docu
    INNER JOIN unico.concentrador cd
        ON  cd.id_concentrador = docu.id_concentrador_localizado
WHERE(
        (docu.id_genero IN(10,
                           41)
            AND docu.st_exibir_gerenciador = 'S')
        OR
        (docu.id_genero                = 92
            AND cd.id_unidade_organica > 0))
    AND docu.st_envelopado = 'N';


COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07#CRG"
IS
    'REV 001 - solr.views_gerenciador';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07_VISIPESS"(id_documento, id_usuario_acessa) AS
-- CAMPO MULTIVALORADO sigilosPessoa_multi
SELECT
    visib.id_documento,
    visib.id_usuario_acessa
FROM
    unico.visibilidade visib,
    unico.documento    docu
WHERE visib.id_documento   = docu.id_documento
    AND docu.st_envelopado = 'N'
    AND SYSDATE BETWEEN visib.dt_inicio AND visib.dt_fim;


COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_VISIPESS"
IS
    'REV 001 - solr.views_gerenciador';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07_VISISETR"(id_documento, id_uorg_acessa) AS
-- CAMPO MULTIVALORADO sigilosSetor_multi
SELECT
    visib.id_documento,
    visib.id_uorg_acessa
FROM
    unico.visibilidade visib,
    unico.documento    docu
WHERE visib.id_documento   = docu.id_documento
    AND docu.st_envelopado = 'N'
    AND SYSDATE BETWEEN visib.dt_inicio AND visib.dt_fim;


COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_VISISETR"
IS
    'REV 001 - solr.views_gerenciador';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07_ROTULO"(id_documento, rotulo) AS
SELECT
    rodo.id_documento,
    roun.id_unidade_organica ||
    '_'                      ||
        rotu.id_rotulo       ||
    '_'                      ||
        rodo.id_rotulo_documento AS rotulo
FROM
    unico.rotulo_documento  rodo
    INNER JOIN unico.rotulo rotu
        ON  rodo.id_rotulo = rotu.id_rotulo
    INNER JOIN unico.rotulo_unidade roun
        ON  rotu.id_rotulo = roun.id_rotulo;


COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_ROTULO"
IS
    'REV 001 - solr.views_gerenciador';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07_DESIGNA"(id_documento, designacao) AS
SELECT
    docu.id_documento AS id_documento,
    conc_dedo.id_concentrador ||
    '_'                       ||
        pefi_dedo.nome AS designacao
FROM
    unico.designacao_documento desigdoc
    INNER JOIN unico.documento docu
        ON  docu.id_documento = desigdoc.id_documento
    JOIN unico.concentrador conc_dedo
        ON  conc_dedo.id_unidade_organica = desigdoc.id_uorg_setor_designado
    INNER JOIN corporativo.vinculo vinc_dedo
        ON  desigdoc.id_vinculo = vinc_dedo.id_vinculo
    INNER JOIN corporativo.pessoa_fisica pefi_dedo
        ON  vinc_dedo.id_pessoa = pefi_dedo.id_pessoa
WHERE docu.id_genero IN(10,
                        41,
                        92)
    AND desigdoc.dt_fim_periodo IS NULL;


COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_DESIGNA"
IS
    'REV 001 - solr.views_gerenciador';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07_OFICTITU"(id_documento, oficiotitular) AS
SELECT
    dino.id_documento_distribuido AS id_documento,
    ofic.id_uorg_procuradoria ||
    '_'                       ||
        ofic.nm_oficio        ||
        nvl2(pefi.nome, ' - ' ||
        regexp_replace(pefi.nome, '(^| )([^ ])([^ ])*', '\2'), '') AS oficiotitular
FROM
    unico.distribuicao_nova    dino
    INNER JOIN unico.documento docu
        ON  docu.id_documento = dino.id_documento_distribuido
    INNER JOIN unico.oficio ofic
        ON  ofic.id_oficio = dino.id_oficio
    LEFT JOIN unico.titular_oficio tiof
        ON  tiof.id_oficio                = ofic.id_oficio
            AND tiof.dt_fim_periodo IS NULL
    LEFT JOIN corporativo.vinculo vinc
        ON  vinc.id_vinculo = tiof.id_vinculo_titular
    LEFT JOIN corporativo.pessoa_fisica pefi
        ON  pefi.id_pessoa           = vinc.id_pessoa
WHERE dino.dt_fim_distribuicao IS NULL
    AND dino.id_tipo_vinculo         = 1;


COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_OFICTITU"
IS
    'REV 001 - solr.views_gerenciador';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07_AVISO"("ID_DOCUMENTO", "AVISO") AS
SELECT
    ac.id_documento AS id_documento,
    ac.id_autuacao                                                                                    ||
    '_'                                                                                               ||
        nvl2(ac.dh_referencia, TO_CHAR(ac.dh_referencia, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"'), 'NULL')   ||
    '_'                                                                                               ||
        nvl2(ac.dt_prazo_graca, TO_CHAR(ac.dt_prazo_graca, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"'), 'NULL') ||
    '_'                                                                                               ||
        nvl2(o.nome, o.nome, 'NULL') AS aviso
FROM
    pcpe.aviso_comunicacao     ac
    INNER JOIN pcpe.integracao i
        ON  i.id_integracao = ac.id_integracao
    INNER JOIN unico.orgao_governo o
        ON  o.id_orgao_governo = i.id_orgao_governo
WHERE ac.tp_aviso              = 2
    AND ac.st_aviso           != 6
    AND ac.st_consulta_inteiro_teor NOT IN(3,
                                           0,
                                           5,
                                           6)
    AND id_documento > 0;



COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_AVISO"
IS
    'REV 001 - solr.views_gerenciador';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07_NOTAEXP"("ID_DOCUMENTO", "ID_UNIDADE_ORGANICA_CADASTRO") AS
SELECT distinct
    ne.id_documento AS id_documento,
    ne.id_unidade_organica_cadastro AS id_unidade_organica_cadastro
FROM    unico.nota_expediente		ne
WHERE ne.ST_ATIVO = 1;



COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_NOTAEXP"
IS
    'REV 001 - solr.views_gerenciador';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07"("ID", "ETIQUETAEXPEDIENTE_STR", "IDGENERO", "NOMEGENERO_STR", "NOMESIGILO_STR", "DATAMOVIMENTACAO_DT", "DATARECEBIMENTO_DT", "ELETRONICO", "NOMECONCENTRADORORIGEM_STR", "NOMECONCENTRADORLOCALIZADO_STR", "IDCONCENTRADORLOCALIZADO", "ARECEBER", "ASSUNTO_STR", "IDVISAO", "IDTIPONATUREZA", "NOMETIPONATUREZA_STR", "ENVELOPADO", "EXIBIRGERENCIADOR", "ARQUIVADO", "RESUMO_STR", "SITUACAODOCUMENTO_STR", "DATAAUTUACAO_DT", "SIGLACLASSE_STR", "DATAPRAZOFIM_DT", "NOMEAREAATUACAO_STR", "NOMETIPOSITUACAOAE_STR", "NOMEDESIGNADO_STR", "DATAPREVDEVDESIGNACAO_DT", "IDUSUARIOINCLUSAODESIGNACAO", "IDSETORINCLUSAODESIGNACAO", "SITUACAOSIGILODESIGNACAO", "QTDEDESIGNADOSFORASETOR", "MINUTA", "MINUTADOCSJUNTADOS", "TEXTOULTIMAANOTACAO_STR", "TEXTOPESQUISA",
"IDDISTRIBUICAORESPONSAVEL", "IDMACRORESPONSAVEL_STR", "NOMEMACRORESPONSAVEL_STR", "IDOFICIORESPONSAVEL_STR", "NOMEOFICIORESPONSAVEL_STR", "IDTIPOVINCULORESPONSAVEL_STR", "NOMETIPOVINCULORESPONSAVEL_STR", "IDORGAOJULGADOR", "ORGAOJULGADOR_STR", "LINKPROCESSO_STR", "IDUNIDADEORGANICA", "IDAREAATUACAO", "AREAATUACAO_STR", "IDRELATOR", "RELATOR_STR", "IDAUTUACAO", "ETIQUETAAUTUACAO_STR", "NUMEROPROTOCOLOREGISTRO_STR", "IDOPERACAOPOLICIAL", "OPERACAOPOLICIAL_STR", "ENTRADA_DT", "IDORGAOGERADOR", "ORGAOGERADOR_STR", "ORGAOGERADORDOMINIO_STR", "URGENTE_STR", "SEMPRIORIDADE_STR", "IDCLASSEJUDICIARIA", "CLASSEJUDICIARIA_STR", "IDTIPODISTRIBUICAO", "TIPODISTRIBUICAO_STR", "IDOFICIO", "REUPRESO_STR", "PARTEPRIORITARIA_STR", "IDDESIGNADO", "EXISTEPRAZODEVOLUCAO_STR", "PRAZODEVOLUCAO_DT",
"PENAMINIMA_DT", "PENAMAXIMA_DT", "PENAMINIMACONCRETA_DT", "UF_STR", "LATITUDE", "LONGITUDE", "IDSITUACAOAUTUACAO", "SITUACAOAUTUACAO_STR", "LIMITEPARACONCLUSAO_DT", "ENTRADAMPFCD_STR", "ENTRADAMPF_STR", "ASSUNTONIVEL_STR", "POSSUIINTIMACAO_STR", "POSSUIINTIMACAOPENDENTE_STR", "TEMINTIMACAOCOMERROENVIO_STR", "ANOTACOES", "DATAREFERENCIA_DT", "SIGLAPROCDISTRIBUICAO_STR", "NOMPF_STR", "NOSETOR_STR", "TIPOAPENSO_STR", "MOTIVOENTRADA_STR", "ULTIMASAIDAUNIDADE_STR", "ORIGEMOUTRAUNIDADEMACRO", "ORGAOGERADORSIGLA_STR", "POSSUIMANIFESTACAOENTRADA_STR", "MANIFESTACAOENTRADAATUAL_STR", "SITUACAOASSINATURA_STR", "IDDOCMANIFESTACAOENTRADAATUAL", "DTMANIFESTACAOENTRADAATUAL_DT", "JUIZRELATOR_STR", "MATERIAREPETITIVA_STR","REUPRESOCLASSIFICACAO_STR", "DTLOCALIZACAO_DT", "DATATEMPOPARADO_DT", "GRUPOTEMATICOPRINCIPAL_STR", "TEMINTIMACAOPENDENTENOVA_STR") AS
SELECT
--SELECT DO EXTRAJUDICIAL
    /*+ cardinality (docu, 1000) */
    docu.id_documento AS id,
    docu.etiqueta     AS etiquetaexpediente_str,
    docu.id_genero    AS idgenero,
    gene.descricao    AS nomegenero_str,
    DECODE(docu.st_sigilo,
               'N', 'Normal',
               'R', 'Reservado',
               'C', 'Confidencial')                                 AS nomesigilo_str,
    TO_CHAR(docu.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS datamovimentacao_dt,
    TO_CHAR(mov.dt_recebimento, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')   AS datarecebimento_dt,
    DECODE(docu.st_digital,
               NULL, 0,
               docu.st_digital) AS eletronico,
    conc_orig.ds_concentrador   AS nomeconcentradororigem_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.ds_concentrador
        ELSE conc_dest.ds_concentrador ||
            ' - Aguardando recebimento'
    END AS nomeconcentradorlocalizado_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.id_concentrador
        ELSE conc_dest.id_concentrador
    END                                      AS idconcentradorlocalizado,
    nvl2(docu.id_concentrador_destino, 1, 0) AS areceber,
    nvl2(itcn.cd_cnmp, itcn.cd_cnmp ||
    ' - '                           ||
        itcn.ds_item, NULL)                           AS assunto_str,
    3                                                 AS idvisao,
    ticc.id_tipo_natureza                             AS idtiponatureza,
    tpna.ds_tipo_natureza                             AS nometiponatureza_str,
    docu.st_envelopado                                AS envelopado,
    docu.st_exibir_gerenciador                        AS exibirgerenciador,
    auad.st_arquivado                                 AS arquivado,
    solr.pkg_solr.fnc_limpar_caracter(auad.ds_resumo) AS resumo_str,
    NULL                                              AS situacaodocumento_str,
    -- EXTRAJUDICIAL
    TO_CHAR(auad.dt_autuacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataautuacao_dt,
    ticc.sg_tipo_classe_cnmp                                    AS siglaclasse_str,
    TO_CHAR(copf.dt_fim, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')      AS dataprazofim_dt,
    arat.descricao                                              AS nomeareaatuacao_str,
    tisi.ds_tipo_situacao_ae                        ||
        nvl2(cosi.ds_complemento_situacao_ae, ' - ' ||
        cosi.ds_complemento_situacao_ae, NULL) AS nometiposituacaoae_str,
    -- DESIGNACAO
    NULL                     AS nomedesignado_str,
    NULL                     AS dataprevdevdesignacao_dt,
    NULL                     AS idusuarioinclusaodesignacao,
    NULL                     AS idsetorinclusaodesignacao,
    NULL                     AS situacaosigilodesignacao,
    0                        AS qtdedesignadosforasetor,
    0                        AS minuta,
    agmj.qt_minutas_juntadas AS minutadocsjuntados,
    -- ANOTAÇÃO
    anot.descricao AS textoultimaanotacao_str,
    NULL           AS textopesquisa,
    --versao doc3
    dino.id_distribuicao           AS iddistribuicaoresponsavel,
    unor.id_unidade_organica_macro AS idmacroresponsavel_str,
    unma.nome                      AS nomemacroresponsavel_str,
    ofic.id_oficio                 AS idoficioresponsavel_str,
    solr.pkg_solr.fnc_limpar_caracter(ofic.nm_oficio)               AS nomeoficioresponsavel_str,
    dino.id_tipo_vinculo                                            AS idtipovinculoresponsavel_str,
    tivi.nm_tipo_vinculo                                            AS nometipovinculoresponsavel_str,
    -- campos novos do JUDICIAL
    NULL AS idorgaojulgador,
    NULL AS orgaojulgador_str,
    NULL AS linkprocesso_str,
    NULL AS idunidadeorganica,
    NULL AS idareaatuacao,
    NULL AS areaatuacao_str,
    NULL AS idrelator,
    NULL AS relator_str,
    NULL AS idautuacao,
    NULL AS etiquetaautuacao_str,
    NULL AS numeroprotocoloregistro_str,
    NULL AS idoperacaopolicial,
    NULL AS operacaopolicial_str,
    NULL AS entrada_dt,
    NULL AS idorgaogerador,
    NULL AS orgaogerador_str,
    NULL AS orgaogeradordominio_str,
    docu.st_urgente                                                 AS urgente_str,
    NULL AS semprioridade_str,
    NULL AS idclassejudiciaria,
    NULL AS classejudiciaria_str,
    NULL AS idtipodistribuicao,
    NULL AS tipodistribuicao_str,
    NULL AS idoficio,
    NULL AS reupreso_str,
    NULL AS parteprioritaria_str,
    NULL AS iddesignado,
    NULL AS existeprazodevolucao_str,
    NULL AS prazodevolucao_dt,
    NULL AS penaminima_dt,
    NULL AS penamaxima_dt,
    NULL AS penaminimaconcreta_dt,
    NULL AS uf_str,
    NULL AS latitude,
    NULL AS longitude,
    NULL AS idsituacaoautuacao,
    NULL AS situacaoautuacao_str,
    NULL AS limiteparaconclusao_dt,
    NULL AS entradampfcd_str,
    NULL AS entradampf_str,
    NULL AS assuntonivel_str,
    NULL AS possuiintimacao_str,
    NULL AS possuiintimacaopendente_str,
    NULL AS temintimacaocomerroenvio_str,
    NULL AS anotacoes,
    NULL AS datareferencia_dt,
    NULL AS siglaprocdistribuicao_str,
    NULL AS nompf_str,
    NULL AS nosetor_str,
    NULL AS tipoapenso_str,
    NULL AS motivoentrada_str,
    NULL AS ultimasaidaunidade_str,
    NULL AS origemoutraunidademacro,
    NULL AS orgaogeradorsigla_str,
    NULL AS possuimanifestacaoentrada_str,
    NULL AS manifestacaoentradaatual_str,
    NULL AS situacaoassinatura_str,
    NULL AS iddocmanifestacaoentradaatual,
    NULL AS dtmanifestacaoentradaatual_dt,
    NULL AS juizrelator_str,
    NULL AS materiarepetitiva_str,
    NULL AS reupresoclassificacao_str,
    NULL AS dtlocalizacao_dt, 
    --#ULISSES - 15/06/2022 - INICIO
    to_char(duoe.DT_ULTIMA_OCORRENCIA, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') as datatempoparado_dt, 
    cam.descricao as grupotematicoprincipal_str,
    --#ULISSES - 15/06/2022 - FIM       
    --#FABIANAG - 17/06/2022 - INICIO
    NULL AS temintimacaopendentenova_str
    --#FABIANAG - 17/06/2022 - FIM
FROM
    unico.documento              docu
    LEFT JOIN unico.movimentacao mov
        ON  mov.id_movimentacao                    = docu.id_movimentacao
            AND docu.id_concentrador_destino IS NULL
    -- No delta é LEFT
    LEFT JOIN unico.concentrador cl
        ON  cl.id_concentrador = docu.id_concentrador_localizado
    -- No delta é LEFT
    LEFT JOIN unico.concentrador conc_orig
        ON  docu.id_concentrador_origem = conc_orig.id_concentrador
    LEFT JOIN unico.concentrador conc_dest
        ON  docu.id_concentrador_destino = conc_dest.id_concentrador
    INNER JOIN unico.genero gene
        ON  docu.id_genero = gene.id_genero
    -- AUTO ADMINISTRATIVO
    INNER JOIN unico.auto_administrativo auad
        ON  docu.id_documento = auad.id_documento
    LEFT JOIN unico.item_cnmp_documento itcd
        ON  docu.id_documento          = itcd.id_documento
            AND itcd.st_tema_principal = 1
    LEFT JOIN unico.item_cnmp itcn
        ON  itcd.id_item_cnmp = itcn.id_item_cnmp
    INNER JOIN unico.tipo_classe_cnmp ticc
        ON  auad.id_tipo_classe_cnmp_atual = ticc.id_tipo_classe_cnmp
    INNER JOIN unico.tipo_natureza tpna
        ON  ticc.id_tipo_natureza = tpna.id_tipo_natureza
    LEFT JOIN unico.controle_prazo_finalizacao copf
        ON  auad.id_controle_prazo_finalizacao = copf.id_controle_prazo_finalizacao
    INNER JOIN unico.area_atuacao arat
        ON  auad.id_area_atuacao = arat.id_area_atuacao
    LEFT JOIN unico.historico_situacao_ae hisi
        ON  auad.id_historico_situacao_ae = hisi.id_historico_situacao_ae
    LEFT JOIN unico.tipo_situacao_ae tisi
        ON  hisi.id_tipo_situacao_ae = tisi.id_tipo_situacao_ae
    LEFT JOIN unico.complemento_situacao_ae cosi
        ON  cosi.id_complemento_situacao_ae = hisi.id_complemento_situacao_ae
    -- ANOTAÇÃO
    /*LEFT JOIN
    (SELECT
    anot1.descricao,
    anot1.dt_inclusao,
    anot1.id_anotacao,
    anot1.id_documento id_documento
    FROM
    unico.anotacao anot1
    WHERE anot1.st_ativo      = 1
    AND anot1.id_anotacao =
    (SELECT
    MAX(anot2.id_anotacao)
    FROM
    unico.anotacao anot2
    WHERE anot2.id_documento = anot1.id_documento
    AND anot2.st_ativo   = 1
    )
    ) anot
    ON  anot.id_documento = docu.id_documento*/
    LEFT JOIN unico.anotacao anot
        ON  anot.id_documento = docu.id_documento
            AND anot.st_ativo = 1
    LEFT JOIN solr.agg_minuta_juntada agmj
        ON  docu.id_documento = agmj.id_documento
    LEFT JOIN unico.distribuicao_nova dino
        ON  dino.id_distribuicao = auad.id_distribuicao_responsavel
    LEFT JOIN unico.tipo_vinculo tivi
        ON  tivi.id_tipo_vinculo = dino.id_tipo_vinculo
    LEFT JOIN unico.oficio ofic
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
	--#ULISSES - 15.06.2022 - Inicio        
	LEFT JOIN unico_desnormalizado.documento_ultima_ocor_expe duoe 
	    ON duoe.id_documento = docu.id_documento
	LEFT JOIN unico.documento_grupo_tematico dgt 
		ON docu.id_documento = dgt.id_documento
			and dgt.st_grupo_tematico_principal = 1		
	LEFT JOIN unico.camara cam 
		ON dgt.id_grupo_tematico = cam.id_camara
    --#ULISSES - 15.06.2022 - Fim	
WHERE docu.id_genero       = 10
    AND
    (anot.id_anotacao =
        (SELECT
            /*+ index (anot2 idx_anot_id_docu_st_ativo) */
            MAX(anot2.id_anotacao)
        FROM
            unico.anotacao anot2
        WHERE anot2.id_documento = docu.id_documento
            AND anot2.st_ativo   = 1
        )
        OR anot.id_anotacao IS NULL)	
UNION ALL
--SELECT DO DOCUMENTO ADMINISTRATIVO
SELECT
    /*+ cardinality (docu, 1000) */
    docu.id_documento AS id,
    docu.etiqueta     AS etiquetaexpediente_str,
    docu.id_genero    AS idgenero,
    gene.descricao    AS nomegenero_str,
    DECODE(docu.st_sigilo,
               'N', 'Normal',
               'R', 'Reservado',
               'C', 'Confidencial')                                 AS nomesigilo_str,
    TO_CHAR(docu.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS datamovimentacao_dt,
    TO_CHAR(mov.dt_recebimento, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')   AS datarecebimento_dt,
    DECODE(docu.st_digital,
               NULL, 0,
               docu.st_digital) AS eletronico,
    conc_orig.ds_concentrador   AS nomeconcentradororigem_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.ds_concentrador
        ELSE conc_dest.ds_concentrador ||
            ' - Aguardando recebimento'
    END AS nomeconcentradorlocalizado_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.id_concentrador
        ELSE conc_dest.id_concentrador
    END                                      AS idconcentradorlocalizado,
    nvl2(docu.id_concentrador_destino, 1, 0) AS areceber,
    assu.descricao                           AS assunto_str,
    2                                        AS idvisao,
    CASE doad.st_natureza
        WHEN 'X'
        THEN 3
        WHEN 'A'
        THEN 2
        WHEN 'J'
        THEN 1
        ELSE NULL
    END AS idtiponatureza,
    CASE doad.st_natureza
        WHEN 'X'
        THEN 'Extrajudicial'
        WHEN 'A'
        THEN 'Administrativa'
        WHEN 'J'
        THEN 'Judicial'
        ELSE NULL
    END                                               AS nometiponatureza_str,
    docu.st_envelopado                                AS envelopado,
    docu.st_exibir_gerenciador                        AS exibirgerenciador,
    doad.st_arquivado                                 AS arquivado,
    solr.pkg_solr.fnc_limpar_caracter(doad.ds_resumo) AS resumo_str,
    CASE
        WHEN doad.st_congelado    = 'S'
            AND doad.st_documento = 'C'
        THEN 'Original Congelado'
        WHEN doad.st_documento = 'P'
        THEN 'Pendente'
        WHEN doad.id_documento_originador IS NOT NULL
        THEN 'Cópia'
        ELSE DECODE(doad.st_documento,
                        'N', 'Normal',
                        'C', 'Original',
                        'F', 'Finalizado')
    END AS situacaodocumento_str,
    -- EXTRAJUDICIAL
    TO_CHAR(docu.dt_cadastro, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataautuacao_dt,
    tido.descricao                                              AS siglaclasse_str,
    TO_CHAR(doad.dt_limite, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')   AS dataprazofim_dt,
    NULL                                                        AS nomeareaatuacao_str,
    NULL                                                        AS nometiposituacaoae_str,
    -- DESIGNACAO
    NULL                     AS nomedesignado_str,
    NULL                     AS dataprevdevdesignacao_dt,
    NULL                     AS idusuarioinclusaodesignacao,
    NULL                     AS idsetorinclusaodesignacao,
    NULL                     AS situacaosigilodesignacao,
    0                        AS qtdedesignadosforasetor,
    doad.st_minuta           AS minuta,
    agmj.qt_minutas_juntadas AS minutadocsjuntados,
    -- ANOTAÇÃO
    anot.descricao AS textoultimaanotacao_str,
    NULL           AS textopesquisa,
    NULL           AS iddistribuicaoresponsavel,
    NULL           AS idmacroresponsavel_str,
    NULL           AS nomemacroresponsavel_str,
    NULL           AS idoficioresponsavel_str,
    NULL           AS nomeoficioresponsavel_str,
    NULL           AS idtipovinculoresponsavel_str,
    NULL           AS nometipovinculoresponsavel_str,
    -- campos novos do JUDICIAL
    NULL AS idorgaojulgador,
    NULL AS orgaojulgador_str,
    NULL AS linkprocesso_str,
    NULL AS idunidadeorganica,
    NULL AS idareaatuacao,
    NULL AS areaatuacao_str,
    NULL AS idrelator,
    NULL AS relator_str,
    NULL AS idautuacao,
    NULL AS etiquetaautuacao_str,
    NULL AS numeroprotocoloregistro_str,
    NULL AS idoperacaopolicial,
    NULL AS operacaopolicial_str,
    NULL AS entrada_dt,
    NULL AS idorgaogerador,
    NULL AS orgaogerador_str,
    NULL AS orgaogeradordominio_str,
    NULL AS urgente_str,
    NULL AS semprioridade_str,
    NULL AS idclassejudiciaria,
    NULL AS classejudiciaria_str,
    NULL AS idtipodistribuicao,
    NULL AS tipodistribuicao_str,
    NULL AS idoficio,
    NULL AS reupreso_str,
    NULL AS parteprioritaria_str,
    NULL AS iddesignado,
    NULL AS existeprazodevolucao_str,
    NULL AS prazodevolucao_dt,
    NULL AS penaminima_dt,
    NULL AS penamaxima_dt,
    NULL AS penaminimaconcreta_dt,
    NULL AS uf_str,
    NULL AS latitude,
    NULL AS longitude,
    NULL AS idsituacaoautuacao,
    NULL AS situacaoautuacao_str,
    NULL AS limiteparaconclusao_dt,
    NULL AS entradampfcd_str,
    NULL AS entradampf_str,
    NULL AS assuntonivel_str,
    NULL AS possuiintimacao_str,
    NULL AS possuiintimacaopendente_str,
    NULL AS temintimacaocomerroenvio_str,
    NULL AS anotacoes,
    NULL AS datareferencia_dt,
    NULL AS siglaprocdistribuicao_str,
    NULL AS nompf_str,
    NULL AS nosetor_str,
    NULL AS tipoapenso_str,
    NULL AS motivoentrada_str,
    NULL AS ultimasaidaunidade_str,
    NULL AS origemoutraunidademacro,
    NULL AS orgaogeradorsigla_str,
    NULL AS possuimanifestacaoentrada_str,
    NULL AS manifestacaoentradaatual_str,
    NULL AS situacaoassinatura_str,
    NULL AS iddocmanifestacaoentradaatual,
    NULL AS dtmanifestacaoentradaatual_dt,
    NULL AS juizrelator_str,
    NULL AS materiarepetitiva_str,
    NULL AS reupresoclassificacao_str,
    NULL AS dtlocalizacao_dt, 
     --#ULISSES - 15.06.2022 - Inicio
    NULL AS datatempoparado_dt, 
    NULL AS grupotematicoprincipal_str,
    --#ULISSES - 15.06.2022 - Fim
    --#FABIANAG - 17/06/2022 - INICIO
    NULL AS temintimacaopendentenova_str
    --#FABIANAG - 17/06/2022 - FIM
FROM
    unico.documento              docu
    LEFT JOIN unico.movimentacao mov
        ON  mov.id_movimentacao                    = docu.id_movimentacao
            AND docu.id_concentrador_destino IS NULL
    -- No delta é LEFT
    LEFT JOIN unico.concentrador cl
        ON  cl.id_concentrador = docu.id_concentrador_localizado
    LEFT JOIN unico.concentrador conc_orig
        ON  docu.id_concentrador_origem = conc_orig.id_concentrador
    LEFT JOIN unico.concentrador conc_dest
        ON  docu.id_concentrador_destino = conc_dest.id_concentrador
    INNER JOIN unico.genero gene
        ON  docu.id_genero = gene.id_genero
    LEFT JOIN unico.assunto assu
        ON  docu.id_assunto = assu.id_assunto
    -- DOCUMENTO ADMINISTRATIVO
    INNER JOIN unico.documento_administrativo doad
        ON  docu.id_documento = doad.id_documento
    INNER JOIN unico.tipo_documento tido
        ON  doad.id_tipo_documento = tido.id_tipo_documento
    -- ANOTAÇÃO
    /*LEFT JOIN
    (SELECT
    anot1.descricao,
    anot1.dt_inclusao,
    anot1.id_anotacao,
    anot1.id_documento id_documento
    FROM
    unico.anotacao anot1
    WHERE anot1.st_ativo      = 1
    AND anot1.id_anotacao =
    (SELECT
    MAX(anot2.id_anotacao)
    FROM
    unico.anotacao anot2
    WHERE anot2.id_documento = anot1.id_documento
    AND anot2.st_ativo   = 1
    )
    ) anot
    ON  anot.id_documento = docu.id_documento*/
    LEFT JOIN unico.anotacao anot
        ON  anot.id_documento = docu.id_documento
            AND anot.st_ativo = 1
    LEFT JOIN solr.agg_minuta_juntada agmj
        ON  docu.id_documento = agmj.id_documento
WHERE docu.id_genero          = 41
    AND
    (anot.id_anotacao =
        (SELECT
            /*+ index (anot2 idx_anot_id_docu_st_ativo) */
            MAX(anot2.id_anotacao)
        FROM
            unico.anotacao anot2
        WHERE anot2.id_documento = docu.id_documento
            AND anot2.st_ativo   = 1
        )
        OR anot.id_anotacao IS NULL)
UNION ALL
--SELECT DO JUDICIAL
SELECT
    /*+ cardinality (dc, 1000) */
    dc.id_documento AS id,
    au.ds_etiqueta  AS etiquetaexpediente_str,
    dc.id_genero    AS idgenero,
    gen.descricao   AS nomegenero_str,
    DECODE(dc.st_sigilo,
               'N', 'Normal',
               'R', 'Reservado',
               'C', 'Confidencial')                               AS nomesigilo_str,
    TO_CHAR(mv.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS datamovimentacao_dt,
    TO_CHAR(mv.dt_recebimento, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')  AS datarecebimento_dt,
    DECODE(dc.st_digital,
               NULL, 0,
               dc.st_digital) AS eletronico,
    conc_orig.ds_concentrador AS nomeconcentradororigem_str,
    CASE
        WHEN dc.id_concentrador_destino IS NULL
        THEN cd.ds_concentrador
        ELSE conc_dest.ds_concentrador ||
            ' - Aguardando recebimento'
    END AS nomeconcentradorlocalizado_str,
    CASE
        WHEN dc.id_concentrador_destino IS NULL
        THEN cd.id_concentrador
        ELSE conc_dest.id_concentrador
    END                                                       AS idconcentradorlocalizado,
    nvl2(dc.id_concentrador_destino, 1, 0)                    AS areceber,
    ica.nm_hierarquia_item                                    AS assunto_str,
    1                                                         AS idvisao,
    NULL                                                      AS idtiponatureza,
    NULL                                                      AS nometiponatureza_str,
    dc.st_envelopado                                          AS envelopado,
    dc.st_exibir_gerenciador                                  AS exibirgerenciador,
    DECODE(NVL(pj.st_arquivado, 0),
               0, 'N',
               'S')                                           AS arquivado,
    solr.pkg_solr.fnc_limpar_caracter(au.ds_objeto)           AS resumo_str,
    NULL                                                      AS situacaodocumento_str,
    TO_CHAR(au.dt_cadastro, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataautuacao_dt,
    cj.sigla                                                  AS siglaclasse_str,
    TO_CHAR(cp.dt_prazo, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')    AS dataprazofim_dt,
    ar.descricao                                              AS nomeareaatuacao_str,
    NULL                                                      AS nometiposituacaoae_str,
    -- DESIGNACAO
    NULL           AS nomedesignado_str,
    NULL           AS dataprevdevdesignacao_dt,
    NULL           AS idusuarioinclusaodesignacao,
    NULL           AS idsetorinclusaodesignacao,
    NULL           AS situacaosigilodesignacao,
    0              AS qtdedesignadosforasetor,
    0              AS minuta,
    0              AS minutadocsjuntados,
    anot.descricao AS textoultimaanotacao_str,
    NULL           AS textopesquisa,
    -- NVL(dn_distconclusao.id_distribuicao, dn_disttitular.id_distribuicao) AS iddistribuicaoresponsavel,
    -- uomacro_disttitular.id_unidade_organica                               AS idmacroresponsavel_str,
    -- uomacro_disttitular.nome                                              AS nomemacroresponsavel_str,
    -- NVL(of_distconclusao.id_oficio, of_disttitular.id_oficio)             AS idoficioresponsavel_str,
    -- NVL(of_distconclusao.nm_oficio, of_disttitular.nm_oficio)             AS nomeoficioresponsavel_str,
    -- NVL(tv_distconclusao.id_tipo_vinculo, 1)                              AS idtipovinculoresponsavel_str,
    -- NVL(tv_distconclusao.nm_tipo_vinculo, 'Titular')                      AS nometipovinculoresponsavel_str,
    dn_distconclusao.id_distribuicao          AS iddistribuicaoresponsavel,
    uomacro_distconclusao.id_unidade_organica AS idmacroresponsavel_str,
    uomacro_distconclusao.nome                AS nomemacroresponsavel_str,
    of_distconclusao.id_oficio                AS idoficioresponsavel_str,
    of_distconclusao.nm_oficio                AS nomeoficioresponsavel_str,
    tv_distconclusao.id_tipo_vinculo          AS idtipovinculoresponsavel_str,
    tv_distconclusao.nm_tipo_vinculo          AS nometipovinculoresponsavel_str,
    oj.id_orgao_julgador                      AS idorgaojulgador,
    oj.nome                                   AS orgaojulgador_str,
    CASE
        WHEN(og.url_consulta_processo IS NULL)
        THEN '0'
        WHEN(og.sigla = 'STF')
        THEN og.url_consulta_processo ||
                cj.sigla              ||
            '+'                       ||
                au.nr_autuacao_sem_mascara
        ELSE og.url_consulta_processo ||
                au.nr_autuacao_sem_mascara
    END                            AS linkprocesso_str,
    NVL(cd.id_unidade_organica, 0) AS idunidadeorganica,
    CASE
        WHEN(pj.id_area_atuacao IS NULL)
        THEN 0
        ELSE pj.id_area_atuacao
    END          AS idareaatuacao,
    ar.descricao AS areaatuacao_str,
    CASE
        WHEN jr.id_juiz_relator IS NULL
        THEN 0
        ELSE jr.id_juiz_relator
    END                      AS idrelator,
    jr.nome                  AS relator_str,
    au.id_autuacao           AS idautuacao,
    au.ds_etiqueta           AS etiquetaautuacao_str,
    au.nr_protocolo_registro AS numeroprotocoloregistro_str,
    CASE
        WHEN(op.id_operacao IS NULL)
        THEN 0
        ELSE op.id_operacao
    END                                                           AS idoperacaopolicial,
    op.nome                                                       AS operacaopolicial_str,
    TO_CHAR(mv.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS entrada_dt,
    au.id_orgao_governo                                           AS idorgaogerador,
    og.nome                                                       AS orgaogerador_str,
    og.dominio                                                    AS orgaogeradordominio_str,
    dc.st_urgente                                                 AS urgente_str,
    NULL                                                          AS semprioridade_str,
    CASE
        WHEN(cn.id_item_cnmp IS NULL)
        THEN 0
        ELSE cn.id_item_cnmp
    END          AS idclassejudiciaria,
    cj.descricao AS classejudiciaria_str,
    NULL         AS idtipodistribuicao,
    NULL         AS tipodistribuicao_str,
    NULL         AS idoficio,
    DECODE(NVL(idosos_e_reus_presos.reu_preso, 0),
               0, 'N',
               'S') AS reupreso_str,
    DECODE(NVL(idosos_e_reus_presos.idoso, 0),
               0, 'N',
               'S')                                                           AS parteprioritaria_str,
    NULL                                                                      AS iddesignado,
    nvl2(cp.dt_prazo, 'S', 'N')                                               AS existeprazodevolucao_str,
    TO_CHAR(cp.dt_prazo, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')                    AS prazodevolucao_dt,
    TO_CHAR(pj.dt_pena_minima, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')              AS penaminima_dt,
    TO_CHAR(pj.dt_pena_maxima, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')              AS penamaxima_dt,
    TO_CHAR(pj.dt_pena_minima_concreta, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')     AS penaminimaconcreta_dt,
    -- #Fabiana - as colunas uf, latitude e longitude foram anuladas, pois não estão sendo utilizadas pela aplicação, podendo ser retiradas do SOLR*/
    NULL                                                                      AS uf_str,
    NULL                            				  						  AS latitude,
    NULL										                              AS longitude,
    -- #Fabiana Fim
    NVL(sa.id_situacao_autuacao, 999)                                         AS idsituacaoautuacao,
    NVL(sa.nm_situacao_autuacao, 'Sem situação')                              AS situacaoautuacao_str,
    TO_CHAR(itmdp.dt_limite_para_conclusao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS limiteparaconclusao_dt,
    CASE
        WHEN ep.qt_entrada_procuradoria = 1
        THEN 'p'
        WHEN ep.qt_entrada_procuradoria > 1
        THEN 'r'
        ELSE 'n'
    END entradampfcd_str,
    CASE
        WHEN ep.qt_entrada_procuradoria = 1
        THEN '1ª Entrada'
        WHEN ep.qt_entrada_procuradoria > 1
        THEN 'Retorno'
        ELSE 'Nenhuma'
    END entradampf_str,
    nvl2(ica.cd_cnmp, ica.cd_cnmp ||
    ' - '                         ||
        ica.ds_item, NULL) AS assuntonivel_str,
    NULL AS possuiintimacao_str, -- #FABIANAG - 17/06/2022 -  coluna anulada, pois não estão sendo utilizada pela aplicação, podendo ser retiradas do SOLR.    
    CASE
        WHEN (aac.id_autuacao IS NOT NULL AND aac.QT_INTIMACAO_PENDENTE > 0) -- #FABIANAG - 17/06/2022 - acrescentei a condição aac.QT_INTIMACAO_PENDENTE > 0
        THEN 1
        ELSE 0
    END AS possuiintimacaopendente_str,
    NULL AS temintimacaocomerroenvio_str,
    NULL AS anotacoes,
    NULL AS datareferencia_dt,
    --DISTRIBUICAO
    NULL  AS siglaprocdistribuicao_str,
    NVL2(cd.id_unidade_organica,'Sim', 'Não') AS nompf_str,
    NULL AS nosetor_str,
    (SELECT
        CASE ep.st_vistas
            WHEN 1
            THEN 'Vistas'
            WHEN 0
            THEN 'Sem Vistas'
        END
    FROM
        unico.referencia_nova r
    WHERE r.id_tipo_referencia         = 5
        AND r.dt_finalizacao     IS NULL
        AND au.id_documento            = r.id_documento_secundario
        AND ep.st_principal            = 0
        AND ep.id_entrada_procuradoria = au.id_entrada_procuradoria_atual
        AND ROWNUM = 1
    ) AS tipoapenso_str,
    nvl2(tipoent.descricao, tipoent.descricao, '') ||
        nvl2(compentrada.descricao, ' - '          ||
        compentrada.descricao, '')                 ||
        nvl2(detent.descricao, ' - '               ||
        detent.descricao, '') AS motivoentrada_str,
    NULL                      AS ultimasaidaunidade_str,
    CASE
        WHEN unidorigem.id_unidade_organica_macro <> uniddestino.id_unidade_organica_macro
        THEN 1
        ELSE 0
    END      AS origemoutraunidademacro,
    og.sigla AS orgaogeradorsigla_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN nvl2(docmanif.id_documento, 'Sim', 'Não')
        ELSE 'Não'
    END AS possuimanifestacaoentrada_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN docmanif.etiqueta
        ELSE NULL
    END AS manifestacaoentradaatual_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao AND docmanif.st_digital = 1
        THEN
            CASE docmanif.id_tp_situ_assinatura_digital
                WHEN 0
                THEN 'Não Conclusa para Assinatura'
                WHEN 1
                THEN 'Conclusa para Assinatura'
                WHEN 2
                THEN 'Assinado Digitalmente'
                WHEN 3
                THEN 'Devolvida para Correção'
                WHEN 4
                THEN 'Enviada e não Assinada no Único'
                ELSE NULL
            END
        ELSE NULL
    END AS situacaoassinatura_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN ma.id_documento
        ELSE NULL
    END AS iddocmanifestacaoentradaatual,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN TO_CHAR(ma.data, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')
        ELSE NULL
    END AS dtmanifestacaoentradaatual_dt,
    jr.NOME AS juizrelator_str,
    DECODE(NVL(pj.st_materia_repetitiva, 0),
               0, 'Não',
               'Sim') AS materiarepetitiva_str,
    DECODE(NVL(cp.st_reu_preso, 0),
               0, 'Não',
               'Sim') AS reupresoclassificacao_str,
    TO_CHAR(dc.dt_localizacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dtlocalizacao_dt, 
    --#ULISSES - 15/06/2022 - Inicio
    NULL AS datatempoparado_dt, 
    NULL AS grupotematicoprincipal_str,
    --#ULISSES - 15/06/2022 - Fim
    --#FABIANAG - 17/06/2022 - INICIO
    CASE
        WHEN (aac.id_autuacao IS NOT NULL AND aac.QT_INTIMACAO_PENDENTE_NOVA  > 0)
        THEN 1
        ELSE 0
    END AS temintimacaopendentenova_str
    --#FABIANAG - 17/06/2022 - FIM
FROM
    unico.documento                    dc
    INNER JOIN unico.processo_judicial pj
        ON  dc.id_documento = pj.id_documento
    LEFT JOIN unico.area_atuacao ar
        ON  pj.id_area_atuacao = ar.id_area_atuacao
    LEFT JOIN unico.operacao op
        ON  pj.id_operacao = op.id_operacao
    INNER JOIN unico.autuacao au
        ON  pj.id_autuacao_vigente = au.id_autuacao
    LEFT JOIN unico.entrada_procuradoria ep
        ON  au.id_entrada_procuradoria_atual = ep.id_entrada_procuradoria
    LEFT JOIN unico.movimentacao mv
        ON  mv.id_movimentacao = ep.id_movimentacao_entrada
    LEFT JOIN unico.orgao_julgador oj
        ON  au.id_orgao_julgador = oj.id_orgao_julgador
    LEFT JOIN unico.juiz_relator jr
        ON  au.id_juiz_relator = jr.id_juiz_relator
    INNER JOIN unico.orgao_governo og
        ON  au.id_orgao_governo = og.id_orgao_governo
    -- No delta é LEFT
    LEFT JOIN unico.concentrador cd
        ON  dc.id_concentrador_localizado = cd.id_concentrador
    -- No delta é LEFT
    LEFT JOIN unico.concentrador conc_orig
        ON  dc.id_concentrador_origem = conc_orig.id_concentrador
    LEFT JOIN unico.concentrador conc_dest
        ON  dc.id_concentrador_destino = conc_dest.id_concentrador
    LEFT JOIN corporativo.unidade_organica unidorigem
        ON  unidorigem.id_unidade_organica = conc_orig.id_unidade_organica
    LEFT JOIN corporativo.unidade_organica uniddestino
        ON  uniddestino.id_unidade_organica = conc_dest.id_unidade_organica
    INNER JOIN unico.classe_judiciaria cj
        ON  au.id_classe_judiciario = cj.id_classe_judiciario
    LEFT JOIN unico.classificacao_processo cp
        ON  au.id_entrada_procuradoria_atual = cp.id_entrada_procuradoria
    LEFT JOIN unico.item_cnmp cn
        ON  cj.id_item_cnmp = cn.id_item_cnmp
    INNER JOIN corporativo.unidade_organica uo
        ON  dc.id_uorg_macro_cadastro = uo.id_unidade_organica
    LEFT JOIN corporativo.municipio mu1
        ON  uo.endereco_id_municipio = mu1.id_municipio
    LEFT JOIN unico.situacao_autuacao sa
        ON  au.id_situacao_autuacao = sa.id_situacao_autuacao
    LEFT JOIN unico.ipl_tco it
        ON  au.id_autuacao = it.id_autuacao
    LEFT JOIN unico.manifestacao ma
        ON  au.id_autuacao = ma.id_autuacao
    LEFT JOIN unico.ipl_tco_mani_dilacao_prazo itmdp
        ON  ma.id_documento                    = itmdp.id_documento_manifestacao
            AND itmdp.dt_conclusao_prazo IS NULL
    --#Pedro Passei para cima
    --LEFT JOIN unico.entrada_procuradoria ep ON  au.id_entrada_procuradoria_atual = ep.id_entrada_procuradoria
    --#Pedro Fim
    LEFT JOIN unico.item_cnmp_documento icd
        ON  au.id_documento           = icd.id_documento
            AND icd.st_tema_principal = 1
    LEFT JOIN unico.item_cnmp ica
        ON  icd.id_item_cnmp = ica.id_item_cnmp
            AND ica.tp_item  = 'A'
    INNER JOIN unico.genero gen
        ON  dc.id_genero = gen.id_genero --[monitorar] ?
    LEFT JOIN unico.anotacao anot
        ON  anot.id_documento = dc.id_documento
            AND anot.st_ativo = 1
    LEFT JOIN solr.agg_idosos_e_reus_presos idosos_e_reus_presos
        ON  dc.id_documento = idosos_e_reus_presos.id_documento
    -- FABIANAG - 17/06/2022 - Substituição da referência a tabela 
    LEFT JOIN UNICO_DESNORMALIZADO.AUTUACAO_AVISO_COMUNICACAO aac 
       ON  au.id_autuacao = aac.id_autuacao    
    -- FABIANAG - 17/06/2022 - Substituição da referência a tabela 
    LEFT JOIN unico.movimentacao_judicial mj_distconclusao
        ON  mj_distconclusao.id_movimentacao = ep.id_movimentacao_ulti_conclusao
            AND mj_distconclusao.id_fase_processo IN(4685,
                                                     7591)
    LEFT JOIN unico.distribuicao_nova dn_distconclusao
        ON  dn_distconclusao.id_distribuicao = mj_distconclusao.id_distribuicao
    -- A lógica de join original, problemática, fazia um "curto-circuito": dc->pj->au->ep->mj->dn->pj!!
    -- Portanto, evito o problema ao selecionar, depois (na cláusula WHERE), os ids que coincidem.
    -- AND NVL(dn_distconclusao.id_documento_distribuido, pj.id_documento) = pj.id_documento
    LEFT JOIN unico.oficio of_distconclusao
        ON  of_distconclusao.id_oficio = dn_distconclusao.id_oficio
    LEFT JOIN unico.tipo_vinculo tv_distconclusao
        ON  tv_distconclusao.id_tipo_vinculo = dn_distconclusao.id_tipo_vinculo
    LEFT JOIN corporativo.unidade_organica uomacro_distconclusao
        ON  uomacro_distconclusao.id_unidade_organica = dn_distconclusao.id_uorg_procuradoria
    LEFT JOIN unico.tipo_entrada tipoent
        ON  tipoent.id_tipo_entrada = cp.id_tipo_entrada
    LEFT JOIN unico.complemento_entrada compentrada
        ON  compentrada.id_complemento_entrada = cp.id_complemento_entrada
    LEFT JOIN unico.detalhamento_entrada detent
        ON  detent.id_detalhamento_entrada = cp.id_detalhamento_entrada
    LEFT JOIN unico.documento docmanif
        ON  docmanif.id_documento = ma.id_documento
WHERE dc.id_genero                = 92
    AND
    (cp.id_classificacao_processo IS NULL
        OR cp.id_classificacao_processo =
        (SELECT
            MAX(cp2.id_classificacao_processo)
        FROM
            unico.classificacao_processo cp2
        WHERE cp2.id_entrada_procuradoria = au.id_entrada_procuradoria_atual
        ))
    AND NVL(ma.id_documento, 1) = NVL(
                                       (SELECT
                                           MAX(ma0.id_documento)
                                       FROM
                                           unico.manifestacao ma0
                                       WHERE ma0.id_autuacao = au.id_autuacao
                                      ), 1)
    AND NVL(icd.id_item_cnmp_documento, 1) = NVL(
                                                  (SELECT
                                                      MAX(icd1.id_item_cnmp_documento)
                                                  FROM
                                                      unico.item_cnmp_documento icd1
                                                  WHERE au.id_documento          = icd1.id_documento
                                                      AND icd1.st_tema_principal = 1
                                                 ), 1)
    AND
    (anot.id_anotacao =
        (SELECT
            /*+ index (anot2 idx_anot_id_docu_st_ativo) */
            MAX(anot2.id_anotacao)
        FROM
            unico.anotacao anot2
        WHERE anot2.id_documento = dc.id_documento
            AND anot2.st_ativo   = 1
        )
        OR anot.id_anotacao IS NULL);

COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07"
IS
    'REV 001 - solr.views_gerenciador - ULISSES e FABIANAG em 17/06/2022 - JIRAs 9254, 8819 e 9456. Adicionados os campos DATATEMPOPARADO_DT, GRUPOTEMATICOPRINCIPAL_STR, TEMINTIMACAOPENDENTENOVA_STR.';


CREATE OR REPLACE FORCE VIEW "SOLR"."VW_GERENCIADOR_DOC07_10" ("ID", "ETIQUETAEXPEDIENTE_STR", "IDGENERO", "NOMEGENERO_STR", "NOMESIGILO_STR", "DATAMOVIMENTACAO_DT", "DATARECEBIMENTO_DT", "ELETRONICO", "NOMECONCENTRADORORIGEM_STR", "NOMECONCENTRADORLOCALIZADO_STR", "IDCONCENTRADORLOCALIZADO", "ARECEBER", "ASSUNTO_STR", "IDVISAO", "IDTIPONATUREZA", "NOMETIPONATUREZA_STR", "ENVELOPADO", "EXIBIRGERENCIADOR", "ARQUIVADO", "RESUMO_STR", "SITUACAODOCUMENTO_STR", "DATAAUTUACAO_DT", "SIGLACLASSE_STR", "DATAPRAZOFIM_DT", "NOMEAREAATUACAO_STR", "NOMETIPOSITUACAOAE_STR", "NOMEDESIGNADO_STR", "DATAPREVDEVDESIGNACAO_DT", "IDUSUARIOINCLUSAODESIGNACAO", "IDSETORINCLUSAODESIGNACAO", "SITUACAOSIGILODESIGNACAO", "QTDEDESIGNADOSFORASETOR", "MINUTA", "MINUTADOCSJUNTADOS", "TEXTOULTIMAANOTACAO_STR", "TEXTOPESQUISA", "IDDISTRIBUICAORESPONSAVEL", "IDMACRORESPONSAVEL_STR", "NOMEMACRORESPONSAVEL_STR", "IDOFICIORESPONSAVEL_STR", "NOMEOFICIORESPONSAVEL_STR", "IDTIPOVINCULORESPONSAVEL_STR", "NOMETIPOVINCULORESPONSAVEL_STR", "IDORGAOJULGADOR", "ORGAOJULGADOR_STR", "LINKPROCESSO_STR", "IDUNIDADEORGANICA", "IDAREAATUACAO", "AREAATUACAO_STR", "IDRELATOR", "RELATOR_STR", "IDAUTUACAO", "ETIQUETAAUTUACAO_STR", "NUMEROPROTOCOLOREGISTRO_STR", "IDOPERACAOPOLICIAL", "OPERACAOPOLICIAL_STR", "ENTRADA_DT", "IDORGAOGERADOR", "ORGAOGERADOR_STR", "ORGAOGERADORDOMINIO_STR", "URGENTE_STR", "SEMPRIORIDADE_STR", "IDCLASSEJUDICIARIA", "CLASSEJUDICIARIA_STR", "IDTIPODISTRIBUICAO", "TIPODISTRIBUICAO_STR", "IDOFICIO", "REUPRESO_STR", "PARTEPRIORITARIA_STR", "IDDESIGNADO", "EXISTEPRAZODEVOLUCAO_STR", "PRAZODEVOLUCAO_DT", "PENAMINIMA_DT", "PENAMAXIMA_DT", "PENAMINIMACONCRETA_DT", "UF_STR", "LATITUDE", "LONGITUDE", "IDSITUACAOAUTUACAO", "SITUACAOAUTUACAO_STR", "LIMITEPARACONCLUSAO_DT", "ENTRADAMPFCD_STR", "ENTRADAMPF_STR", "ASSUNTONIVEL_STR", "POSSUIINTIMACAO_STR", "POSSUIINTIMACAOPENDENTE_STR", "TEMINTIMACAOCOMERROENVIO_STR", "ANOTACOES", "DATAREFERENCIA_DT", "SIGLAPROCDISTRIBUICAO_STR", "NOMPF_STR", "NOSETOR_STR", "TIPOAPENSO_STR", "MOTIVOENTRADA_STR", "ULTIMASAIDAUNIDADE_STR", "ORIGEMOUTRAUNIDADEMACRO", "ORGAOGERADORSIGLA_STR", "POSSUIMANIFESTACAOENTRADA_STR", "MANIFESTACAOENTRADAATUAL_STR", "SITUACAOASSINATURA_STR", "IDDOCMANIFESTACAOENTRADAATUAL", "DTMANIFESTACAOENTRADAATUAL_DT", "JUIZRELATOR_STR", "MATERIAREPETITIVA_STR", "REUPRESOCLASSIFICACAO_STR", "DTLOCALIZACAO_DT", "DATATEMPOPARADO_DT", "GRUPOTEMATICOPRINCIPAL_STR", "TEMINTIMACAOPENDENTENOVA_STR") AS
SELECT
    docu.id_documento AS id,
    docu.etiqueta     AS etiquetaexpediente_str,
    docu.id_genero    AS idgenero,
    gene.descricao    AS nomegenero_str,
    DECODE(docu.st_sigilo,
               'N', 'Normal',
               'R', 'Reservado',
               'C', 'Confidencial')                                 AS nomesigilo_str,
    TO_CHAR(docu.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS datamovimentacao_dt,
    TO_CHAR(mov.dt_recebimento, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')   AS datarecebimento_dt,
    DECODE(docu.st_digital,
               NULL, 0,
               docu.st_digital) AS eletronico,
    conc_orig.ds_concentrador   AS nomeconcentradororigem_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.ds_concentrador
        ELSE conc_dest.ds_concentrador ||
            ' - Aguardando recebimento'
    END AS nomeconcentradorlocalizado_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.id_concentrador
        ELSE conc_dest.id_concentrador
    END                                      AS idconcentradorlocalizado,
    nvl2(docu.id_concentrador_destino, 1, 0) AS areceber,
    nvl2(itcn.cd_cnmp, itcn.cd_cnmp ||
    ' - '                           ||
        itcn.ds_item, NULL)                           AS assunto_str,
    3                                                 AS idvisao,
    ticc.id_tipo_natureza                             AS idtiponatureza,
    tpna.ds_tipo_natureza                             AS nometiponatureza_str,
    docu.st_envelopado                                AS envelopado,
    docu.st_exibir_gerenciador                        AS exibirgerenciador,
    auad.st_arquivado                                 AS arquivado,
    solr.pkg_solr.fnc_limpar_caracter(auad.ds_resumo) AS resumo_str,
    NULL                                              AS situacaodocumento_str,
    -- EXTRAJUDICIAL
    TO_CHAR(auad.dt_autuacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataautuacao_dt,
    ticc.sg_tipo_classe_cnmp                                    AS siglaclasse_str,
    TO_CHAR(copf.dt_fim, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')      AS dataprazofim_dt,
    arat.descricao                                              AS nomeareaatuacao_str,
    tisi.ds_tipo_situacao_ae                        ||
        nvl2(cosi.ds_complemento_situacao_ae, ' - ' ||
        cosi.ds_complemento_situacao_ae, NULL) AS nometiposituacaoae_str,
    -- DESIGNACAO
    NULL                     AS nomedesignado_str,
    NULL                     AS dataprevdevdesignacao_dt,
    NULL                     AS idusuarioinclusaodesignacao,
    NULL                     AS idsetorinclusaodesignacao,
    NULL                     AS situacaosigilodesignacao,
    0                        AS qtdedesignadosforasetor,
    0                        AS minuta,
    agmj.qt_minutas_juntadas AS minutadocsjuntados,
    -- ANOTAÇÃO
    anot.descricao AS textoultimaanotacao_str,
    NULL           AS textopesquisa,
    --versao doc3
    dino.id_distribuicao           AS iddistribuicaoresponsavel,
    unor.id_unidade_organica_macro AS idmacroresponsavel_str,
    unma.nome                      AS nomemacroresponsavel_str,
    ofic.id_oficio                 AS idoficioresponsavel_str,
    solr.pkg_solr.fnc_limpar_caracter(ofic.nm_oficio)               AS nomeoficioresponsavel_str,
    dino.id_tipo_vinculo                                            AS idtipovinculoresponsavel_str,
    tivi.nm_tipo_vinculo                                            AS nometipovinculoresponsavel_str,
    -- campos novos do JUDICIAL
    NULL AS idorgaojulgador,
    NULL AS orgaojulgador_str,
    NULL AS linkprocesso_str,
    NULL AS idunidadeorganica,
    NULL AS idareaatuacao,
    NULL AS areaatuacao_str,
    NULL AS idrelator,
    NULL AS relator_str,
    NULL AS idautuacao,
    NULL AS etiquetaautuacao_str,
    NULL AS numeroprotocoloregistro_str,
    NULL AS idoperacaopolicial,
    NULL AS operacaopolicial_str,
    NULL AS entrada_dt,
    NULL AS idorgaogerador,
    NULL AS orgaogerador_str,
    NULL AS orgaogeradordominio_str,
    docu.st_urgente                                                 AS urgente_str,
    NULL AS semprioridade_str,
    NULL AS idclassejudiciaria,
    NULL AS classejudiciaria_str,
    NULL AS idtipodistribuicao,
    NULL AS tipodistribuicao_str,
    NULL AS idoficio,
    NULL AS reupreso_str,
    NULL AS parteprioritaria_str,
    NULL AS iddesignado,
    NULL AS existeprazodevolucao_str,
    NULL AS prazodevolucao_dt,
    NULL AS penaminima_dt,
    NULL AS penamaxima_dt,
    NULL AS penaminimaconcreta_dt,
    NULL AS uf_str,
    NULL AS latitude,
    NULL AS longitude,
    NULL AS idsituacaoautuacao,
    NULL AS situacaoautuacao_str,
    NULL AS limiteparaconclusao_dt,
    NULL AS entradampfcd_str,
    NULL AS entradampf_str,
    NULL AS assuntonivel_str,
    NULL AS possuiintimacao_str,
    NULL AS possuiintimacaopendente_str,
    NULL AS temintimacaocomerroenvio_str,
    NULL AS anotacoes,
    NULL AS datareferencia_dt,
    NULL AS siglaprocdistribuicao_str,
    NULL AS nompf_str,
    NULL AS nosetor_str,
    NULL AS tipoapenso_str,
    NULL AS motivoentrada_str,
    NULL AS ultimasaidaunidade_str,
    NULL AS origemoutraunidademacro,
    NULL AS orgaogeradorsigla_str,
    NULL AS possuimanifestacaoentrada_str,
    NULL AS manifestacaoentradaatual_str,
    NULL AS situacaoassinatura_str,
    NULL AS iddocmanifestacaoentradaatual,
    NULL AS dtmanifestacaoentradaatual_dt,
    NULL AS juizrelator_str,
    NULL AS materiarepetitiva_str,
    NULL AS reupresoclassificacao_str,
    NULL AS dtlocalizacao_dt,
    --#ULISSES - 15/06/2022 - INICIO
    to_char(duoe.DT_ULTIMA_OCORRENCIA, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') as datatempoparado_dt, 
    cam.descricao as grupotematicoprincipal_str,
    --#ULISSES - 15/06/2022 - FIM       
    --#FABIANAG - 17/06/2022 - INICIO
    NULL AS temintimacaopendentenova_str
    --#FABIANAG - 17/06/2022 - FIM
FROM
    unico.documento              docu
    LEFT JOIN unico.movimentacao mov
        ON  mov.id_movimentacao                    = docu.id_movimentacao
            AND docu.id_concentrador_destino IS NULL
    -- No delta é LEFT
    LEFT JOIN unico.concentrador cl
        ON  cl.id_concentrador = docu.id_concentrador_localizado
    -- No delta é LEFT
    LEFT JOIN unico.concentrador conc_orig
        ON  docu.id_concentrador_origem = conc_orig.id_concentrador
    LEFT JOIN unico.concentrador conc_dest
        ON  docu.id_concentrador_destino = conc_dest.id_concentrador
    INNER JOIN unico.genero gene
        ON  docu.id_genero = gene.id_genero
    -- AUTO ADMINISTRATIVO
    INNER JOIN unico.auto_administrativo auad
        ON  docu.id_documento = auad.id_documento
    LEFT JOIN unico.item_cnmp_documento itcd
        ON  docu.id_documento          = itcd.id_documento
            AND itcd.st_tema_principal = 1
    LEFT JOIN unico.item_cnmp itcn
        ON  itcd.id_item_cnmp = itcn.id_item_cnmp
    INNER JOIN unico.tipo_classe_cnmp ticc
        ON  auad.id_tipo_classe_cnmp_atual = ticc.id_tipo_classe_cnmp
    INNER JOIN unico.tipo_natureza tpna
        ON  ticc.id_tipo_natureza = tpna.id_tipo_natureza
    LEFT JOIN unico.controle_prazo_finalizacao copf
        ON  auad.id_controle_prazo_finalizacao = copf.id_controle_prazo_finalizacao
    INNER JOIN unico.area_atuacao arat
        ON  auad.id_area_atuacao = arat.id_area_atuacao
    LEFT JOIN unico.historico_situacao_ae hisi
        ON  auad.id_historico_situacao_ae = hisi.id_historico_situacao_ae
    LEFT JOIN unico.tipo_situacao_ae tisi
        ON  hisi.id_tipo_situacao_ae = tisi.id_tipo_situacao_ae
    LEFT JOIN unico.complemento_situacao_ae cosi
        ON  cosi.id_complemento_situacao_ae = hisi.id_complemento_situacao_ae
    -- ANOTAÇÃO
    /*LEFT JOIN
    (SELECT
    anot1.descricao,
    anot1.dt_inclusao,
    anot1.id_anotacao,
    anot1.id_documento id_documento
    FROM
    unico.anotacao anot1
    WHERE anot1.st_ativo      = 1
    AND anot1.id_anotacao =
    (SELECT
    MAX(anot2.id_anotacao)
    FROM
    unico.anotacao anot2
    WHERE anot2.id_documento = anot1.id_documento
    AND anot2.st_ativo   = 1
    )
    ) anot
    ON  anot.id_documento = docu.id_documento*/
    LEFT JOIN unico.anotacao anot
        ON  anot.id_documento = docu.id_documento
            AND anot.st_ativo = 1
    LEFT JOIN solr.agg_minuta_juntada agmj
        ON  docu.id_documento = agmj.id_documento
    LEFT JOIN unico.distribuicao_nova dino
        ON  dino.id_distribuicao = auad.id_distribuicao_responsavel
    LEFT JOIN unico.tipo_vinculo tivi
        ON  tivi.id_tipo_vinculo = dino.id_tipo_vinculo
    LEFT JOIN unico.oficio ofic
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
    --#ULISSES - 15.06.2022 - Inicio        
	LEFT JOIN unico_desnormalizado.documento_ultima_ocor_expe duoe 
	    ON duoe.id_documento = docu.id_documento
	LEFT JOIN unico.documento_grupo_tematico dgt 
		ON docu.id_documento = dgt.id_documento
			and dgt.st_grupo_tematico_principal = 1		
	LEFT JOIN unico.camara cam 
		ON dgt.id_grupo_tematico = cam.id_camara
    --#ULISSES - 15.06.2022 - Fim		
WHERE docu.id_genero       = 10
    AND
    (anot.id_anotacao =
        (SELECT
            MAX(anot2.id_anotacao)
        FROM
            unico.anotacao anot2
        WHERE anot2.id_documento = docu.id_documento
            AND anot2.st_ativo   = 1
        )
        OR anot.id_anotacao IS NULL);

COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_10"
IS
    'REV 001 - solr.views_gerenciador - ULISSES e FABIANAG em 17/06/2022 - JIRAs 9254, 8819 e 9456. Adicionados os campos DATATEMPOPARADO_DT, GRUPOTEMATICOPRINCIPAL_STR, TEMINTIMACAOPENDENTENOVA_STR.';


CREATE OR REPLACE FORCE VIEW "SOLR"."VW_GERENCIADOR_DOC07_41" ("ID", "ETIQUETAEXPEDIENTE_STR", "IDGENERO", "NOMEGENERO_STR", "NOMESIGILO_STR", "DATAMOVIMENTACAO_DT", "DATARECEBIMENTO_DT", "ELETRONICO", "NOMECONCENTRADORORIGEM_STR", "NOMECONCENTRADORLOCALIZADO_STR", "IDCONCENTRADORLOCALIZADO", "ARECEBER", "ASSUNTO_STR", "IDVISAO", "IDTIPONATUREZA", "NOMETIPONATUREZA_STR", "ENVELOPADO", "EXIBIRGERENCIADOR", "ARQUIVADO", "RESUMO_STR", "SITUACAODOCUMENTO_STR", "DATAAUTUACAO_DT", "SIGLACLASSE_STR", "DATAPRAZOFIM_DT", "NOMEAREAATUACAO_STR", "NOMETIPOSITUACAOAE_STR", "NOMEDESIGNADO_STR", "DATAPREVDEVDESIGNACAO_DT", "IDUSUARIOINCLUSAODESIGNACAO", "IDSETORINCLUSAODESIGNACAO", "SITUACAOSIGILODESIGNACAO", "QTDEDESIGNADOSFORASETOR", "MINUTA", "MINUTADOCSJUNTADOS", "TEXTOULTIMAANOTACAO_STR", "TEXTOPESQUISA", "IDDISTRIBUICAORESPONSAVEL", "IDMACRORESPONSAVEL_STR", "NOMEMACRORESPONSAVEL_STR", "IDOFICIORESPONSAVEL_STR", "NOMEOFICIORESPONSAVEL_STR", "IDTIPOVINCULORESPONSAVEL_STR", "NOMETIPOVINCULORESPONSAVEL_STR", "IDORGAOJULGADOR", "ORGAOJULGADOR_STR", "LINKPROCESSO_STR", "IDUNIDADEORGANICA", "IDAREAATUACAO", "AREAATUACAO_STR", "IDRELATOR", "RELATOR_STR", "IDAUTUACAO", "ETIQUETAAUTUACAO_STR", "NUMEROPROTOCOLOREGISTRO_STR", "IDOPERACAOPOLICIAL", "OPERACAOPOLICIAL_STR", "ENTRADA_DT", "IDORGAOGERADOR", "ORGAOGERADOR_STR", "ORGAOGERADORDOMINIO_STR", "URGENTE_STR", "SEMPRIORIDADE_STR", "IDCLASSEJUDICIARIA", "CLASSEJUDICIARIA_STR", "IDTIPODISTRIBUICAO", "TIPODISTRIBUICAO_STR", "IDOFICIO", "REUPRESO_STR", "PARTEPRIORITARIA_STR", "IDDESIGNADO", "EXISTEPRAZODEVOLUCAO_STR", "PRAZODEVOLUCAO_DT", "PENAMINIMA_DT", "PENAMAXIMA_DT", "PENAMINIMACONCRETA_DT", "UF_STR", "LATITUDE", "LONGITUDE", "IDSITUACAOAUTUACAO", "SITUACAOAUTUACAO_STR", "LIMITEPARACONCLUSAO_DT", "ENTRADAMPFCD_STR", "ENTRADAMPF_STR", "ASSUNTONIVEL_STR", "POSSUIINTIMACAO_STR", "POSSUIINTIMACAOPENDENTE_STR", "TEMINTIMACAOCOMERROENVIO_STR", "ANOTACOES", "DATAREFERENCIA_DT", "SIGLAPROCDISTRIBUICAO_STR", "NOMPF_STR", "NOSETOR_STR", "TIPOAPENSO_STR", "MOTIVOENTRADA_STR", "ULTIMASAIDAUNIDADE_STR", "ORIGEMOUTRAUNIDADEMACRO", "ORGAOGERADORSIGLA_STR", "POSSUIMANIFESTACAOENTRADA_STR", "MANIFESTACAOENTRADAATUAL_STR", "SITUACAOASSINATURA_STR", "IDDOCMANIFESTACAOENTRADAATUAL", "DTMANIFESTACAOENTRADAATUAL_DT", "JUIZRELATOR_STR", "MATERIAREPETITIVA_STR", "REUPRESOCLASSIFICACAO_STR", "DTLOCALIZACAO_DT", "DATATEMPOPARADO_DT", "GRUPOTEMATICOPRINCIPAL_STR", "TEMINTIMACAOPENDENTENOVA_STR") AS
SELECT
    docu.id_documento AS id,
    docu.etiqueta     AS etiquetaexpediente_str,
    docu.id_genero    AS idgenero,
    gene.descricao    AS nomegenero_str,
    DECODE(docu.st_sigilo,
               'N', 'Normal',
               'R', 'Reservado',
               'C', 'Confidencial')                                 AS nomesigilo_str,
    TO_CHAR(docu.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS datamovimentacao_dt,
    TO_CHAR(mov.dt_recebimento, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')   AS datarecebimento_dt,
    DECODE(docu.st_digital,
               NULL, 0,
               docu.st_digital) AS eletronico,
    conc_orig.ds_concentrador   AS nomeconcentradororigem_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.ds_concentrador
        ELSE conc_dest.ds_concentrador ||
            ' - Aguardando recebimento'
    END AS nomeconcentradorlocalizado_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.id_concentrador
        ELSE conc_dest.id_concentrador
    END                                      AS idconcentradorlocalizado,
    nvl2(docu.id_concentrador_destino, 1, 0) AS areceber,
    assu.descricao                           AS assunto_str,
    2                                        AS idvisao,
    CASE doad.st_natureza
        WHEN 'X'
        THEN 3
        WHEN 'A'
        THEN 2
        WHEN 'J'
        THEN 1
        ELSE NULL
    END AS idtiponatureza,
    CASE doad.st_natureza
        WHEN 'X'
        THEN 'Extrajudicial'
        WHEN 'A'
        THEN 'Administrativa'
        WHEN 'J'
        THEN 'Judicial'
        ELSE NULL
    END                                               AS nometiponatureza_str,
    docu.st_envelopado                                AS envelopado,
    docu.st_exibir_gerenciador                        AS exibirgerenciador,
    doad.st_arquivado                                 AS arquivado,
    solr.pkg_solr.fnc_limpar_caracter(doad.ds_resumo) AS resumo_str,
    CASE
        WHEN doad.st_congelado    = 'S'
            AND doad.st_documento = 'C'
        THEN 'Original Congelado'
        WHEN doad.st_documento = 'P'
        THEN 'Pendente'
        WHEN doad.id_documento_originador IS NOT NULL
        THEN 'Cópia'
        ELSE DECODE(doad.st_documento,
                        'N', 'Normal',
                        'C', 'Original',
                        'F', 'Finalizado')
    END AS situacaodocumento_str,
    -- EXTRAJUDICIAL
    TO_CHAR(docu.dt_cadastro, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataautuacao_dt,
    tido.descricao                                              AS siglaclasse_str,
    TO_CHAR(doad.dt_limite, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')   AS dataprazofim_dt,
    NULL                                                        AS nomeareaatuacao_str,
    NULL                                                        AS nometiposituacaoae_str,
    -- DESIGNACAO
    NULL                     AS nomedesignado_str,
    NULL                     AS dataprevdevdesignacao_dt,
    NULL                     AS idusuarioinclusaodesignacao,
    NULL                     AS idsetorinclusaodesignacao,
    NULL                     AS situacaosigilodesignacao,
    0                        AS qtdedesignadosforasetor,
    doad.st_minuta           AS minuta,
    agmj.qt_minutas_juntadas AS minutadocsjuntados,
    -- ANOTAÇÃO
    anot.descricao AS textoultimaanotacao_str,
    NULL           AS textopesquisa,
    NULL           AS iddistribuicaoresponsavel,
    NULL           AS idmacroresponsavel_str,
    NULL           AS nomemacroresponsavel_str,
    NULL           AS idoficioresponsavel_str,
    NULL           AS nomeoficioresponsavel_str,
    NULL           AS idtipovinculoresponsavel_str,
    NULL           AS nometipovinculoresponsavel_str,
    -- campos novos do JUDICIAL
    NULL AS idorgaojulgador,
    NULL AS orgaojulgador_str,
    NULL AS linkprocesso_str,
    NULL AS idunidadeorganica,
    NULL AS idareaatuacao,
    NULL AS areaatuacao_str,
    NULL AS idrelator,
    NULL AS relator_str,
    NULL AS idautuacao,
    NULL AS etiquetaautuacao_str,
    NULL AS numeroprotocoloregistro_str,
    NULL AS idoperacaopolicial,
    NULL AS operacaopolicial_str,
    NULL AS entrada_dt,
    NULL AS idorgaogerador,
    NULL AS orgaogerador_str,
    NULL AS orgaogeradordominio_str,
    NULL AS urgente_str,
    NULL AS semprioridade_str,
    NULL AS idclassejudiciaria,
    NULL AS classejudiciaria_str,
    NULL AS idtipodistribuicao,
    NULL AS tipodistribuicao_str,
    NULL AS idoficio,
    NULL AS reupreso_str,
    NULL AS parteprioritaria_str,
    NULL AS iddesignado,
    NULL AS existeprazodevolucao_str,
    NULL AS prazodevolucao_dt,
    NULL AS penaminima_dt,
    NULL AS penamaxima_dt,
    NULL AS penaminimaconcreta_dt,
    NULL AS uf_str,
    NULL AS latitude,
    NULL AS longitude,
    NULL AS idsituacaoautuacao,
    NULL AS situacaoautuacao_str,
    NULL AS limiteparaconclusao_dt,
    NULL AS entradampfcd_str,
    NULL AS entradampf_str,
    NULL AS assuntonivel_str,
    NULL AS possuiintimacao_str,
    NULL AS possuiintimacaopendente_str,
    NULL AS temintimacaocomerroenvio_str,
    NULL AS anotacoes,
    NULL AS datareferencia_dt,
    NULL AS siglaprocdistribuicao_str,
    NULL AS nompf_str,
    NULL AS nosetor_str,
    NULL AS tipoapenso_str,
    NULL AS motivoentrada_str,
    NULL AS ultimasaidaunidade_str,
    NULL AS origemoutraunidademacro,
    NULL AS orgaogeradorsigla_str,
    NULL AS possuimanifestacaoentrada_str,
    NULL AS manifestacaoentradaatual_str,
    NULL AS situacaoassinatura_str,
    NULL AS iddocmanifestacaoentradaatual,
    NULL AS dtmanifestacaoentradaatual_dt,
    NULL AS juizrelator_str,
    NULL AS materiarepetitiva_str,
    NULL AS reupresoclassificacao_str,
    NULL AS dtlocalizacao_dt,
    --#ULISSES - 15.06.2022 - Inicio
    NULL AS datatempoparado_dt, 
    NULL AS grupotematicoprincipal_str,
    --#ULISSES - 15.06.2022 - Fim
    --#FABIANAG - 17/06/2022 - INICIO
    NULL AS temintimacaopendentenova_str
    --#FABIANAG - 17/06/2022 - FIM     
FROM
    unico.documento              docu
    LEFT JOIN unico.movimentacao mov
        ON  mov.id_movimentacao                    = docu.id_movimentacao
            AND docu.id_concentrador_destino IS NULL
    -- No delta é LEFT
    LEFT JOIN unico.concentrador cl
        ON  cl.id_concentrador = docu.id_concentrador_localizado
    LEFT JOIN unico.concentrador conc_orig
        ON  docu.id_concentrador_origem = conc_orig.id_concentrador
    LEFT JOIN unico.concentrador conc_dest
        ON  docu.id_concentrador_destino = conc_dest.id_concentrador
    INNER JOIN unico.genero gene
        ON  docu.id_genero = gene.id_genero
    LEFT JOIN unico.assunto assu
        ON  docu.id_assunto = assu.id_assunto
    -- DOCUMENTO ADMINISTRATIVO
    INNER JOIN unico.documento_administrativo doad
        ON  docu.id_documento = doad.id_documento
    INNER JOIN unico.tipo_documento tido
        ON  doad.id_tipo_documento = tido.id_tipo_documento
    -- ANOTAÇÃO
    /*LEFT JOIN
    (SELECT
    anot1.descricao,
    anot1.dt_inclusao,
    anot1.id_anotacao,
    anot1.id_documento id_documento
    FROM
    unico.anotacao anot1
    WHERE anot1.st_ativo      = 1
    AND anot1.id_anotacao =
    (SELECT
    MAX(anot2.id_anotacao)
    FROM
    unico.anotacao anot2
    WHERE anot2.id_documento = anot1.id_documento
    AND anot2.st_ativo   = 1
    )
    ) anot
    ON  anot.id_documento = docu.id_documento*/
    LEFT JOIN unico.anotacao anot
        ON  anot.id_documento = docu.id_documento
            AND anot.st_ativo = 1
    LEFT JOIN solr.agg_minuta_juntada agmj
        ON  docu.id_documento = agmj.id_documento	   
WHERE docu.id_genero          = 41
    AND
    (anot.id_anotacao =
        (SELECT
            MAX(anot2.id_anotacao)
        FROM
            unico.anotacao anot2
        WHERE anot2.id_documento = docu.id_documento
            AND anot2.st_ativo   = 1
        )
        OR anot.id_anotacao IS NULL);

COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_41"
IS
    'REV 001 - solr.views_gerenciador - ULISSES e FABIANAG em 17/06/2022 - JIRAs 9254, 8819 e 9456. Adicionados os campos DATATEMPOPARADO_DT, GRUPOTEMATICOPRINCIPAL_STR, TEMINTIMACAOPENDENTENOVA_STR.';


CREATE OR REPLACE FORCE VIEW "SOLR"."VW_GERENCIADOR_DOC07_92" ("ID", "ETIQUETAEXPEDIENTE_STR", "IDGENERO", "NOMEGENERO_STR", "NOMESIGILO_STR", "DATAMOVIMENTACAO_DT", "DATARECEBIMENTO_DT", "ELETRONICO", "NOMECONCENTRADORORIGEM_STR", "NOMECONCENTRADORLOCALIZADO_STR", "IDCONCENTRADORLOCALIZADO", "ARECEBER", "ASSUNTO_STR", "IDVISAO", "IDTIPONATUREZA", "NOMETIPONATUREZA_STR", "ENVELOPADO", "EXIBIRGERENCIADOR", "ARQUIVADO", "RESUMO_STR", "SITUACAODOCUMENTO_STR", "DATAAUTUACAO_DT", "SIGLACLASSE_STR", "DATAPRAZOFIM_DT", "NOMEAREAATUACAO_STR", "NOMETIPOSITUACAOAE_STR", "NOMEDESIGNADO_STR", "DATAPREVDEVDESIGNACAO_DT", "IDUSUARIOINCLUSAODESIGNACAO", "IDSETORINCLUSAODESIGNACAO", "SITUACAOSIGILODESIGNACAO", "QTDEDESIGNADOSFORASETOR", "MINUTA", "MINUTADOCSJUNTADOS", "TEXTOULTIMAANOTACAO_STR", "TEXTOPESQUISA", "IDDISTRIBUICAORESPONSAVEL", "IDMACRORESPONSAVEL_STR", "NOMEMACRORESPONSAVEL_STR", "IDOFICIORESPONSAVEL_STR", "NOMEOFICIORESPONSAVEL_STR", "IDTIPOVINCULORESPONSAVEL_STR", "NOMETIPOVINCULORESPONSAVEL_STR", "IDORGAOJULGADOR", "ORGAOJULGADOR_STR", "LINKPROCESSO_STR", "IDUNIDADEORGANICA", "IDAREAATUACAO", "AREAATUACAO_STR", "IDRELATOR", "RELATOR_STR", "IDAUTUACAO", "ETIQUETAAUTUACAO_STR", "NUMEROPROTOCOLOREGISTRO_STR", "IDOPERACAOPOLICIAL", "OPERACAOPOLICIAL_STR", "ENTRADA_DT", "IDORGAOGERADOR", "ORGAOGERADOR_STR", "ORGAOGERADORDOMINIO_STR", "URGENTE_STR", "SEMPRIORIDADE_STR", "IDCLASSEJUDICIARIA", "CLASSEJUDICIARIA_STR", "IDTIPODISTRIBUICAO", "TIPODISTRIBUICAO_STR", "IDOFICIO", "REUPRESO_STR", "PARTEPRIORITARIA_STR", "IDDESIGNADO", "EXISTEPRAZODEVOLUCAO_STR", "PRAZODEVOLUCAO_DT", "PENAMINIMA_DT", "PENAMAXIMA_DT", "PENAMINIMACONCRETA_DT", "UF_STR", "LATITUDE", "LONGITUDE", "IDSITUACAOAUTUACAO", "SITUACAOAUTUACAO_STR", "LIMITEPARACONCLUSAO_DT", "ENTRADAMPFCD_STR", "ENTRADAMPF_STR", "ASSUNTONIVEL_STR", "POSSUIINTIMACAO_STR", "POSSUIINTIMACAOPENDENTE_STR", "TEMINTIMACAOCOMERROENVIO_STR", "ANOTACOES", "DATAREFERENCIA_DT", "SIGLAPROCDISTRIBUICAO_STR", "NOMPF_STR", "NOSETOR_STR", "TIPOAPENSO_STR", "MOTIVOENTRADA_STR", "ULTIMASAIDAUNIDADE_STR", "ORIGEMOUTRAUNIDADEMACRO", "ORGAOGERADORSIGLA_STR", "POSSUIMANIFESTACAOENTRADA_STR", "MANIFESTACAOENTRADAATUAL_STR", "SITUACAOASSINATURA_STR", "IDDOCMANIFESTACAOENTRADAATUAL", "DTMANIFESTACAOENTRADAATUAL_DT", "JUIZRELATOR_STR", "MATERIAREPETITIVA_STR", "REUPRESOCLASSIFICACAO_STR", "DTLOCALIZACAO_DT", "DATATEMPOPARADO_DT", "GRUPOTEMATICOPRINCIPAL_STR", "TEMINTIMACAOPENDENTENOVA_STR") AS
SELECT
    dc.id_documento AS id,
    au.ds_etiqueta  AS etiquetaexpediente_str,
    dc.id_genero    AS idgenero,
    gen.descricao   AS nomegenero_str,
    DECODE(dc.st_sigilo,
               'N', 'Normal',
               'R', 'Reservado',
               'C', 'Confidencial')                               AS nomesigilo_str,
    TO_CHAR(mv.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS datamovimentacao_dt,
    TO_CHAR(mv.dt_recebimento, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')  AS datarecebimento_dt,
    DECODE(dc.st_digital,
               NULL, 0,
               dc.st_digital) AS eletronico,
    conc_orig.ds_concentrador AS nomeconcentradororigem_str,
    CASE
        WHEN dc.id_concentrador_destino IS NULL
        THEN cd.ds_concentrador
        ELSE conc_dest.ds_concentrador ||
            ' - Aguardando recebimento'
    END AS nomeconcentradorlocalizado_str,
    CASE
        WHEN dc.id_concentrador_destino IS NULL
        THEN cd.id_concentrador
        ELSE conc_dest.id_concentrador
    END                                                       AS idconcentradorlocalizado,
    nvl2(dc.id_concentrador_destino, 1, 0)                    AS areceber,
    ica.nm_hierarquia_item                                    AS assunto_str,
    1                                                         AS idvisao,
    NULL                                                      AS idtiponatureza,
    NULL                                                      AS nometiponatureza_str,
    dc.st_envelopado                                          AS envelopado,
    dc.st_exibir_gerenciador                                  AS exibirgerenciador,
    DECODE(NVL(pj.st_arquivado, 0),
               0, 'N',
               'S')                                           AS arquivado,
    solr.pkg_solr.fnc_limpar_caracter(au.ds_objeto)           AS resumo_str,
    NULL                                                      AS situacaodocumento_str,
    TO_CHAR(au.dt_cadastro, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataautuacao_dt,
    cj.sigla                                                  AS siglaclasse_str,
    TO_CHAR(cp.dt_prazo, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')    AS dataprazofim_dt,
    ar.descricao                                              AS nomeareaatuacao_str,
    NULL                                                      AS nometiposituacaoae_str,
    -- DESIGNACAO
    NULL           AS nomedesignado_str,
    NULL           AS dataprevdevdesignacao_dt,
    NULL           AS idusuarioinclusaodesignacao,
    NULL           AS idsetorinclusaodesignacao,
    NULL           AS situacaosigilodesignacao,
    0              AS qtdedesignadosforasetor,
    0              AS minuta,
    0              AS minutadocsjuntados,
    anot.descricao AS textoultimaanotacao_str,
    NULL           AS textopesquisa,
    -- NVL(dn_distconclusao.id_distribuicao, dn_disttitular.id_distribuicao) AS iddistribuicaoresponsavel,
    -- uomacro_disttitular.id_unidade_organica                               AS idmacroresponsavel_str,
    -- uomacro_disttitular.nome                                              AS nomemacroresponsavel_str,
    -- NVL(of_distconclusao.id_oficio, of_disttitular.id_oficio)             AS idoficioresponsavel_str,
    -- NVL(of_distconclusao.nm_oficio, of_disttitular.nm_oficio)             AS nomeoficioresponsavel_str,
    -- NVL(tv_distconclusao.id_tipo_vinculo, 1)                              AS idtipovinculoresponsavel_str,
    -- NVL(tv_distconclusao.nm_tipo_vinculo, 'Titular')                      AS nometipovinculoresponsavel_str,
    dn_distconclusao.id_distribuicao          AS iddistribuicaoresponsavel,
    uomacro_distconclusao.id_unidade_organica AS idmacroresponsavel_str,
    uomacro_distconclusao.nome                AS nomemacroresponsavel_str,
    of_distconclusao.id_oficio                AS idoficioresponsavel_str,
    of_distconclusao.nm_oficio                AS nomeoficioresponsavel_str,
    tv_distconclusao.id_tipo_vinculo          AS idtipovinculoresponsavel_str,
    tv_distconclusao.nm_tipo_vinculo          AS nometipovinculoresponsavel_str,
    oj.id_orgao_julgador                      AS idorgaojulgador,
    oj.nome                                   AS orgaojulgador_str,
    CASE
        WHEN(og.url_consulta_processo IS NULL)
        THEN '0'
        WHEN(og.sigla = 'STF')
        THEN og.url_consulta_processo ||
                cj.sigla              ||
            '+'                       ||
                au.nr_autuacao_sem_mascara
        ELSE og.url_consulta_processo ||
                au.nr_autuacao_sem_mascara
    END                            AS linkprocesso_str,
    NVL(cd.id_unidade_organica, 0) AS idunidadeorganica,
    CASE
        WHEN(pj.id_area_atuacao IS NULL)
        THEN 0
        ELSE pj.id_area_atuacao
    END          AS idareaatuacao,
    ar.descricao AS areaatuacao_str,
    CASE
        WHEN jr.id_juiz_relator IS NULL
        THEN 0
        ELSE jr.id_juiz_relator
    END                      AS idrelator,
    jr.nome                  AS relator_str,
    au.id_autuacao           AS idautuacao,
    au.ds_etiqueta           AS etiquetaautuacao_str,
    au.nr_protocolo_registro AS numeroprotocoloregistro_str,
    CASE
        WHEN(op.id_operacao IS NULL)
        THEN 0
        ELSE op.id_operacao
    END                                                           AS idoperacaopolicial,
    op.nome                                                       AS operacaopolicial_str,
    TO_CHAR(mv.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS entrada_dt,
    au.id_orgao_governo                                           AS idorgaogerador,
    og.nome                                                       AS orgaogerador_str,
    og.dominio                                                    AS orgaogeradordominio_str,
    dc.st_urgente                                                 AS urgente_str,
    NULL                                                          AS semprioridade_str,
    CASE
        WHEN(cn.id_item_cnmp IS NULL)
        THEN 0
        ELSE cn.id_item_cnmp
    END          AS idclassejudiciaria,
    cj.descricao AS classejudiciaria_str,
    NULL         AS idtipodistribuicao,
    NULL         AS tipodistribuicao_str,
    NULL         AS idoficio,
    DECODE(NVL(idosos_e_reus_presos.reu_preso, 0),
               0, 'N',
               'S') AS reupreso_str,
    DECODE(NVL(idosos_e_reus_presos.idoso, 0),
               0, 'N',
               'S')                                                           AS parteprioritaria_str,
    NULL                                                                      AS iddesignado,
    nvl2(cp.dt_prazo, 'S', 'N')                                               AS existeprazodevolucao_str,
    TO_CHAR(cp.dt_prazo, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')                    AS prazodevolucao_dt,
    TO_CHAR(pj.dt_pena_minima, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')              AS penaminima_dt,
    TO_CHAR(pj.dt_pena_maxima, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')              AS penamaxima_dt,
    TO_CHAR(pj.dt_pena_minima_concreta, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')     AS penaminimaconcreta_dt,
    -- #Fabiana - as colunas uf, latitude e longitude foram anuladas, pois não estão sendo utilizadas pela aplicação, podendo ser retiradas do SOLR*/
    NULL                                                                      AS uf_str,
	NULL                            				  						  AS latitude,
	NULL										                              AS longitude,
	 -- #Fabiana Fim
    NVL(sa.id_situacao_autuacao, 999)                                         AS idsituacaoautuacao,
    NVL(sa.nm_situacao_autuacao, 'Sem situação')                              AS situacaoautuacao_str,
    TO_CHAR(itmdp.dt_limite_para_conclusao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS limiteparaconclusao_dt,
    CASE
        WHEN ep.qt_entrada_procuradoria = 1
        THEN 'p'
        WHEN ep.qt_entrada_procuradoria > 1
        THEN 'r'
        ELSE 'n'
    END entradampfcd_str,
    CASE
        WHEN ep.qt_entrada_procuradoria = 1
        THEN '1ª Entrada'
        WHEN ep.qt_entrada_procuradoria > 1
        THEN 'Retorno'
        ELSE 'Nenhuma'
    END entradampf_str,
    nvl2(ica.cd_cnmp, ica.cd_cnmp ||
    ' - '                         ||
        ica.ds_item, NULL) AS assuntonivel_str,
    NULL AS possuiintimacao_str, -- #FABIANAG - 17/06/2022 -  coluna anulada, pois não estão sendo utilizada pela aplicação, podendo ser retiradas do SOLR.    
    CASE
        WHEN (aac.id_autuacao IS NOT NULL AND aac.QT_INTIMACAO_PENDENTE > 0) -- #FABIANAG - 17/06/2022 - acrescentei a condição aac.QT_INTIMACAO_PENDENTE > 0
        THEN 1
        ELSE 0
    END AS possuiintimacaopendente_str,
    NULL AS temintimacaocomerroenvio_str,
    NULL AS anotacoes,
    NULL AS datareferencia_dt,
    --DISTRIBUICAO
    NULL  AS siglaprocdistribuicao_str,
    NVL2(cd.id_unidade_organica,'Sim', 'Não') AS nompf_str,
    NULL AS nosetor_str,
    (SELECT
        CASE ep.st_vistas
            WHEN 1
            THEN 'Vistas'
            WHEN 0
            THEN 'Sem Vistas'
        END
    FROM
        unico.referencia_nova r
    WHERE r.id_tipo_referencia         = 5
        AND r.dt_finalizacao     IS NULL
        AND au.id_documento            = r.id_documento_secundario
        AND ep.st_principal            = 0
        AND ep.id_entrada_procuradoria = au.id_entrada_procuradoria_atual
        AND ROWNUM = 1
    ) AS tipoapenso_str,
    nvl2(tipoent.descricao, tipoent.descricao, '') ||
        nvl2(compentrada.descricao, ' - '          ||
        compentrada.descricao, '')                 ||
        nvl2(detent.descricao, ' - '               ||
        detent.descricao, '') AS motivoentrada_str,
    NULL                      AS ultimasaidaunidade_str,
    CASE
        WHEN unidorigem.id_unidade_organica_macro <> uniddestino.id_unidade_organica_macro
        THEN 1
        ELSE 0
    END      AS origemoutraunidademacro,
    og.sigla AS orgaogeradorsigla_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN nvl2(docmanif.id_documento, 'Sim', 'Não')
        ELSE 'Não'
    END AS possuimanifestacaoentrada_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN docmanif.etiqueta
        ELSE NULL
    END AS manifestacaoentradaatual_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao AND docmanif.st_digital = 1
        THEN
            CASE docmanif.id_tp_situ_assinatura_digital
                WHEN 0
                THEN 'Não Conclusa para Assinatura'
                WHEN 1
                THEN 'Conclusa para Assinatura'
                WHEN 2
                THEN 'Assinado Digitalmente'
                WHEN 3
                THEN 'Devolvida para Correção'
                WHEN 4
                THEN 'Enviada e não Assinada no Único'
                ELSE NULL
            END
        ELSE NULL
    END AS situacaoassinatura_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN ma.id_documento
        ELSE NULL
    END AS iddocmanifestacaoentradaatual,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN TO_CHAR(ma.data, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')
        ELSE NULL
    END AS dtmanifestacaoentradaatual_dt,
    jr.NOME AS juizrelator_str,
    DECODE(NVL(pj.st_materia_repetitiva, 0),
               0, 'Não',
               'Sim') AS materiarepetitiva_str,
    DECODE(NVL(cp.st_reu_preso, 0),
               0, 'Não',
               'Sim') AS reupresoclassificacao_str,
    TO_CHAR(dc.dt_localizacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dtlocalizacao_dt,
    --#ULISSES - 15/06/2022 - Inicio
    NULL AS datatempoparado_dt, 
    NULL AS grupotematicoprincipal_str,
    --#ULISSES - 15/06/2022 - Fim
    --#FABIANAG - 17/06/2022 - INICIO
    CASE
        WHEN (aac.id_autuacao IS NOT NULL AND aac.QT_INTIMACAO_PENDENTE_NOVA  > 0)
        THEN 1
        ELSE 0
    END AS temintimacaopendentenova_str
    --#FABIANAG - 17/06/2022 - FIM
FROM
    unico.documento                    dc
    INNER JOIN unico.processo_judicial pj
        ON  dc.id_documento = pj.id_documento
    LEFT JOIN unico.area_atuacao ar
        ON  pj.id_area_atuacao = ar.id_area_atuacao
    LEFT JOIN unico.operacao op
        ON  pj.id_operacao = op.id_operacao
    INNER JOIN unico.autuacao au
        ON  pj.id_autuacao_vigente = au.id_autuacao
    LEFT JOIN unico.entrada_procuradoria ep
        ON  au.id_entrada_procuradoria_atual = ep.id_entrada_procuradoria
    LEFT JOIN unico.movimentacao mv
        ON  mv.id_movimentacao = ep.id_movimentacao_entrada
    LEFT JOIN unico.orgao_julgador oj
        ON  au.id_orgao_julgador = oj.id_orgao_julgador
    LEFT JOIN unico.juiz_relator jr
        ON  au.id_juiz_relator = jr.id_juiz_relator
    INNER JOIN unico.orgao_governo og
        ON  au.id_orgao_governo = og.id_orgao_governo
    -- No delta é LEFT
    LEFT JOIN unico.concentrador cd
        ON  dc.id_concentrador_localizado = cd.id_concentrador
    -- No delta é LEFT
    LEFT JOIN unico.concentrador conc_orig
        ON  dc.id_concentrador_origem = conc_orig.id_concentrador
    LEFT JOIN unico.concentrador conc_dest
        ON  dc.id_concentrador_destino = conc_dest.id_concentrador
    LEFT JOIN corporativo.unidade_organica unidorigem
        ON  unidorigem.id_unidade_organica = conc_orig.id_unidade_organica
    LEFT JOIN corporativo.unidade_organica uniddestino
        ON  uniddestino.id_unidade_organica = conc_dest.id_unidade_organica
    INNER JOIN unico.classe_judiciaria cj
        ON  au.id_classe_judiciario = cj.id_classe_judiciario
    LEFT JOIN unico.classificacao_processo cp
        ON  au.id_entrada_procuradoria_atual = cp.id_entrada_procuradoria
    LEFT JOIN unico.item_cnmp cn
        ON  cj.id_item_cnmp = cn.id_item_cnmp
	INNER JOIN corporativo.unidade_organica uo
        ON  dc.id_uorg_macro_cadastro = uo.id_unidade_organica
    LEFT JOIN corporativo.municipio mu1
        ON  uo.endereco_id_municipio = mu1.id_municipio
    LEFT JOIN unico.situacao_autuacao sa
        ON  au.id_situacao_autuacao = sa.id_situacao_autuacao
    LEFT JOIN unico.ipl_tco it
        ON  au.id_autuacao = it.id_autuacao
    LEFT JOIN unico.manifestacao ma
        ON  au.id_autuacao = ma.id_autuacao
    LEFT JOIN unico.ipl_tco_mani_dilacao_prazo itmdp
        ON  ma.id_documento                    = itmdp.id_documento_manifestacao
            AND itmdp.dt_conclusao_prazo IS NULL
    --#Pedro Passei para cima
    --LEFT JOIN unico.entrada_procuradoria ep ON  au.id_entrada_procuradoria_atual = ep.id_entrada_procuradoria
    --#Pedro Fim
    LEFT JOIN unico.item_cnmp_documento icd
        ON  au.id_documento           = icd.id_documento
            AND icd.st_tema_principal = 1
    LEFT JOIN unico.item_cnmp ica
        ON  icd.id_item_cnmp = ica.id_item_cnmp
            AND ica.tp_item  = 'A'
    INNER JOIN unico.genero gen
        ON  dc.id_genero = gen.id_genero --[monitorar] ?
    LEFT JOIN unico.anotacao anot
        ON  anot.id_documento = dc.id_documento
            AND anot.st_ativo = 1
    LEFT JOIN solr.agg_idosos_e_reus_presos idosos_e_reus_presos
        ON  dc.id_documento = idosos_e_reus_presos.id_documento
    -- FABIANAG - 17/06/2022 - Substituição da referência a tabela 
    LEFT JOIN UNICO_DESNORMALIZADO.AUTUACAO_AVISO_COMUNICACAO aac 
       ON  au.id_autuacao = aac.id_autuacao    
    -- FABIANAG - 17/06/2022 - Substituição da referência a tabela 
    LEFT JOIN unico.movimentacao_judicial mj_distconclusao
        ON  mj_distconclusao.id_movimentacao = ep.id_movimentacao_ulti_conclusao
            AND mj_distconclusao.id_fase_processo IN(4685,
                                                     7591)
    LEFT JOIN unico.distribuicao_nova dn_distconclusao
        ON  dn_distconclusao.id_distribuicao = mj_distconclusao.id_distribuicao
    -- A lógica de join original, problemática, fazia um "curto-circuito": dc->pj->au->ep->mj->dn->pj!!
    -- Portanto, evito o problema ao selecionar, depois (na cláusula WHERE), os ids que coincidem.
    -- AND NVL(dn_distconclusao.id_documento_distribuido, pj.id_documento) = pj.id_documento
    LEFT JOIN unico.oficio of_distconclusao
        ON  of_distconclusao.id_oficio = dn_distconclusao.id_oficio
    LEFT JOIN unico.tipo_vinculo tv_distconclusao
        ON  tv_distconclusao.id_tipo_vinculo = dn_distconclusao.id_tipo_vinculo
    LEFT JOIN corporativo.unidade_organica uomacro_distconclusao
        ON  uomacro_distconclusao.id_unidade_organica = dn_distconclusao.id_uorg_procuradoria
    LEFT JOIN unico.tipo_entrada tipoent
        ON  tipoent.id_tipo_entrada = cp.id_tipo_entrada
    LEFT JOIN unico.complemento_entrada compentrada
        ON  compentrada.id_complemento_entrada = cp.id_complemento_entrada
    LEFT JOIN unico.detalhamento_entrada detent
        ON  detent.id_detalhamento_entrada = cp.id_detalhamento_entrada
    LEFT JOIN unico.documento docmanif
        ON  docmanif.id_documento = ma.id_documento
WHERE dc.id_genero                = 92
    AND
    (cp.id_classificacao_processo IS NULL
        OR cp.id_classificacao_processo =
        (SELECT
            MAX(cp2.id_classificacao_processo)
        FROM
            unico.classificacao_processo cp2
        WHERE cp2.id_entrada_procuradoria = au.id_entrada_procuradoria_atual
        ))
    AND NVL(ma.id_documento, 1) = NVL(
                                       (SELECT
                                           MAX(ma0.id_documento)
                                       FROM
                                           unico.manifestacao ma0
                                       WHERE ma0.id_autuacao = au.id_autuacao
                                      ), 1)
    AND NVL(icd.id_item_cnmp_documento, 1) = NVL(
                                                  (SELECT
                                                      MAX(icd1.id_item_cnmp_documento)
                                                  FROM
                                                      unico.item_cnmp_documento icd1
                                                  WHERE au.id_documento          = icd1.id_documento
                                                      AND icd1.st_tema_principal = 1
                                                 ), 1)
    AND
    (anot.id_anotacao =
        (SELECT
            MAX(anot2.id_anotacao)
        FROM
            unico.anotacao anot2
        WHERE anot2.id_documento = dc.id_documento
            AND anot2.st_ativo   = 1
        )
        OR anot.id_anotacao IS NULL);

COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_92"
IS
    'REV 001 - solr.views_gerenciador - ULISSES e FABIANAG em 17/06/2022 - JIRAs 9254, 8819 e 9456. Adicionados os campos DATATEMPOPARADO_DT, GRUPOTEMATICOPRINCIPAL_STR, TEMINTIMACAOPENDENTENOVA_STR.';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07#XML"("ID", "ID_DOCUMENTO", "XML") AS
SELECT
    id,
    id AS id_documento,
    xmlelement("DOC",
        gerenciador_doc07(
            solr.fnc_limpar_caracter_espec(id),
            solr.fnc_limpar_caracter_espec(etiquetaexpediente_str),
            solr.fnc_limpar_caracter_espec(idgenero),
            solr.fnc_limpar_caracter_espec(nomegenero_str),
            solr.fnc_limpar_caracter_espec(nomesigilo_str),
            solr.fnc_limpar_caracter_espec(datamovimentacao_dt),
            solr.fnc_limpar_caracter_espec(datarecebimento_dt),
            solr.fnc_limpar_caracter_espec(eletronico),
            solr.fnc_limpar_caracter_espec(nomeconcentradororigem_str),
            solr.fnc_limpar_caracter_espec(nomeconcentradorlocalizado_str),
            solr.fnc_limpar_caracter_espec(idconcentradorlocalizado),
            solr.fnc_limpar_caracter_espec(areceber),
            solr.fnc_limpar_caracter_espec(assunto_str),
            solr.fnc_limpar_caracter_espec(idvisao),
            solr.fnc_limpar_caracter_espec(idtiponatureza),
            solr.fnc_limpar_caracter_espec(nometiponatureza_str),
            solr.fnc_limpar_caracter_espec(envelopado),
            solr.fnc_limpar_caracter_espec(exibirgerenciador),
            solr.fnc_limpar_caracter_espec(arquivado),
            solr.fnc_limpar_caracter_espec(resumo_str),
            solr.fnc_limpar_caracter_espec(situacaodocumento_str),
            solr.fnc_limpar_caracter_espec(dataautuacao_dt),
            solr.fnc_limpar_caracter_espec(siglaclasse_str),
            solr.fnc_limpar_caracter_espec(dataprazofim_dt),
            solr.fnc_limpar_caracter_espec(nomeareaatuacao_str),
            solr.fnc_limpar_caracter_espec(nometiposituacaoae_str),
            solr.fnc_limpar_caracter_espec(nomedesignado_str),
            solr.fnc_limpar_caracter_espec(dataprevdevdesignacao_dt),
            solr.fnc_limpar_caracter_espec(idusuarioinclusaodesignacao),
            solr.fnc_limpar_caracter_espec(idsetorinclusaodesignacao),
            solr.fnc_limpar_caracter_espec(situacaosigilodesignacao),
            solr.fnc_limpar_caracter_espec(qtdedesignadosforasetor),
            solr.fnc_limpar_caracter_espec(minuta),
            solr.fnc_limpar_caracter_espec(minutadocsjuntados),
            solr.fnc_limpar_caracter_espec(textoultimaanotacao_str),
            solr.fnc_limpar_caracter_espec(textopesquisa),
            solr.fnc_limpar_caracter_espec(iddistribuicaoresponsavel),
            solr.fnc_limpar_caracter_espec(idmacroresponsavel_str),
            solr.fnc_limpar_caracter_espec(nomemacroresponsavel_str),
            solr.fnc_limpar_caracter_espec(idoficioresponsavel_str),
            solr.fnc_limpar_caracter_espec(nomeoficioresponsavel_str),
            solr.fnc_limpar_caracter_espec(idtipovinculoresponsavel_str),
            solr.fnc_limpar_caracter_espec(nometipovinculoresponsavel_str),
            solr.fnc_limpar_caracter_espec(idorgaojulgador),
            solr.fnc_limpar_caracter_espec(orgaojulgador_str),
            solr.fnc_limpar_caracter_espec(linkprocesso_str),
            solr.fnc_limpar_caracter_espec(idunidadeorganica),
            solr.fnc_limpar_caracter_espec(idareaatuacao),
            solr.fnc_limpar_caracter_espec(areaatuacao_str),
            solr.fnc_limpar_caracter_espec(idrelator),
            solr.fnc_limpar_caracter_espec(relator_str),
            solr.fnc_limpar_caracter_espec(idautuacao),
            solr.fnc_limpar_caracter_espec(etiquetaautuacao_str),
            solr.fnc_limpar_caracter_espec(numeroprotocoloregistro_str),
            solr.fnc_limpar_caracter_espec(idoperacaopolicial),
            solr.fnc_limpar_caracter_espec(operacaopolicial_str),
            solr.fnc_limpar_caracter_espec(entrada_dt),
            solr.fnc_limpar_caracter_espec(idorgaogerador),
            solr.fnc_limpar_caracter_espec(orgaogerador_str),
            solr.fnc_limpar_caracter_espec(orgaogeradordominio_str),
            solr.fnc_limpar_caracter_espec(urgente_str),
            solr.fnc_limpar_caracter_espec(semprioridade_str),
            solr.fnc_limpar_caracter_espec(idclassejudiciaria),
            solr.fnc_limpar_caracter_espec(classejudiciaria_str),
            solr.fnc_limpar_caracter_espec(idtipodistribuicao),
            solr.fnc_limpar_caracter_espec(tipodistribuicao_str),
            solr.fnc_limpar_caracter_espec(idoficio),
            solr.fnc_limpar_caracter_espec(reupreso_str),
            solr.fnc_limpar_caracter_espec(parteprioritaria_str),
            solr.fnc_limpar_caracter_espec(iddesignado),
            solr.fnc_limpar_caracter_espec(existeprazodevolucao_str),
            solr.fnc_limpar_caracter_espec(prazodevolucao_dt),
            solr.fnc_limpar_caracter_espec(penaminima_dt),
            solr.fnc_limpar_caracter_espec(penamaxima_dt),
            solr.fnc_limpar_caracter_espec(penaminimaconcreta_dt),
            solr.fnc_limpar_caracter_espec(uf_str),
            solr.fnc_limpar_caracter_espec(latitude),
            solr.fnc_limpar_caracter_espec(longitude),
            solr.fnc_limpar_caracter_espec(idsituacaoautuacao),
            solr.fnc_limpar_caracter_espec(situacaoautuacao_str),
            solr.fnc_limpar_caracter_espec(limiteparaconclusao_dt),
            solr.fnc_limpar_caracter_espec(entradampfcd_str),
            solr.fnc_limpar_caracter_espec(entradampf_str),
            solr.fnc_limpar_caracter_espec(assuntonivel_str),
            solr.fnc_limpar_caracter_espec(possuiintimacao_str),
            solr.fnc_limpar_caracter_espec(possuiintimacaopendente_str),
            solr.fnc_limpar_caracter_espec(temintimacaocomerroenvio_str),
            solr.fnc_limpar_caracter_espec(anotacoes),
            solr.fnc_limpar_caracter_espec(datareferencia_dt),
            solr.fnc_limpar_caracter_espec(siglaprocdistribuicao_str),
            solr.fnc_limpar_caracter_espec(nompf_str),
            solr.fnc_limpar_caracter_espec(nosetor_str),
            solr.fnc_limpar_caracter_espec(tipoapenso_str),
            solr.fnc_limpar_caracter_espec(motivoentrada_str),
            solr.fnc_limpar_caracter_espec(ultimasaidaunidade_str),
            solr.fnc_limpar_caracter_espec(origemoutraunidademacro),
            solr.fnc_limpar_caracter_espec(orgaogeradorsigla_str),
            solr.fnc_limpar_caracter_espec(possuimanifestacaoentrada_str),
            solr.fnc_limpar_caracter_espec(manifestacaoentradaatual_str),
            solr.fnc_limpar_caracter_espec(situacaoassinatura_str),
            solr.fnc_limpar_caracter_espec(iddocmanifestacaoentradaatual),
            solr.fnc_limpar_caracter_espec(dtmanifestacaoentradaatual_dt),
            solr.fnc_limpar_caracter_espec(juizrelator_str),
            solr.fnc_limpar_caracter_espec(materiarepetitiva_str),
            solr.fnc_limpar_caracter_espec(reupresoclassificacao_str),
            solr.fnc_limpar_caracter_espec(dtlocalizacao_dt),
            -- #FABIANAG - 17/06/2022 - INICIO
            solr.fnc_limpar_caracter_espec(datatempoparado_dt), 
            solr.fnc_limpar_caracter_espec(grupotematicoprincipal_str), 
            solr.fnc_limpar_caracter_espec(temintimacaopendentenova_str),
            -- #FABIANAG - 17/06/2022 - FIM
    CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_usuario_acessa)
    FROM
        vw_gerenciador_doc07_visipess v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_visipess_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_uorg_acessa)
    FROM
        vw_gerenciador_doc07_visisetr v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_visisetr_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.rotulo)
    FROM
        vw_gerenciador_doc07_rotulo v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_rotulo_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.designacao)
    FROM
        vw_gerenciador_doc07_designa v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_designa_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.oficiotitular)
    FROM
        vw_gerenciador_doc07_ofictitu v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_ofictitu_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.aviso)
    FROM
        vw_gerenciador_doc07_aviso v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_aviso_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_unidade_organica_cadastro)
    FROM
        vw_gerenciador_doc07_notaexp v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_notaexp_tb))) .getclobval() AS xml
FROM
    vw_gerenciador_doc07 doc;


COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07#XML"
IS
    'REV 001 - solr.views_gerenciador - ULISSES e FABIANAG em 17/06/2022 - JIRAs 9254, 8819 e 9456. Adicionados os campos DATATEMPOPARADO_DT, GRUPOTEMATICOPRINCIPAL_STR, TEMINTIMACAOPENDENTENOVA_STR.';


CREATE OR REPLACE FORCE VIEW "SOLR"."VW_GERENCIADOR_DOC07_10#XML" ("ID", "ID_DOCUMENTO", "XML") AS
SELECT
    id,
    id AS id_documento,
    xmlelement("DOC",
        gerenciador_doc07(
            solr.fnc_limpar_caracter_espec(id),
            solr.fnc_limpar_caracter_espec(etiquetaexpediente_str),
            solr.fnc_limpar_caracter_espec(idgenero),
            solr.fnc_limpar_caracter_espec(nomegenero_str),
            solr.fnc_limpar_caracter_espec(nomesigilo_str),
            solr.fnc_limpar_caracter_espec(datamovimentacao_dt),
            solr.fnc_limpar_caracter_espec(datarecebimento_dt),
            solr.fnc_limpar_caracter_espec(eletronico),
            solr.fnc_limpar_caracter_espec(nomeconcentradororigem_str),
            solr.fnc_limpar_caracter_espec(nomeconcentradorlocalizado_str),
            solr.fnc_limpar_caracter_espec(idconcentradorlocalizado),
            solr.fnc_limpar_caracter_espec(areceber),
            solr.fnc_limpar_caracter_espec(assunto_str),
            solr.fnc_limpar_caracter_espec(idvisao),
            solr.fnc_limpar_caracter_espec(idtiponatureza),
            solr.fnc_limpar_caracter_espec(nometiponatureza_str),
            solr.fnc_limpar_caracter_espec(envelopado),
            solr.fnc_limpar_caracter_espec(exibirgerenciador),
            solr.fnc_limpar_caracter_espec(arquivado),
            solr.fnc_limpar_caracter_espec(resumo_str),
            solr.fnc_limpar_caracter_espec(situacaodocumento_str),
            solr.fnc_limpar_caracter_espec(dataautuacao_dt),
            solr.fnc_limpar_caracter_espec(siglaclasse_str),
            solr.fnc_limpar_caracter_espec(dataprazofim_dt),
            solr.fnc_limpar_caracter_espec(nomeareaatuacao_str),
            solr.fnc_limpar_caracter_espec(nometiposituacaoae_str),
            solr.fnc_limpar_caracter_espec(nomedesignado_str),
            solr.fnc_limpar_caracter_espec(dataprevdevdesignacao_dt),
            solr.fnc_limpar_caracter_espec(idusuarioinclusaodesignacao),
            solr.fnc_limpar_caracter_espec(idsetorinclusaodesignacao),
            solr.fnc_limpar_caracter_espec(situacaosigilodesignacao),
            solr.fnc_limpar_caracter_espec(qtdedesignadosforasetor),
            solr.fnc_limpar_caracter_espec(minuta),
            solr.fnc_limpar_caracter_espec(minutadocsjuntados),
            solr.fnc_limpar_caracter_espec(textoultimaanotacao_str),
            solr.fnc_limpar_caracter_espec(textopesquisa),
            solr.fnc_limpar_caracter_espec(iddistribuicaoresponsavel),
            solr.fnc_limpar_caracter_espec(idmacroresponsavel_str),
            solr.fnc_limpar_caracter_espec(nomemacroresponsavel_str),
            solr.fnc_limpar_caracter_espec(idoficioresponsavel_str),
            solr.fnc_limpar_caracter_espec(nomeoficioresponsavel_str),
            solr.fnc_limpar_caracter_espec(idtipovinculoresponsavel_str),
            solr.fnc_limpar_caracter_espec(nometipovinculoresponsavel_str),
            solr.fnc_limpar_caracter_espec(idorgaojulgador),
            solr.fnc_limpar_caracter_espec(orgaojulgador_str),
            solr.fnc_limpar_caracter_espec(linkprocesso_str),
            solr.fnc_limpar_caracter_espec(idunidadeorganica),
            solr.fnc_limpar_caracter_espec(idareaatuacao),
            solr.fnc_limpar_caracter_espec(areaatuacao_str),
            solr.fnc_limpar_caracter_espec(idrelator),
            solr.fnc_limpar_caracter_espec(relator_str),
            solr.fnc_limpar_caracter_espec(idautuacao),
            solr.fnc_limpar_caracter_espec(etiquetaautuacao_str),
            solr.fnc_limpar_caracter_espec(numeroprotocoloregistro_str),
            solr.fnc_limpar_caracter_espec(idoperacaopolicial),
            solr.fnc_limpar_caracter_espec(operacaopolicial_str),
            solr.fnc_limpar_caracter_espec(entrada_dt),
            solr.fnc_limpar_caracter_espec(idorgaogerador),
            solr.fnc_limpar_caracter_espec(orgaogerador_str),
            solr.fnc_limpar_caracter_espec(orgaogeradordominio_str),
            solr.fnc_limpar_caracter_espec(urgente_str),
            solr.fnc_limpar_caracter_espec(semprioridade_str),
            solr.fnc_limpar_caracter_espec(idclassejudiciaria),
            solr.fnc_limpar_caracter_espec(classejudiciaria_str),
            solr.fnc_limpar_caracter_espec(idtipodistribuicao),
            solr.fnc_limpar_caracter_espec(tipodistribuicao_str),
            solr.fnc_limpar_caracter_espec(idoficio),
            solr.fnc_limpar_caracter_espec(reupreso_str),
            solr.fnc_limpar_caracter_espec(parteprioritaria_str),
            solr.fnc_limpar_caracter_espec(iddesignado),
            solr.fnc_limpar_caracter_espec(existeprazodevolucao_str),
            solr.fnc_limpar_caracter_espec(prazodevolucao_dt),
            solr.fnc_limpar_caracter_espec(penaminima_dt),
            solr.fnc_limpar_caracter_espec(penamaxima_dt),
            solr.fnc_limpar_caracter_espec(penaminimaconcreta_dt),
            solr.fnc_limpar_caracter_espec(uf_str),
            solr.fnc_limpar_caracter_espec(latitude),
            solr.fnc_limpar_caracter_espec(longitude),
            solr.fnc_limpar_caracter_espec(idsituacaoautuacao),
            solr.fnc_limpar_caracter_espec(situacaoautuacao_str),
            solr.fnc_limpar_caracter_espec(limiteparaconclusao_dt),
            solr.fnc_limpar_caracter_espec(entradampfcd_str),
            solr.fnc_limpar_caracter_espec(entradampf_str),
            solr.fnc_limpar_caracter_espec(assuntonivel_str),
            solr.fnc_limpar_caracter_espec(possuiintimacao_str),
            solr.fnc_limpar_caracter_espec(possuiintimacaopendente_str),
            solr.fnc_limpar_caracter_espec(temintimacaocomerroenvio_str),
            solr.fnc_limpar_caracter_espec(anotacoes),
            solr.fnc_limpar_caracter_espec(datareferencia_dt),
            solr.fnc_limpar_caracter_espec(siglaprocdistribuicao_str),
            solr.fnc_limpar_caracter_espec(nompf_str),
            solr.fnc_limpar_caracter_espec(nosetor_str),
            solr.fnc_limpar_caracter_espec(tipoapenso_str),
            solr.fnc_limpar_caracter_espec(motivoentrada_str),
            solr.fnc_limpar_caracter_espec(ultimasaidaunidade_str),
            solr.fnc_limpar_caracter_espec(origemoutraunidademacro),
            solr.fnc_limpar_caracter_espec(orgaogeradorsigla_str),
            solr.fnc_limpar_caracter_espec(possuimanifestacaoentrada_str),
            solr.fnc_limpar_caracter_espec(manifestacaoentradaatual_str),
            solr.fnc_limpar_caracter_espec(situacaoassinatura_str),
            solr.fnc_limpar_caracter_espec(iddocmanifestacaoentradaatual),
            solr.fnc_limpar_caracter_espec(dtmanifestacaoentradaatual_dt),
            solr.fnc_limpar_caracter_espec(juizrelator_str),
            solr.fnc_limpar_caracter_espec(materiarepetitiva_str),
            solr.fnc_limpar_caracter_espec(reupresoclassificacao_str),
            solr.fnc_limpar_caracter_espec(dtlocalizacao_dt),
            -- #FABIANAG - 17/06/2022 - INICIO
            solr.fnc_limpar_caracter_espec(datatempoparado_dt), 
            solr.fnc_limpar_caracter_espec(grupotematicoprincipal_str), 
            solr.fnc_limpar_caracter_espec(temintimacaopendentenova_str),
            -- #FABIANAG - 17/06/2022 - FIM
    CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_usuario_acessa)
    FROM
        vw_gerenciador_doc07_visipess v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_visipess_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_uorg_acessa)
    FROM
        vw_gerenciador_doc07_visisetr v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_visisetr_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.rotulo)
    FROM
        vw_gerenciador_doc07_rotulo v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_rotulo_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.designacao)
    FROM
        vw_gerenciador_doc07_designa v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_designa_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.oficiotitular)
    FROM
        vw_gerenciador_doc07_ofictitu v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_ofictitu_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.aviso)
    FROM
        vw_gerenciador_doc07_aviso v
    WHERE 1 = 0 -- v.id_documento = doc.id - Aviso comunicação só faz sentido em id_genero=92
    ) AS gerenciador_doc07_aviso_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_unidade_organica_cadastro)
    FROM
        vw_gerenciador_doc07_notaexp v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_notaexp_tb))) .getclobval() AS xml
FROM
    vw_gerenciador_doc07_10 doc;

COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_10#XML"
IS
    'REV 001 - solr.views_gerenciador - ULISSES e FABIANAG em 17/06/2022 - JIRAs 9254, 8819 e 9456. Adicionados os campos DATATEMPOPARADO_DT, GRUPOTEMATICOPRINCIPAL_STR, TEMINTIMACAOPENDENTENOVA_STR.';


CREATE OR REPLACE FORCE VIEW "SOLR"."VW_GERENCIADOR_DOC07_41#XML" ("ID", "ID_DOCUMENTO", "XML") AS
SELECT
    id,
    id AS id_documento,
    xmlelement("DOC",
        gerenciador_doc07(
            solr.fnc_limpar_caracter_espec(id),
            solr.fnc_limpar_caracter_espec(etiquetaexpediente_str),
            solr.fnc_limpar_caracter_espec(idgenero),
            solr.fnc_limpar_caracter_espec(nomegenero_str),
            solr.fnc_limpar_caracter_espec(nomesigilo_str),
            solr.fnc_limpar_caracter_espec(datamovimentacao_dt),
            solr.fnc_limpar_caracter_espec(datarecebimento_dt),
            solr.fnc_limpar_caracter_espec(eletronico),
            solr.fnc_limpar_caracter_espec(nomeconcentradororigem_str),
            solr.fnc_limpar_caracter_espec(nomeconcentradorlocalizado_str),
            solr.fnc_limpar_caracter_espec(idconcentradorlocalizado),
            solr.fnc_limpar_caracter_espec(areceber),
            solr.fnc_limpar_caracter_espec(assunto_str),
            solr.fnc_limpar_caracter_espec(idvisao),
            solr.fnc_limpar_caracter_espec(idtiponatureza),
            solr.fnc_limpar_caracter_espec(nometiponatureza_str),
            solr.fnc_limpar_caracter_espec(envelopado),
            solr.fnc_limpar_caracter_espec(exibirgerenciador),
            solr.fnc_limpar_caracter_espec(arquivado),
            solr.fnc_limpar_caracter_espec(resumo_str),
            solr.fnc_limpar_caracter_espec(situacaodocumento_str),
            solr.fnc_limpar_caracter_espec(dataautuacao_dt),
            solr.fnc_limpar_caracter_espec(siglaclasse_str),
            solr.fnc_limpar_caracter_espec(dataprazofim_dt),
            solr.fnc_limpar_caracter_espec(nomeareaatuacao_str),
            solr.fnc_limpar_caracter_espec(nometiposituacaoae_str),
            solr.fnc_limpar_caracter_espec(nomedesignado_str),
            solr.fnc_limpar_caracter_espec(dataprevdevdesignacao_dt),
            solr.fnc_limpar_caracter_espec(idusuarioinclusaodesignacao),
            solr.fnc_limpar_caracter_espec(idsetorinclusaodesignacao),
            solr.fnc_limpar_caracter_espec(situacaosigilodesignacao),
            solr.fnc_limpar_caracter_espec(qtdedesignadosforasetor),
            solr.fnc_limpar_caracter_espec(minuta),
            solr.fnc_limpar_caracter_espec(minutadocsjuntados),
            solr.fnc_limpar_caracter_espec(textoultimaanotacao_str),
            solr.fnc_limpar_caracter_espec(textopesquisa),
            solr.fnc_limpar_caracter_espec(iddistribuicaoresponsavel),
            solr.fnc_limpar_caracter_espec(idmacroresponsavel_str),
            solr.fnc_limpar_caracter_espec(nomemacroresponsavel_str),
            solr.fnc_limpar_caracter_espec(idoficioresponsavel_str),
            solr.fnc_limpar_caracter_espec(nomeoficioresponsavel_str),
            solr.fnc_limpar_caracter_espec(idtipovinculoresponsavel_str),
            solr.fnc_limpar_caracter_espec(nometipovinculoresponsavel_str),
            solr.fnc_limpar_caracter_espec(idorgaojulgador),
            solr.fnc_limpar_caracter_espec(orgaojulgador_str),
            solr.fnc_limpar_caracter_espec(linkprocesso_str),
            solr.fnc_limpar_caracter_espec(idunidadeorganica),
            solr.fnc_limpar_caracter_espec(idareaatuacao),
            solr.fnc_limpar_caracter_espec(areaatuacao_str),
            solr.fnc_limpar_caracter_espec(idrelator),
            solr.fnc_limpar_caracter_espec(relator_str),
            solr.fnc_limpar_caracter_espec(idautuacao),
            solr.fnc_limpar_caracter_espec(etiquetaautuacao_str),
            solr.fnc_limpar_caracter_espec(numeroprotocoloregistro_str),
            solr.fnc_limpar_caracter_espec(idoperacaopolicial),
            solr.fnc_limpar_caracter_espec(operacaopolicial_str),
            solr.fnc_limpar_caracter_espec(entrada_dt),
            solr.fnc_limpar_caracter_espec(idorgaogerador),
            solr.fnc_limpar_caracter_espec(orgaogerador_str),
            solr.fnc_limpar_caracter_espec(orgaogeradordominio_str),
            solr.fnc_limpar_caracter_espec(urgente_str),
            solr.fnc_limpar_caracter_espec(semprioridade_str),
            solr.fnc_limpar_caracter_espec(idclassejudiciaria),
            solr.fnc_limpar_caracter_espec(classejudiciaria_str),
            solr.fnc_limpar_caracter_espec(idtipodistribuicao),
            solr.fnc_limpar_caracter_espec(tipodistribuicao_str),
            solr.fnc_limpar_caracter_espec(idoficio),
            solr.fnc_limpar_caracter_espec(reupreso_str),
            solr.fnc_limpar_caracter_espec(parteprioritaria_str),
            solr.fnc_limpar_caracter_espec(iddesignado),
            solr.fnc_limpar_caracter_espec(existeprazodevolucao_str),
            solr.fnc_limpar_caracter_espec(prazodevolucao_dt),
            solr.fnc_limpar_caracter_espec(penaminima_dt),
            solr.fnc_limpar_caracter_espec(penamaxima_dt),
            solr.fnc_limpar_caracter_espec(penaminimaconcreta_dt),
            solr.fnc_limpar_caracter_espec(uf_str),
            solr.fnc_limpar_caracter_espec(latitude),
            solr.fnc_limpar_caracter_espec(longitude),
            solr.fnc_limpar_caracter_espec(idsituacaoautuacao),
            solr.fnc_limpar_caracter_espec(situacaoautuacao_str),
            solr.fnc_limpar_caracter_espec(limiteparaconclusao_dt),
            solr.fnc_limpar_caracter_espec(entradampfcd_str),
            solr.fnc_limpar_caracter_espec(entradampf_str),
            solr.fnc_limpar_caracter_espec(assuntonivel_str),
            solr.fnc_limpar_caracter_espec(possuiintimacao_str),
            solr.fnc_limpar_caracter_espec(possuiintimacaopendente_str),
            solr.fnc_limpar_caracter_espec(temintimacaocomerroenvio_str),
            solr.fnc_limpar_caracter_espec(anotacoes),
            solr.fnc_limpar_caracter_espec(datareferencia_dt),
            solr.fnc_limpar_caracter_espec(siglaprocdistribuicao_str),
            solr.fnc_limpar_caracter_espec(nompf_str),
            solr.fnc_limpar_caracter_espec(nosetor_str),
            solr.fnc_limpar_caracter_espec(tipoapenso_str),
            solr.fnc_limpar_caracter_espec(motivoentrada_str),
            solr.fnc_limpar_caracter_espec(ultimasaidaunidade_str),
            solr.fnc_limpar_caracter_espec(origemoutraunidademacro),
            solr.fnc_limpar_caracter_espec(orgaogeradorsigla_str),
            solr.fnc_limpar_caracter_espec(possuimanifestacaoentrada_str),
            solr.fnc_limpar_caracter_espec(manifestacaoentradaatual_str),
            solr.fnc_limpar_caracter_espec(situacaoassinatura_str),
            solr.fnc_limpar_caracter_espec(iddocmanifestacaoentradaatual),
            solr.fnc_limpar_caracter_espec(dtmanifestacaoentradaatual_dt),
            solr.fnc_limpar_caracter_espec(juizrelator_str),
            solr.fnc_limpar_caracter_espec(materiarepetitiva_str),
            solr.fnc_limpar_caracter_espec(reupresoclassificacao_str),
            solr.fnc_limpar_caracter_espec(dtlocalizacao_dt),
            -- #FABIANAG - 17/06/2022 - INICIO
            solr.fnc_limpar_caracter_espec(datatempoparado_dt), 
            solr.fnc_limpar_caracter_espec(grupotematicoprincipal_str), 
            solr.fnc_limpar_caracter_espec(temintimacaopendentenova_str),
            -- #FABIANAG - 17/06/2022 - FIM
    CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_usuario_acessa)
    FROM
        vw_gerenciador_doc07_visipess v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_visipess_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_uorg_acessa)
    FROM
        vw_gerenciador_doc07_visisetr v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_visisetr_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.rotulo)
    FROM
        vw_gerenciador_doc07_rotulo v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_rotulo_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.designacao)
    FROM
        vw_gerenciador_doc07_designa v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_designa_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.oficiotitular)
    FROM
        vw_gerenciador_doc07_ofictitu v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_ofictitu_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.aviso)
    FROM
        vw_gerenciador_doc07_aviso v
    WHERE 1 = 0 -- v.id_documento = doc.id - Aviso comunicação só faz sentido em id_genero=92
    ) AS gerenciador_doc07_aviso_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_unidade_organica_cadastro)
    FROM
        vw_gerenciador_doc07_notaexp v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_notaexp_tb))) .getclobval() AS xml
FROM
    vw_gerenciador_doc07_41 doc;

COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_41#XML"
IS
    'REV 001 - solr.views_gerenciador - ULISSES e FABIANAG em 17/06/2022 - JIRAs 9254, 8819 e 9456. Adicionados os campos DATATEMPOPARADO_DT, GRUPOTEMATICOPRINCIPAL_STR, TEMINTIMACAOPENDENTENOVA_STR.';


CREATE OR REPLACE FORCE VIEW "SOLR"."VW_GERENCIADOR_DOC07_92#XML" ("ID", "ID_DOCUMENTO", "XML") AS
SELECT
    id,
    id AS id_documento,
    xmlelement("DOC",
        gerenciador_doc07(
            solr.fnc_limpar_caracter_espec(id),
            solr.fnc_limpar_caracter_espec(etiquetaexpediente_str),
            solr.fnc_limpar_caracter_espec(idgenero),
            solr.fnc_limpar_caracter_espec(nomegenero_str),
            solr.fnc_limpar_caracter_espec(nomesigilo_str),
            solr.fnc_limpar_caracter_espec(datamovimentacao_dt),
            solr.fnc_limpar_caracter_espec(datarecebimento_dt),
            solr.fnc_limpar_caracter_espec(eletronico),
            solr.fnc_limpar_caracter_espec(nomeconcentradororigem_str),
            solr.fnc_limpar_caracter_espec(nomeconcentradorlocalizado_str),
            solr.fnc_limpar_caracter_espec(idconcentradorlocalizado),
            solr.fnc_limpar_caracter_espec(areceber),
            solr.fnc_limpar_caracter_espec(assunto_str),
            solr.fnc_limpar_caracter_espec(idvisao),
            solr.fnc_limpar_caracter_espec(idtiponatureza),
            solr.fnc_limpar_caracter_espec(nometiponatureza_str),
            solr.fnc_limpar_caracter_espec(envelopado),
            solr.fnc_limpar_caracter_espec(exibirgerenciador),
            solr.fnc_limpar_caracter_espec(arquivado),
            solr.fnc_limpar_caracter_espec(resumo_str),
            solr.fnc_limpar_caracter_espec(situacaodocumento_str),
            solr.fnc_limpar_caracter_espec(dataautuacao_dt),
            solr.fnc_limpar_caracter_espec(siglaclasse_str),
            solr.fnc_limpar_caracter_espec(dataprazofim_dt),
            solr.fnc_limpar_caracter_espec(nomeareaatuacao_str),
            solr.fnc_limpar_caracter_espec(nometiposituacaoae_str),
            solr.fnc_limpar_caracter_espec(nomedesignado_str),
            solr.fnc_limpar_caracter_espec(dataprevdevdesignacao_dt),
            solr.fnc_limpar_caracter_espec(idusuarioinclusaodesignacao),
            solr.fnc_limpar_caracter_espec(idsetorinclusaodesignacao),
            solr.fnc_limpar_caracter_espec(situacaosigilodesignacao),
            solr.fnc_limpar_caracter_espec(qtdedesignadosforasetor),
            solr.fnc_limpar_caracter_espec(minuta),
            solr.fnc_limpar_caracter_espec(minutadocsjuntados),
            solr.fnc_limpar_caracter_espec(textoultimaanotacao_str),
            solr.fnc_limpar_caracter_espec(textopesquisa),
            solr.fnc_limpar_caracter_espec(iddistribuicaoresponsavel),
            solr.fnc_limpar_caracter_espec(idmacroresponsavel_str),
            solr.fnc_limpar_caracter_espec(nomemacroresponsavel_str),
            solr.fnc_limpar_caracter_espec(idoficioresponsavel_str),
            solr.fnc_limpar_caracter_espec(nomeoficioresponsavel_str),
            solr.fnc_limpar_caracter_espec(idtipovinculoresponsavel_str),
            solr.fnc_limpar_caracter_espec(nometipovinculoresponsavel_str),
            solr.fnc_limpar_caracter_espec(idorgaojulgador),
            solr.fnc_limpar_caracter_espec(orgaojulgador_str),
            solr.fnc_limpar_caracter_espec(linkprocesso_str),
            solr.fnc_limpar_caracter_espec(idunidadeorganica),
            solr.fnc_limpar_caracter_espec(idareaatuacao),
            solr.fnc_limpar_caracter_espec(areaatuacao_str),
            solr.fnc_limpar_caracter_espec(idrelator),
            solr.fnc_limpar_caracter_espec(relator_str),
            solr.fnc_limpar_caracter_espec(idautuacao),
            solr.fnc_limpar_caracter_espec(etiquetaautuacao_str),
            solr.fnc_limpar_caracter_espec(numeroprotocoloregistro_str),
            solr.fnc_limpar_caracter_espec(idoperacaopolicial),
            solr.fnc_limpar_caracter_espec(operacaopolicial_str),
            solr.fnc_limpar_caracter_espec(entrada_dt),
            solr.fnc_limpar_caracter_espec(idorgaogerador),
            solr.fnc_limpar_caracter_espec(orgaogerador_str),
            solr.fnc_limpar_caracter_espec(orgaogeradordominio_str),
            solr.fnc_limpar_caracter_espec(urgente_str),
            solr.fnc_limpar_caracter_espec(semprioridade_str),
            solr.fnc_limpar_caracter_espec(idclassejudiciaria),
            solr.fnc_limpar_caracter_espec(classejudiciaria_str),
            solr.fnc_limpar_caracter_espec(idtipodistribuicao),
            solr.fnc_limpar_caracter_espec(tipodistribuicao_str),
            solr.fnc_limpar_caracter_espec(idoficio),
            solr.fnc_limpar_caracter_espec(reupreso_str),
            solr.fnc_limpar_caracter_espec(parteprioritaria_str),
            solr.fnc_limpar_caracter_espec(iddesignado),
            solr.fnc_limpar_caracter_espec(existeprazodevolucao_str),
            solr.fnc_limpar_caracter_espec(prazodevolucao_dt),
            solr.fnc_limpar_caracter_espec(penaminima_dt),
            solr.fnc_limpar_caracter_espec(penamaxima_dt),
            solr.fnc_limpar_caracter_espec(penaminimaconcreta_dt),
            solr.fnc_limpar_caracter_espec(uf_str),
            solr.fnc_limpar_caracter_espec(latitude),
            solr.fnc_limpar_caracter_espec(longitude),
            solr.fnc_limpar_caracter_espec(idsituacaoautuacao),
            solr.fnc_limpar_caracter_espec(situacaoautuacao_str),
            solr.fnc_limpar_caracter_espec(limiteparaconclusao_dt),
            solr.fnc_limpar_caracter_espec(entradampfcd_str),
            solr.fnc_limpar_caracter_espec(entradampf_str),
            solr.fnc_limpar_caracter_espec(assuntonivel_str),
            solr.fnc_limpar_caracter_espec(possuiintimacao_str),
            solr.fnc_limpar_caracter_espec(possuiintimacaopendente_str),
            solr.fnc_limpar_caracter_espec(temintimacaocomerroenvio_str),
            solr.fnc_limpar_caracter_espec(anotacoes),
            solr.fnc_limpar_caracter_espec(datareferencia_dt),
            solr.fnc_limpar_caracter_espec(siglaprocdistribuicao_str),
            solr.fnc_limpar_caracter_espec(nompf_str),
            solr.fnc_limpar_caracter_espec(nosetor_str),
            solr.fnc_limpar_caracter_espec(tipoapenso_str),
            solr.fnc_limpar_caracter_espec(motivoentrada_str),
            solr.fnc_limpar_caracter_espec(ultimasaidaunidade_str),
            solr.fnc_limpar_caracter_espec(origemoutraunidademacro),
            solr.fnc_limpar_caracter_espec(orgaogeradorsigla_str),
            solr.fnc_limpar_caracter_espec(possuimanifestacaoentrada_str),
            solr.fnc_limpar_caracter_espec(manifestacaoentradaatual_str),
            solr.fnc_limpar_caracter_espec(situacaoassinatura_str),
            solr.fnc_limpar_caracter_espec(iddocmanifestacaoentradaatual),
            solr.fnc_limpar_caracter_espec(dtmanifestacaoentradaatual_dt),
            solr.fnc_limpar_caracter_espec(juizrelator_str),
            solr.fnc_limpar_caracter_espec(materiarepetitiva_str),
            solr.fnc_limpar_caracter_espec(reupresoclassificacao_str),
            solr.fnc_limpar_caracter_espec(dtlocalizacao_dt),
            -- #FABIANAG - 17/06/2022 - INICIO
            solr.fnc_limpar_caracter_espec(datatempoparado_dt), 
            solr.fnc_limpar_caracter_espec(grupotematicoprincipal_str), 
            solr.fnc_limpar_caracter_espec(temintimacaopendentenova_str),
            -- #FABIANAG - 17/06/2022 - FIM
            
    CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_usuario_acessa)
    FROM
        vw_gerenciador_doc07_visipess v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_visipess_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_uorg_acessa)
    FROM
        vw_gerenciador_doc07_visisetr v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_visisetr_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.rotulo)
    FROM
        vw_gerenciador_doc07_rotulo v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_rotulo_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.designacao)
    FROM
        vw_gerenciador_doc07_designa v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_designa_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.oficiotitular)
    FROM
        vw_gerenciador_doc07_ofictitu v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_ofictitu_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.aviso)
    FROM
        vw_gerenciador_doc07_aviso v
    WHERE v.id_documento = doc.id -- Aviso comunicação só faz sentido em id_genero=92
    ) AS gerenciador_doc07_aviso_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_unidade_organica_cadastro)
    FROM
        vw_gerenciador_doc07_notaexp v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_notaexp_tb))) .getclobval() AS xml
FROM
    vw_gerenciador_doc07_92 doc;

COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07_92#XML"
IS
    'REV 001 - solr.views_gerenciador - ULISSES e FABIANAG em 17/06/2022 - JIRAs 9254, 8819 e 9456. Adicionados os campos DATATEMPOPARADO_DT, GRUPOTEMATICOPRINCIPAL_STR, TEMINTIMACAOPENDENTENOVA_STR.';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07#FULL"("SQ", "ID", "ETIQUETAEXPEDIENTE_STR", "IDGENERO", "NOMEGENERO_STR", "NOMESIGILO_STR", "DATAMOVIMENTACAO_DT", "DATARECEBIMENTO_DT", "ELETRONICO", "NOMECONCENTRADORORIGEM_STR", "NOMECONCENTRADORLOCALIZADO_STR", "IDCONCENTRADORLOCALIZADO", "ARECEBER", "ASSUNTO_STR", "IDVISAO", "IDTIPONATUREZA", "NOMETIPONATUREZA_STR", "ENVELOPADO", "EXIBIRGERENCIADOR", "ARQUIVADO", "RESUMO_STR", "SITUACAODOCUMENTO_STR", "DATAAUTUACAO_DT", "SIGLACLASSE_STR", "DATAPRAZOFIM_DT", "NOMEAREAATUACAO_STR", "NOMETIPOSITUACAOAE_STR", "NOMEDESIGNADO_STR", "DATAPREVDEVDESIGNACAO_DT", "IDUSUARIOINCLUSAODESIGNACAO", "IDSETORINCLUSAODESIGNACAO", "SITUACAOSIGILODESIGNACAO", "QTDEDESIGNADOSFORASETOR", "MINUTA", "MINUTADOCSJUNTADOS", "TEXTOULTIMAANOTACAO_STR",
"TEXTOPESQUISA", "IDDISTRIBUICAORESPONSAVEL", "IDMACRORESPONSAVEL_STR", "NOMEMACRORESPONSAVEL_STR", "IDOFICIORESPONSAVEL_STR", "NOMEOFICIORESPONSAVEL_STR", "IDTIPOVINCULORESPONSAVEL_STR", "NOMETIPOVINCULORESPONSAVEL_STR", "IDORGAOJULGADOR", "ORGAOJULGADOR_STR", "LINKPROCESSO_STR", "IDUNIDADEORGANICA", "IDAREAATUACAO", "AREAATUACAO_STR", "IDRELATOR", "RELATOR_STR", "IDAUTUACAO", "ETIQUETAAUTUACAO_STR", "NUMEROPROTOCOLOREGISTRO_STR", "IDOPERACAOPOLICIAL", "OPERACAOPOLICIAL_STR", "ENTRADA_DT", "IDORGAOGERADOR", "ORGAOGERADOR_STR", "ORGAOGERADORDOMINIO_STR", "URGENTE_STR", "SEMPRIORIDADE_STR", "IDCLASSEJUDICIARIA", "CLASSEJUDICIARIA_STR", "IDTIPODISTRIBUICAO", "TIPODISTRIBUICAO_STR", "IDOFICIO", "REUPRESO_STR", "PARTEPRIORITARIA_STR", "IDDESIGNADO", "EXISTEPRAZODEVOLUCAO_STR",
"PRAZODEVOLUCAO_DT", "PENAMINIMA_DT", "PENAMAXIMA_DT", "PENAMINIMACONCRETA_DT", "UF_STR", "LATITUDE", "LONGITUDE", "IDSITUACAOAUTUACAO", "SITUACAOAUTUACAO_STR", "LIMITEPARACONCLUSAO_DT", "ENTRADAMPFCD_STR", "ENTRADAMPF_STR", "ASSUNTONIVEL_STR", "POSSUIINTIMACAO_STR", "POSSUIINTIMACAOPENDENTE_STR", "TEMINTIMACAOCOMERROENVIO_STR", "ANOTACOES", "DATAREFERENCIA_DT", "SIGLAPROCDISTRIBUICAO_STR", "NOMPF_STR", "NOSETOR_STR", "TIPOAPENSO_STR", "MOTIVOENTRADA_STR", "ULTIMASAIDAUNIDADE_STR", "ORIGEMOUTRAUNIDADEMACRO", "ORGAOGERADORSIGLA_STR", "POSSUIMANIFESTACAOENTRADA_STR", "MANIFESTACAOENTRADAATUAL_STR", "SITUACAOASSINATURA_STR", "IDDOCMANIFESTACAOENTRADAATUAL", "DTMANIFESTACAOENTRADAATUAL_DT", "JUIZRELATOR_STR", "MATERIAREPETITIVA_STR","REUPRESOCLASSIFICACAO_STR", "DTLOCALIZACAO_DT",
"DATATEMPOPARADO_DT", "GRUPOTEMATICOPRINCIPAL_STR", "TEMINTIMACAOPENDENTENOVA_STR") AS
SELECT
    /*+ cardinality (tb, 1000) */
    tb.sq             AS sq,
    docu.id_documento AS id,
    docu.etiqueta     AS etiquetaexpediente_str,
    docu.id_genero    AS idgenero,
    gene.descricao    AS nomegenero_str,
    DECODE(docu.st_sigilo,
               'N', 'Normal',
               'R', 'Reservado',
               'C', 'Confidencial')                                 AS nomesigilo_str,
    TO_CHAR(docu.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS datamovimentacao_dt,
    TO_CHAR(mov.dt_recebimento, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')   AS datarecebimento_dt,
    DECODE(docu.st_digital,
               NULL, 0,
               docu.st_digital) AS eletronico,
    conc_orig.ds_concentrador   AS nomeconcentradororigem_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.ds_concentrador
        ELSE conc_dest.ds_concentrador ||
            ' - Aguardando recebimento'
    END AS nomeconcentradorlocalizado_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.id_concentrador
        ELSE conc_dest.id_concentrador
    END                                      AS idconcentradorlocalizado,
    nvl2(docu.id_concentrador_destino, 1, 0) AS areceber,
    nvl2(itcn.cd_cnmp, itcn.cd_cnmp ||
    ' - '                           ||
        itcn.ds_item, NULL)                           AS assunto_str,
    3                                                 AS idvisao,
    ticc.id_tipo_natureza                             AS idtiponatureza,
    tpna.ds_tipo_natureza                             AS nometiponatureza_str,
    docu.st_envelopado                                AS envelopado,
    docu.st_exibir_gerenciador                        AS exibirgerenciador,
    auad.st_arquivado                                 AS arquivado,
    solr.pkg_solr.fnc_limpar_caracter(auad.ds_resumo) AS resumo_str,
    NULL                                              AS situacaodocumento_str,
    -- EXTRAJUDICIAL
    TO_CHAR(auad.dt_autuacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataautuacao_dt,
    ticc.sg_tipo_classe_cnmp                                    AS siglaclasse_str,
    TO_CHAR(copf.dt_fim, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')      AS dataprazofim_dt,
    arat.descricao                                              AS nomeareaatuacao_str,
    tisi.ds_tipo_situacao_ae                        ||
        nvl2(cosi.ds_complemento_situacao_ae, ' - ' ||
        cosi.ds_complemento_situacao_ae, NULL) AS nometiposituacaoae_str,
    -- DESIGNACAO
    NULL                     AS nomedesignado_str,
    NULL                     AS dataprevdevdesignacao_dt,
    NULL                     AS idusuarioinclusaodesignacao,
    NULL                     AS idsetorinclusaodesignacao,
    NULL                     AS situacaosigilodesignacao,
    0                        AS qtdedesignadosforasetor,
    0                        AS minuta,
    agmj.qt_minutas_juntadas AS minutadocsjuntados,
    -- ANOTAÇÃO
    anot.descricao AS textoultimaanotacao_str,
    NULL           AS textopesquisa,
    --versao doc3
    dino.id_distribuicao           AS iddistribuicaoresponsavel,
    unor.id_unidade_organica_macro AS idmacroresponsavel_str,
    unma.nome                      AS nomemacroresponsavel_str,
    ofic.id_oficio                 AS idoficioresponsavel_str,
    solr.pkg_solr.fnc_limpar_caracter(ofic.nm_oficio)               AS nomeoficioresponsavel_str,
    dino.id_tipo_vinculo                                            AS idtipovinculoresponsavel_str,
    tivi.nm_tipo_vinculo                                            AS nometipovinculoresponsavel_str,
    -- campos novos do JUDICIAL
    NULL AS idorgaojulgador,
    NULL AS orgaojulgador_str,
    NULL AS linkprocesso_str,
    NULL AS idunidadeorganica,
    NULL AS idareaatuacao,
    NULL AS areaatuacao_str,
    NULL AS idrelator,
    NULL AS relator_str,
    NULL AS idautuacao,
    NULL AS etiquetaautuacao_str,
    NULL AS numeroprotocoloregistro_str,
    NULL AS idoperacaopolicial,
    NULL AS operacaopolicial_str,
    NULL AS entrada_dt,
    NULL AS idorgaogerador,
    NULL AS orgaogerador_str,
    NULL AS orgaogeradordominio_str,
	docu.st_urgente                                                 AS urgente_str,
    NULL AS semprioridade_str,
    NULL AS idclassejudiciaria,
    NULL AS classejudiciaria_str,
    NULL AS idtipodistribuicao,
    NULL AS tipodistribuicao_str,
    NULL AS idoficio,
    NULL AS reupreso_str,
    NULL AS parteprioritaria_str,
    NULL AS iddesignado,
    NULL AS existeprazodevolucao_str,
    NULL AS prazodevolucao_dt,
    NULL AS penaminima_dt,
    NULL AS penamaxima_dt,
    NULL AS penaminimaconcreta_dt,
    NULL AS uf_str,
    NULL AS latitude,
    NULL AS longitude,
    NULL AS idsituacaoautuacao,
    NULL AS situacaoautuacao_str,
    NULL AS limiteparaconclusao_dt,
    NULL AS entradampfcd_str,
    NULL AS entradampf_str,
    NULL AS assuntonivel_str,
    NULL AS possuiintimacao_str,
    NULL AS possuiintimacaopendente_str,
    NULL AS temintimacaocomerroenvio_str,
    NULL AS anotacoes,
    NULL AS datareferencia_dt,
    NULL AS siglaprocdistribuicao_str,
    NULL AS nompf_str,
    NULL AS nosetor_str,
    NULL AS tipoapenso_str,
    NULL AS motivoentrada_str,
    NULL AS ultimasaidaunidade_str,
    NULL AS origemoutraunidademacro,
    NULL AS orgaogeradorsigla_str,
    NULL AS possuimanifestacaoentrada_str,
    NULL AS manifestacaoentradaatual_str,
    NULL AS situacaoassinatura_str,
    NULL AS iddocmanifestacaoentradaatual,
    NULL AS dtmanifestacaoentradaatual_dt,
    NULL AS juizrelator_str,
    NULL AS materiarepetitiva_str,
    NULL AS reupresoclassificacao_str,
    NULL AS dtlocalizacao_dt,
    --#ULISSES - 15/06/2022 - INICIO
    to_char(duoe.DT_ULTIMA_OCORRENCIA, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') as datatempoparado_dt, 
    cam.descricao as grupotematicoprincipal_str,
    --#ULISSES - 15/06/2022 - FIM       
    --#FABIANAG - 17/06/2022 - INICIO
    NULL AS temintimacaopendentenova_str
    --#FABIANAG - 17/06/2022 - FIM    
FROM
    unico.documento              docu
    LEFT JOIN unico.movimentacao mov
        ON  mov.id_movimentacao                    = docu.id_movimentacao
            AND docu.id_concentrador_destino IS NULL
    -- Na full é INNER
    INNER JOIN unico.concentrador cl
        ON  cl.id_concentrador = docu.id_concentrador_localizado
    -- Na full é INNER
    INNER JOIN unico.concentrador conc_orig
        ON  docu.id_concentrador_origem = conc_orig.id_concentrador
    LEFT JOIN unico.concentrador conc_dest
        ON  docu.id_concentrador_destino = conc_dest.id_concentrador
    INNER JOIN unico.genero gene
        ON  docu.id_genero = gene.id_genero
    -- AUTO ADMINISTRATIVO
    INNER JOIN unico.auto_administrativo auad
        ON  docu.id_documento = auad.id_documento
    LEFT JOIN unico.item_cnmp_documento itcd
        ON  docu.id_documento          = itcd.id_documento
            AND itcd.st_tema_principal = 1
    LEFT JOIN unico.item_cnmp itcn
        ON  itcd.id_item_cnmp = itcn.id_item_cnmp
    INNER JOIN unico.tipo_classe_cnmp ticc
        ON  auad.id_tipo_classe_cnmp_atual = ticc.id_tipo_classe_cnmp
    INNER JOIN unico.tipo_natureza tpna
        ON  ticc.id_tipo_natureza = tpna.id_tipo_natureza
    LEFT JOIN unico.controle_prazo_finalizacao copf
        ON  auad.id_controle_prazo_finalizacao = copf.id_controle_prazo_finalizacao
    INNER JOIN unico.area_atuacao arat
        ON  auad.id_area_atuacao = arat.id_area_atuacao
    LEFT JOIN unico.historico_situacao_ae hisi
        ON  auad.id_historico_situacao_ae = hisi.id_historico_situacao_ae
    LEFT JOIN unico.tipo_situacao_ae tisi
        ON  hisi.id_tipo_situacao_ae = tisi.id_tipo_situacao_ae
    LEFT JOIN unico.complemento_situacao_ae cosi
        ON  cosi.id_complemento_situacao_ae = hisi.id_complemento_situacao_ae
    -- ANOTAÇÃO
    /*LEFT JOIN
    (SELECT
    anot1.descricao,
    anot1.dt_inclusao,
    anot1.id_anotacao,
    anot1.id_documento id_documento
    FROM
    unico.anotacao anot1
    WHERE anot1.st_ativo      = 1
    AND anot1.id_anotacao =
    (SELECT
    MAX(anot2.id_anotacao)
    FROM
    unico.anotacao anot2
    WHERE anot2.id_documento = anot1.id_documento
    AND anot2.st_ativo   = 1
    )
    ) anot
    ON  anot.id_documento = docu.id_documento*/
    LEFT JOIN unico.anotacao anot
        ON  anot.id_documento = docu.id_documento
            AND anot.st_ativo = 1
    LEFT JOIN solr.agg_minuta_juntada agmj
        ON  docu.id_documento = agmj.id_documento
    LEFT JOIN unico.distribuicao_nova dino
        ON  dino.id_distribuicao = auad.id_distribuicao_responsavel
    LEFT JOIN unico.tipo_vinculo tivi
        ON  tivi.id_tipo_vinculo = dino.id_tipo_vinculo
    LEFT JOIN unico.oficio ofic
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
	--#ULISSES - 15.06.2022 - Inicio        
	LEFT JOIN unico_desnormalizado.documento_ultima_ocor_expe duoe 
	    ON duoe.id_documento = docu.id_documento
	LEFT JOIN unico.documento_grupo_tematico dgt 
		ON docu.id_documento = dgt.id_documento
			and dgt.st_grupo_tematico_principal = 1		
	LEFT JOIN unico.camara cam 
		ON dgt.id_grupo_tematico = cam.id_camara
    --#ULISSES - 15.06.2022 - Fim        
    INNER JOIN solr.crg_solr_atualizacao tb
        ON  tb.id_documento        = docu.id_documento    	
WHERE docu.id_genero               = 10
    AND docu.st_envelopado         = 'N'
    AND docu.st_exibir_gerenciador = 'S'
    AND auad.st_arquivado          = 'N'
    AND tb.nm_core                 = 'gerenciador'
    AND tb.tp_atualizacao          = 'full'
    AND
    (anot.id_anotacao =
        (SELECT
            /*+ index (anot2 idx_anot_id_docu_st_ativo) */
            MAX(anot2.id_anotacao)
        FROM
            unico.anotacao anot2
        WHERE anot2.id_documento = docu.id_documento
            AND anot2.st_ativo   = 1
        )
        OR anot.id_anotacao IS NULL)
UNION ALL
-- DOCUMENTO ADMINISTRATIVO
SELECT
    /*+ cardinality (tb, 1000) */
    tb.sq             AS sq,
    docu.id_documento AS id,
    docu.etiqueta     AS etiquetaexpediente_str,
    docu.id_genero    AS idgenero,
    gene.descricao    AS nomegenero_str,
    DECODE(docu.st_sigilo,
               'N', 'Normal',
               'R', 'Reservado',
               'C', 'Confidencial')                                 AS nomesigilo_str,
    TO_CHAR(docu.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS datamovimentacao_dt,
    TO_CHAR(mov.dt_recebimento, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')   AS datarecebimento_dt,
    DECODE(docu.st_digital,
               NULL, 0,
               docu.st_digital) AS eletronico,
    conc_orig.ds_concentrador   AS nomeconcentradororigem_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.ds_concentrador
        ELSE conc_dest.ds_concentrador ||
            ' - Aguardando recebimento'
    END AS nomeconcentradorlocalizado_str,
    CASE
        WHEN docu.id_concentrador_destino IS NULL
        THEN cl.id_concentrador
        ELSE conc_dest.id_concentrador
    END                                      AS idconcentradorlocalizado,
    nvl2(docu.id_concentrador_destino, 1, 0) AS areceber,
    assu.descricao                           AS assunto_str,
    2                                        AS idvisao,
    CASE doad.st_natureza
        WHEN 'X'
        THEN 3
        WHEN 'A'
        THEN 2
        WHEN 'J'
        THEN 1
        ELSE NULL
    END AS idtiponatureza,
    CASE doad.st_natureza
        WHEN 'X'
        THEN 'Extrajudicial'
        WHEN 'A'
        THEN 'Administrativa'
        WHEN 'J'
        THEN 'Judicial'
        ELSE NULL
    END                                               AS nometiponatureza_str,
    docu.st_envelopado                                AS envelopado,
    docu.st_exibir_gerenciador                        AS exibirgerenciador,
    doad.st_arquivado                                 AS arquivado,
    solr.pkg_solr.fnc_limpar_caracter(doad.ds_resumo) AS resumo_str,
    CASE
        WHEN doad.st_congelado    = 'S'
            AND doad.st_documento = 'C'
        THEN 'Original Congelado'
        WHEN doad.st_documento = 'P'
        THEN 'Pendente'
        WHEN doad.id_documento_originador IS NOT NULL
        THEN 'Cópia'
        ELSE DECODE(doad.st_documento,
                        'N', 'Normal',
                        'C', 'Original',
                        'F', 'Finalizado')
    END AS situacaodocumento_str,
    -- EXTRAJUDICIAL
    TO_CHAR(docu.dt_cadastro, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataautuacao_dt,
    tido.descricao                                              AS siglaclasse_str,
    TO_CHAR(doad.dt_limite, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')   AS dataprazofim_dt,
    NULL                                                        AS nomeareaatuacao_str,
    NULL                                                        AS nometiposituacaoae_str,
    -- DESIGNACAO
    NULL                     AS nomedesignado_str,
    NULL                     AS dataprevdevdesignacao_dt,
    NULL                     AS idusuarioinclusaodesignacao,
    NULL                     AS idsetorinclusaodesignacao,
    NULL                     AS situacaosigilodesignacao,
    0                        AS qtdedesignadosforasetor,
    doad.st_minuta           AS minuta,
    agmj.qt_minutas_juntadas AS minutadocsjuntados,
    -- ANOTAÇÃO
    anot.descricao AS textoultimaanotacao_str,
    NULL           AS textopesquisa,
    NULL           AS iddistribuicaoresponsavel,
    NULL           AS idmacroresponsavel_str,
    NULL           AS nomemacroresponsavel_str,
    NULL           AS idoficioresponsavel_str,
    NULL           AS nomeoficioresponsavel_str,
    NULL           AS idtipovinculoresponsavel_str,
    NULL           AS nometipovinculoresponsavel_str,
    -- campos novos do JUDICIAL
    NULL AS idorgaojulgador,
    NULL AS orgaojulgador_str,
    NULL AS linkprocesso_str,
    NULL AS idunidadeorganica,
    NULL AS idareaatuacao,
    NULL AS areaatuacao_str,
    NULL AS idrelator,
    NULL AS relator_str,
    NULL AS idautuacao,
    NULL AS etiquetaautuacao_str,
    NULL AS numeroprotocoloregistro_str,
    NULL AS idoperacaopolicial,
    NULL AS operacaopolicial_str,
    NULL AS entrada_dt,
    NULL AS idorgaogerador,
    NULL AS orgaogerador_str,
    NULL AS orgaogeradordominio_str,
    NULL AS urgente_str,
    NULL AS semprioridade_str,
    NULL AS idclassejudiciaria,
    NULL AS classejudiciaria_str,
    NULL AS idtipodistribuicao,
    NULL AS tipodistribuicao_str,
    NULL AS idoficio,
    NULL AS reupreso_str,
    NULL AS parteprioritaria_str,
    NULL AS iddesignado,
    NULL AS existeprazodevolucao_str,
    NULL AS prazodevolucao_dt,
    NULL AS penaminima_dt,
    NULL AS penamaxima_dt,
    NULL AS penaminimaconcreta_dt,
    NULL AS uf_str,
    NULL AS latitude,
    NULL AS longitude,
    NULL AS idsituacaoautuacao,
    NULL AS situacaoautuacao_str,
    NULL AS limiteparaconclusao_dt,
    NULL AS entradampfcd_str,
    NULL AS entradampf_str,
    NULL AS assuntonivel_str,
    NULL AS possuiintimacao_str,
    NULL AS possuiintimacaopendente_str,
    NULL AS temintimacaocomerroenvio_str,
    NULL AS anotacoes,
    NULL AS datareferencia_dt,
    NULL AS siglaprocdistribuicao_str,
    NULL AS nompf_str,
    NULL AS nosetor_str,
    NULL AS tipoapenso_str,
    NULL AS motivoentrada_str,
    NULL AS ultimasaidaunidade_str,
    NULL AS origemoutraunidademacro,
    NULL AS orgaogeradorsigla_str,
    NULL AS possuimanifestacaoentrada_str,
    NULL AS manifestacaoentradaatual_str,
    NULL AS situacaoassinatura_str,
    NULL AS iddocmanifestacaoentradaatual,
    NULL AS dtmanifestacaoentradaatual_dt,
    NULL AS juizrelator_str,
    NULL AS materiarepetitiva_str,
    NULL AS reupresoclassificacao_str,
    NULL AS dtlocalizacao_dt, 
     --#ULISSES - 15.06.2022 - Inicio
    NULL AS datatempoparado_dt, 
    NULL AS grupotematicoprincipal_str,
    --#ULISSES - 15.06.2022 - Fim
    --#FABIANAG - 17/06/2022 - INICIO
    NULL AS temintimacaopendentenova_str
    --#FABIANAG - 17/06/2022 - FIM
FROM
    unico.documento              docu
    LEFT JOIN unico.movimentacao mov
        ON  mov.id_movimentacao                    = docu.id_movimentacao
            AND docu.id_concentrador_destino IS NULL
    -- Na full é INNER
    INNER JOIN unico.concentrador cl
        ON  cl.id_concentrador = docu.id_concentrador_localizado
    LEFT JOIN unico.concentrador conc_orig
        ON  docu.id_concentrador_origem = conc_orig.id_concentrador
    LEFT JOIN unico.concentrador conc_dest
        ON  docu.id_concentrador_destino = conc_dest.id_concentrador
    INNER JOIN unico.genero gene
        ON  docu.id_genero = gene.id_genero
    LEFT JOIN unico.assunto assu
        ON  docu.id_assunto = assu.id_assunto
    -- DOCUMENTO ADMINISTRATIVO
    INNER JOIN unico.documento_administrativo doad
        ON  docu.id_documento = doad.id_documento
    INNER JOIN unico.tipo_documento tido
        ON  doad.id_tipo_documento = tido.id_tipo_documento
    -- ANOTAÇÃO
    /*LEFT JOIN
    (SELECT
    anot1.descricao,
    anot1.dt_inclusao,
    anot1.id_anotacao,
    anot1.id_documento id_documento
    FROM
    unico.anotacao anot1
    WHERE anot1.st_ativo      = 1
    AND anot1.id_anotacao =
    (SELECT
    MAX(anot2.id_anotacao)
    FROM
    unico.anotacao anot2
    WHERE anot2.id_documento = anot1.id_documento
    AND anot2.st_ativo   = 1
    )
    ) anot
    ON  anot.id_documento = docu.id_documento*/
    LEFT JOIN unico.anotacao anot
        ON  anot.id_documento = docu.id_documento
            AND anot.st_ativo = 1
    LEFT JOIN solr.agg_minuta_juntada agmj
        ON  docu.id_documento = agmj.id_documento
    INNER JOIN solr.crg_solr_atualizacao tb
        ON  tb.id_documento        = docu.id_documento
WHERE docu.id_genero               = 41
    AND docu.st_envelopado         = 'N'
    AND docu.st_exibir_gerenciador = 'S'
    AND doad.st_arquivado          = 'N'
    AND tb.nm_core                 = 'gerenciador'
    AND tb.tp_atualizacao          = 'full'
    AND
    (anot.id_anotacao =
        (SELECT
            /*+ index (anot2 idx_anot_id_docu_st_ativo) */
            MAX(anot2.id_anotacao)
        FROM
            unico.anotacao anot2
        WHERE anot2.id_documento = docu.id_documento
            AND anot2.st_ativo   = 1
        )
        OR anot.id_anotacao IS NULL)
UNION ALL
--JUDICIAL
SELECT
    /*+ cardinality (tb, 1000) */
    tb.sq           AS sq,
    dc.id_documento AS id,
    au.ds_etiqueta  AS etiquetaexpediente_str,
    dc.id_genero    AS idgenero,
    gen.descricao   AS nomegenero_str,
    DECODE(dc.st_sigilo,
               'N', 'Normal',
               'R', 'Reservado',
               'C', 'Confidencial')                               AS nomesigilo_str,
    TO_CHAR(mv.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS datamovimentacao_dt,
    TO_CHAR(mv.dt_recebimento, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')  AS datarecebimento_dt,
    DECODE(dc.st_digital,
               NULL, 0,
               dc.st_digital) AS eletronico,
    conc_orig.ds_concentrador AS nomeconcentradororigem_str,
    CASE
        WHEN dc.id_concentrador_destino IS NULL
        THEN cd.ds_concentrador
        ELSE conc_dest.ds_concentrador ||
            ' - Aguardando recebimento'
    END AS nomeconcentradorlocalizado_str,
    CASE
        WHEN dc.id_concentrador_destino IS NULL
        THEN cd.id_concentrador
        ELSE conc_dest.id_concentrador
    END                                                       AS idconcentradorlocalizado,
    nvl2(dc.id_concentrador_destino, 1, 0)                    AS areceber,
    ica.nm_hierarquia_item                                    AS assunto_str,
    1                                                         AS idvisao,
    NULL                                                      AS idtiponatureza,
    NULL                                                      AS nometiponatureza_str,
    dc.st_envelopado                                          AS envelopado,
    dc.st_exibir_gerenciador                                  AS exibirgerenciador,
    DECODE(NVL(pj.st_arquivado, 0),
               0, 'N',
               'S')                                           AS arquivado,
    solr.pkg_solr.fnc_limpar_caracter(au.ds_objeto)           AS resumo_str,
    NULL                                                      AS situacaodocumento_str,
    TO_CHAR(au.dt_cadastro, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dataautuacao_dt,
    cj.sigla                                                  AS siglaclasse_str,
    TO_CHAR(cp.dt_prazo, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')    AS dataprazofim_dt,
    ar.descricao                                              AS nomeareaatuacao_str,
    NULL                                                      AS nometiposituacaoae_str,
    -- DESIGNACAO
    NULL           AS nomedesignado_str,
    NULL           AS dataprevdevdesignacao_dt,
    NULL           AS idusuarioinclusaodesignacao,
    NULL           AS idsetorinclusaodesignacao,
    NULL           AS situacaosigilodesignacao,
    0              AS qtdedesignadosforasetor,
    0              AS minuta,
    0              AS minutadocsjuntados,
    anot.descricao AS textoultimaanotacao_str,
    NULL           AS textopesquisa,
    -- NVL(dn_distconclusao.id_distribuicao, dn_disttitular.id_distribuicao) AS iddistribuicaoresponsavel,
    -- uomacro_disttitular.id_unidade_organica                               AS idmacroresponsavel_str,
    -- uomacro_disttitular.nome                                              AS nomemacroresponsavel_str,
    -- NVL(of_distconclusao.id_oficio, of_disttitular.id_oficio)             AS idoficioresponsavel_str,
    -- NVL(of_distconclusao.nm_oficio, of_disttitular.nm_oficio)             AS nomeoficioresponsavel_str,
    -- NVL(tv_distconclusao.id_tipo_vinculo, 1)                              AS idtipovinculoresponsavel_str,
    -- NVL(tv_distconclusao.nm_tipo_vinculo, 'Titular')                      AS nometipovinculoresponsavel_str,
    dn_distconclusao.id_distribuicao          AS iddistribuicaoresponsavel,
    uomacro_distconclusao.id_unidade_organica AS idmacroresponsavel_str,
    uomacro_distconclusao.nome                AS nomemacroresponsavel_str,
    of_distconclusao.id_oficio                AS idoficioresponsavel_str,
    of_distconclusao.nm_oficio                AS nomeoficioresponsavel_str,
    tv_distconclusao.id_tipo_vinculo          AS idtipovinculoresponsavel_str,
    tv_distconclusao.nm_tipo_vinculo          AS nometipovinculoresponsavel_str,
    oj.id_orgao_julgador                      AS idorgaojulgador,
    oj.nome                                   AS orgaojulgador_str,
    CASE
        WHEN(og.url_consulta_processo IS NULL)
        THEN '0'
        WHEN(og.sigla = 'STF')
        THEN og.url_consulta_processo ||
                cj.sigla              ||
            '+'                       ||
                au.nr_autuacao_sem_mascara
        ELSE og.url_consulta_processo ||
                au.nr_autuacao_sem_mascara
    END                            AS linkprocesso_str,
    NVL(cd.id_unidade_organica, 0) AS idunidadeorganica,
    CASE
        WHEN(pj.id_area_atuacao IS NULL)
        THEN 0
        ELSE pj.id_area_atuacao
    END          AS idareaatuacao,
    ar.descricao AS areaatuacao_str,
    CASE
        WHEN jr.id_juiz_relator IS NULL
        THEN 0
        ELSE jr.id_juiz_relator
    END                      AS idrelator,
    jr.nome                  AS relator_str,
    au.id_autuacao           AS idautuacao,
    au.ds_etiqueta           AS etiquetaautuacao_str,
    au.nr_protocolo_registro AS numeroprotocoloregistro_str,
    CASE
        WHEN(op.id_operacao IS NULL)
        THEN 0
        ELSE op.id_operacao
    END                                                           AS idoperacaopolicial,
    op.nome                                                       AS operacaopolicial_str,
    TO_CHAR(mv.dt_movimentacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS entrada_dt,
    au.id_orgao_governo                                           AS idorgaogerador,
    og.nome                                                       AS orgaogerador_str,
    og.dominio                                                    AS orgaogeradordominio_str,
    dc.st_urgente                                                 AS urgente_str,
    NULL                                                          AS semprioridade_str,
    CASE
        WHEN(cn.id_item_cnmp IS NULL)
        THEN 0
        ELSE cn.id_item_cnmp
    END          AS idclassejudiciaria,
    cj.descricao AS classejudiciaria_str,
    NULL         AS idtipodistribuicao,
    NULL         AS tipodistribuicao_str,
    NULL         AS idoficio,
    DECODE(NVL(idosos_e_reus_presos.reu_preso, 0),
               0, 'N',
               'S') AS reupreso_str,
    DECODE(NVL(idosos_e_reus_presos.idoso, 0),
               0, 'N',
               'S')                                                           AS parteprioritaria_str,
    NULL                                                                      AS iddesignado,
    nvl2(cp.dt_prazo, 'S', 'N')                                               AS existeprazodevolucao_str,
    TO_CHAR(cp.dt_prazo, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')                    AS prazodevolucao_dt,
    TO_CHAR(pj.dt_pena_minima, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')              AS penaminima_dt,
    TO_CHAR(pj.dt_pena_maxima, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')              AS penamaxima_dt,
    TO_CHAR(pj.dt_pena_minima_concreta, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')     AS penaminimaconcreta_dt,
    -- #Fabiana - as colunas uf, latitude e longitude foram anuladas, pois não estão sendo utilizadas pela aplicação, podendo ser retiradas do SOLR*/
    NULL                                                                      AS uf_str,
	NULL                            				  						  AS latitude,
	NULL										                              AS longitude,
	-- #Fabiana Fim
    NVL(sa.id_situacao_autuacao, 999)                                         AS idsituacaoautuacao,
    NVL(sa.nm_situacao_autuacao, 'Sem situação')                              AS situacaoautuacao_str,
    TO_CHAR(itmdp.dt_limite_para_conclusao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS limiteparaconclusao_dt,
    CASE
        WHEN ep.qt_entrada_procuradoria = 1
        THEN 'p'
        WHEN ep.qt_entrada_procuradoria > 1
        THEN 'r'
        ELSE 'n'
    END entradampfcd_str,
    CASE
        WHEN ep.qt_entrada_procuradoria = 1
        THEN '1ª Entrada'
        WHEN ep.qt_entrada_procuradoria > 1
        THEN 'Retorno'
        ELSE 'Nenhuma'
    END entradampf_str,
    nvl2(ica.cd_cnmp, ica.cd_cnmp ||
    ' - '                         ||
        ica.ds_item, NULL) AS assuntonivel_str,
    NULL AS possuiintimacao_str, -- #FABIANAG - 17/06/2022 -  coluna anulada, pois não estão sendo utilizada pela aplicação, podendo ser retiradas do SOLR.    
    CASE
        WHEN (aac.id_autuacao IS NOT NULL AND aac.QT_INTIMACAO_PENDENTE > 0) -- #FABIANAG - 17/06/2022 - acrescentei a condição aac.QT_INTIMACAO_PENDENTE > 0
        THEN 1
        ELSE 0
    END AS possuiintimacaopendente_str,
    NULL AS temintimacaocomerroenvio_str,
    NULL AS anotacoes,
    NULL AS datareferencia_dt,
    --DISTRIBUICAO
    NULL  AS siglaprocdistribuicao_str,
    NVL2(cd.id_unidade_organica,'Sim', 'Não') AS nompf_str,
    NULL AS nosetor_str,
    (SELECT
        CASE ep.st_vistas
            WHEN 1
            THEN 'Vistas'
            WHEN 0
            THEN 'Sem Vistas'
        END
    FROM
        unico.referencia_nova r
    WHERE r.id_tipo_referencia         = 5
        AND r.dt_finalizacao     IS NULL
        AND au.id_documento            = r.id_documento_secundario
        AND ep.st_principal            = 0
        AND ep.id_entrada_procuradoria = au.id_entrada_procuradoria_atual
        AND ROWNUM = 1
    ) AS tipoapenso_str,
    nvl2(tipoent.descricao, tipoent.descricao, '') ||
        nvl2(compentrada.descricao, ' - '          ||
        compentrada.descricao, '')                 ||
        nvl2(detent.descricao, ' - '               ||
        detent.descricao, '') AS motivoentrada_str,
    NULL                      AS ultimasaidaunidade_str,
    CASE
        WHEN unidorigem.id_unidade_organica_macro <> uniddestino.id_unidade_organica_macro
        THEN 1
        ELSE 0
    END      AS origemoutraunidademacro,
    og.sigla AS orgaogeradorsigla_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN nvl2(docmanif.id_documento, 'Sim', 'Não')
        ELSE 'Não'
    END AS possuimanifestacaoentrada_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN docmanif.etiqueta
        ELSE NULL
    END AS manifestacaoentradaatual_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao AND docmanif.st_digital = 1
        THEN
            CASE docmanif.id_tp_situ_assinatura_digital
                WHEN 0
                THEN 'Não Conclusa para Assinatura'
                WHEN 1
                THEN 'Conclusa para Assinatura'
                WHEN 2
                THEN 'Assinado Digitalmente'
                WHEN 3
                THEN 'Devolvida para Correção'
                WHEN 4
                THEN 'Enviada e não Assinada no Único'
                ELSE NULL
            END
        ELSE NULL
    END AS situacaoassinatura_str,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN ma.id_documento
        ELSE NULL
    END AS iddocmanifestacaoentradaatual,
    CASE
        WHEN ma.data >= mv.dt_movimentacao
        THEN TO_CHAR(ma.data, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"')
        ELSE NULL
    END AS dtmanifestacaoentradaatual_dt,
    jr.NOME AS juizrelator_str,
    DECODE(NVL(pj.st_materia_repetitiva, 0),
               0, 'Não',
               'Sim') AS materiarepetitiva_str,
    DECODE(NVL(cp.st_reu_preso, 0),
               0, 'Não',
               'Sim') AS reupresoclassificacao_str,
    TO_CHAR(dc.dt_localizacao, 'YYYY-MM-DD"T"HH24:MI:SS".842Z"') AS dtlocalizacao_dt,
    --#ULISSES - 15/06/2022 - Inicio
    NULL AS datatempoparado_dt, 
    NULL AS grupotematicoprincipal_str,
    --#ULISSES - 15/06/2022 - Fim
    --#FABIANAG - 17/06/2022 - INICIO
    CASE
        WHEN (aac.id_autuacao IS NOT NULL AND aac.QT_INTIMACAO_PENDENTE_NOVA  > 0)
        THEN 1
        ELSE 0
    END AS temintimacaopendentenova_str
    --#FABIANAG - 17/06/2022 - FIM
FROM
    unico.documento                    dc
    INNER JOIN unico.processo_judicial pj
        ON  dc.id_documento = pj.id_documento
    LEFT JOIN unico.area_atuacao ar
        ON  pj.id_area_atuacao = ar.id_area_atuacao
    LEFT JOIN unico.operacao op
        ON  pj.id_operacao = op.id_operacao
    INNER JOIN unico.autuacao au
        ON  pj.id_autuacao_vigente = au.id_autuacao
    LEFT JOIN unico.entrada_procuradoria ep
        ON  au.id_entrada_procuradoria_atual = ep.id_entrada_procuradoria
    LEFT JOIN unico.movimentacao mv
        ON  mv.id_movimentacao = ep.id_movimentacao_entrada
    LEFT JOIN unico.orgao_julgador oj
        ON  au.id_orgao_julgador = oj.id_orgao_julgador
    LEFT JOIN unico.juiz_relator jr
        ON  au.id_juiz_relator = jr.id_juiz_relator
    INNER JOIN unico.orgao_governo og
        ON  au.id_orgao_governo = og.id_orgao_governo
    -- Na full é INNER
    INNER JOIN unico.concentrador cd
        ON  dc.id_concentrador_localizado = cd.id_concentrador
    -- Na full é INNER
    INNER JOIN unico.concentrador conc_orig
        ON  dc.id_concentrador_origem = conc_orig.id_concentrador
    LEFT JOIN unico.concentrador conc_dest
        ON  dc.id_concentrador_destino = conc_dest.id_concentrador
    LEFT JOIN corporativo.unidade_organica unidorigem
        ON  unidorigem.id_unidade_organica = conc_orig.id_unidade_organica
    LEFT JOIN corporativo.unidade_organica uniddestino
        ON  uniddestino.id_unidade_organica = conc_dest.id_unidade_organica
    INNER JOIN unico.classe_judiciaria cj
        ON  au.id_classe_judiciario = cj.id_classe_judiciario
    LEFT JOIN unico.classificacao_processo cp
        ON  au.id_entrada_procuradoria_atual = cp.id_entrada_procuradoria
    LEFT JOIN unico.item_cnmp cn
        ON  cj.id_item_cnmp = cn.id_item_cnmp
    INNER JOIN corporativo.unidade_organica uo
        ON  dc.id_uorg_macro_cadastro = uo.id_unidade_organica
    LEFT JOIN corporativo.municipio mu1
        ON  uo.endereco_id_municipio = mu1.id_municipio
    LEFT JOIN unico.situacao_autuacao sa
        ON  au.id_situacao_autuacao = sa.id_situacao_autuacao
    LEFT JOIN unico.ipl_tco it
        ON  au.id_autuacao = it.id_autuacao
    LEFT JOIN unico.manifestacao ma
        ON  au.id_autuacao = ma.id_autuacao
    LEFT JOIN unico.ipl_tco_mani_dilacao_prazo itmdp
        ON  ma.id_documento                    = itmdp.id_documento_manifestacao
            AND itmdp.dt_conclusao_prazo IS NULL
    --#Pedro Passei para cima
    --LEFT JOIN unico.entrada_procuradoria ep ON  au.id_entrada_procuradoria_atual = ep.id_entrada_procuradoria
    --#Pedro Fim
    LEFT JOIN unico.item_cnmp_documento icd
        ON  au.id_documento           = icd.id_documento
            AND icd.st_tema_principal = 1
    LEFT JOIN unico.item_cnmp ica
        ON  icd.id_item_cnmp = ica.id_item_cnmp
            AND ica.tp_item  = 'A'
    INNER JOIN unico.genero gen
        ON  dc.id_genero = gen.id_genero --[monitorar] ?
    LEFT JOIN unico.anotacao anot
        ON  anot.id_documento = dc.id_documento
            AND anot.st_ativo = 1
    LEFT JOIN solr.agg_idosos_e_reus_presos idosos_e_reus_presos
        ON  dc.id_documento = idosos_e_reus_presos.id_documento
    -- FABIANAG - 17/06/2022 - Substituição da referência a tabela 
    LEFT JOIN UNICO_DESNORMALIZADO.AUTUACAO_AVISO_COMUNICACAO aac 
       ON  au.id_autuacao = aac.id_autuacao    
    -- FABIANAG - 17/06/2022 - Substituição da referência a tabela 
    LEFT JOIN unico.movimentacao_judicial mj_distconclusao
        ON  mj_distconclusao.id_movimentacao = ep.id_movimentacao_ulti_conclusao
            AND mj_distconclusao.id_fase_processo IN(4685,
                                                     7591)
    LEFT JOIN unico.distribuicao_nova dn_distconclusao
        ON  dn_distconclusao.id_distribuicao = mj_distconclusao.id_distribuicao
    -- A lógica de join original, problemática, fazia um "curto-circuito": dc->pj->au->ep->mj->dn->pj!!
    -- Portanto, evito o problema ao selecionar, depois (na cláusula WHERE), os ids que coincidem.
    -- AND NVL(dn_distconclusao.id_documento_distribuido, pj.id_documento) = pj.id_documento
    LEFT JOIN unico.oficio of_distconclusao
        ON  of_distconclusao.id_oficio = dn_distconclusao.id_oficio
    LEFT JOIN unico.tipo_vinculo tv_distconclusao
        ON  tv_distconclusao.id_tipo_vinculo = dn_distconclusao.id_tipo_vinculo
    LEFT JOIN corporativo.unidade_organica uomacro_distconclusao
        ON  uomacro_distconclusao.id_unidade_organica = dn_distconclusao.id_uorg_procuradoria
    LEFT JOIN unico.tipo_entrada tipoent
        ON  tipoent.id_tipo_entrada = cp.id_tipo_entrada
    LEFT JOIN unico.complemento_entrada compentrada
        ON  compentrada.id_complemento_entrada = cp.id_complemento_entrada
    LEFT JOIN unico.detalhamento_entrada detent
        ON  detent.id_detalhamento_entrada = cp.id_detalhamento_entrada
    LEFT JOIN unico.documento docmanif
        ON  docmanif.id_documento = ma.id_documento
    INNER JOIN solr.crg_solr_atualizacao tb
        ON  tb.id_documento = dc.id_documento
WHERE dc.id_genero          = 92
    AND dc.st_envelopado    = 'N'
    AND tb.nm_core          = 'gerenciador'
    AND tb.tp_atualizacao   = 'full'
    AND
    (cp.id_classificacao_processo IS NULL
        OR cp.id_classificacao_processo =
        (SELECT
            MAX(cp2.id_classificacao_processo)
        FROM
            unico.classificacao_processo cp2
        WHERE cp2.id_entrada_procuradoria = au.id_entrada_procuradoria_atual
        ))
    AND NVL(ma.id_documento, 1) = NVL(
                                       (SELECT
                                           MAX(ma0.id_documento)
                                       FROM
                                           unico.manifestacao ma0
                                       WHERE ma0.id_autuacao = au.id_autuacao
                                      ), 1)
    AND NVL(icd.id_item_cnmp_documento, 1) = NVL(
                                                  (SELECT
                                                      MAX(icd1.id_item_cnmp_documento)
                                                  FROM
                                                      unico.item_cnmp_documento icd1
                                                  WHERE au.id_documento          = icd1.id_documento
                                                      AND icd1.st_tema_principal = 1
                                                 ), 1)
    AND
    (anot.id_anotacao =
        (SELECT
            /*+ index (anot2 idx_anot_id_docu_st_ativo) */
            MAX(anot2.id_anotacao)
        FROM
            unico.anotacao anot2
        WHERE anot2.id_documento = dc.id_documento
            AND anot2.st_ativo   = 1
        )
        OR anot.id_anotacao IS NULL)
    -- Só na Full.
    AND cd.id_unidade_organica > 0;

COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07#FULL"
IS
    'REV 001 - solr.views_gerenciador - ULISSES e FABIANAG em 17/06/2022 - JIRAs 9254, 8819 e 9456. Adicionados os campos DATATEMPOPARADO_DT, GRUPOTEMATICOPRINCIPAL_STR, TEMINTIMACAOPENDENTENOVA_STR.';


CREATE
OR REPLACE force VIEW "SOLR"."VW_GERENCIADOR_DOC07#FULL_XML"("SQ", "XML") AS
SELECT
    sq,
    xmlelement("DOC",
        gerenciador_doc07(
            solr.fnc_limpar_caracter_espec(id),
            solr.fnc_limpar_caracter_espec(etiquetaexpediente_str),
            solr.fnc_limpar_caracter_espec(idgenero),
            solr.fnc_limpar_caracter_espec(nomegenero_str),
            solr.fnc_limpar_caracter_espec(nomesigilo_str),
            solr.fnc_limpar_caracter_espec(datamovimentacao_dt),
            solr.fnc_limpar_caracter_espec(datarecebimento_dt),
            solr.fnc_limpar_caracter_espec(eletronico),
            solr.fnc_limpar_caracter_espec(nomeconcentradororigem_str),
            solr.fnc_limpar_caracter_espec(nomeconcentradorlocalizado_str),
            solr.fnc_limpar_caracter_espec(idconcentradorlocalizado),
            solr.fnc_limpar_caracter_espec(areceber),
            solr.fnc_limpar_caracter_espec(assunto_str),
            solr.fnc_limpar_caracter_espec(idvisao),
            solr.fnc_limpar_caracter_espec(idtiponatureza),
            solr.fnc_limpar_caracter_espec(nometiponatureza_str),
            solr.fnc_limpar_caracter_espec(envelopado),
            solr.fnc_limpar_caracter_espec(exibirgerenciador),
            solr.fnc_limpar_caracter_espec(arquivado),
            solr.fnc_limpar_caracter_espec(resumo_str),
            solr.fnc_limpar_caracter_espec(situacaodocumento_str),
            solr.fnc_limpar_caracter_espec(dataautuacao_dt),
            solr.fnc_limpar_caracter_espec(siglaclasse_str),
            solr.fnc_limpar_caracter_espec(dataprazofim_dt),
            solr.fnc_limpar_caracter_espec(nomeareaatuacao_str),
            solr.fnc_limpar_caracter_espec(nometiposituacaoae_str),
            solr.fnc_limpar_caracter_espec(nomedesignado_str),
            solr.fnc_limpar_caracter_espec(dataprevdevdesignacao_dt),
            solr.fnc_limpar_caracter_espec(idusuarioinclusaodesignacao),
            solr.fnc_limpar_caracter_espec(idsetorinclusaodesignacao),
            solr.fnc_limpar_caracter_espec(situacaosigilodesignacao),
            solr.fnc_limpar_caracter_espec(qtdedesignadosforasetor),
            solr.fnc_limpar_caracter_espec(minuta),
            solr.fnc_limpar_caracter_espec(minutadocsjuntados),
            solr.fnc_limpar_caracter_espec(textoultimaanotacao_str),
            solr.fnc_limpar_caracter_espec(textopesquisa),
            solr.fnc_limpar_caracter_espec(iddistribuicaoresponsavel),
            solr.fnc_limpar_caracter_espec(idmacroresponsavel_str),
            solr.fnc_limpar_caracter_espec(nomemacroresponsavel_str),
            solr.fnc_limpar_caracter_espec(idoficioresponsavel_str),
            solr.fnc_limpar_caracter_espec(nomeoficioresponsavel_str),
            solr.fnc_limpar_caracter_espec(idtipovinculoresponsavel_str),
            solr.fnc_limpar_caracter_espec(nometipovinculoresponsavel_str),
            solr.fnc_limpar_caracter_espec(idorgaojulgador),
            solr.fnc_limpar_caracter_espec(orgaojulgador_str),
            solr.fnc_limpar_caracter_espec(linkprocesso_str),
            solr.fnc_limpar_caracter_espec(idunidadeorganica),
            solr.fnc_limpar_caracter_espec(idareaatuacao),
            solr.fnc_limpar_caracter_espec(areaatuacao_str),
            solr.fnc_limpar_caracter_espec(idrelator),
            solr.fnc_limpar_caracter_espec(relator_str),
            solr.fnc_limpar_caracter_espec(idautuacao),
            solr.fnc_limpar_caracter_espec(etiquetaautuacao_str),
            solr.fnc_limpar_caracter_espec(numeroprotocoloregistro_str),
            solr.fnc_limpar_caracter_espec(idoperacaopolicial),
            solr.fnc_limpar_caracter_espec(operacaopolicial_str),
            solr.fnc_limpar_caracter_espec(entrada_dt),
            solr.fnc_limpar_caracter_espec(idorgaogerador),
            solr.fnc_limpar_caracter_espec(orgaogerador_str),
            solr.fnc_limpar_caracter_espec(orgaogeradordominio_str),
            solr.fnc_limpar_caracter_espec(urgente_str),
            solr.fnc_limpar_caracter_espec(semprioridade_str),
            solr.fnc_limpar_caracter_espec(idclassejudiciaria),
            solr.fnc_limpar_caracter_espec(classejudiciaria_str),
            solr.fnc_limpar_caracter_espec(idtipodistribuicao),
            solr.fnc_limpar_caracter_espec(tipodistribuicao_str),
            solr.fnc_limpar_caracter_espec(idoficio),
            solr.fnc_limpar_caracter_espec(reupreso_str),
            solr.fnc_limpar_caracter_espec(parteprioritaria_str),
            solr.fnc_limpar_caracter_espec(iddesignado),
            solr.fnc_limpar_caracter_espec(existeprazodevolucao_str),
            solr.fnc_limpar_caracter_espec(prazodevolucao_dt),
            solr.fnc_limpar_caracter_espec(penaminima_dt),
            solr.fnc_limpar_caracter_espec(penamaxima_dt),
            solr.fnc_limpar_caracter_espec(penaminimaconcreta_dt),
            solr.fnc_limpar_caracter_espec(uf_str),
            solr.fnc_limpar_caracter_espec(latitude),
            solr.fnc_limpar_caracter_espec(longitude),
            solr.fnc_limpar_caracter_espec(idsituacaoautuacao),
            solr.fnc_limpar_caracter_espec(situacaoautuacao_str),
            solr.fnc_limpar_caracter_espec(limiteparaconclusao_dt),
            solr.fnc_limpar_caracter_espec(entradampfcd_str),
            solr.fnc_limpar_caracter_espec(entradampf_str),
            solr.fnc_limpar_caracter_espec(assuntonivel_str),
            solr.fnc_limpar_caracter_espec(possuiintimacao_str),
            solr.fnc_limpar_caracter_espec(possuiintimacaopendente_str),
            solr.fnc_limpar_caracter_espec(temintimacaocomerroenvio_str),
            solr.fnc_limpar_caracter_espec(anotacoes),
            solr.fnc_limpar_caracter_espec(datareferencia_dt),
            solr.fnc_limpar_caracter_espec(siglaprocdistribuicao_str),
            solr.fnc_limpar_caracter_espec(nompf_str),
            solr.fnc_limpar_caracter_espec(nosetor_str),
            solr.fnc_limpar_caracter_espec(tipoapenso_str),
            solr.fnc_limpar_caracter_espec(motivoentrada_str),
            solr.fnc_limpar_caracter_espec(ultimasaidaunidade_str),
            solr.fnc_limpar_caracter_espec(origemoutraunidademacro),
            solr.fnc_limpar_caracter_espec(orgaogeradorsigla_str),
            solr.fnc_limpar_caracter_espec(possuimanifestacaoentrada_str),
            solr.fnc_limpar_caracter_espec(manifestacaoentradaatual_str),
            solr.fnc_limpar_caracter_espec(situacaoassinatura_str),
            solr.fnc_limpar_caracter_espec(iddocmanifestacaoentradaatual),
            solr.fnc_limpar_caracter_espec(dtmanifestacaoentradaatual_dt),
            solr.fnc_limpar_caracter_espec(juizrelator_str),
            solr.fnc_limpar_caracter_espec(materiarepetitiva_str),
            solr.fnc_limpar_caracter_espec(reupresoclassificacao_str),
            solr.fnc_limpar_caracter_espec(dtlocalizacao_dt),
            -- #FABIANAG - 17/06/2022 - INICIO
            solr.fnc_limpar_caracter_espec(datatempoparado_dt), 
            solr.fnc_limpar_caracter_espec(grupotematicoprincipal_str), 
            solr.fnc_limpar_caracter_espec(temintimacaopendentenova_str),
            -- #FABIANAG - 17/06/2022 - FIM
    CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_usuario_acessa)
    FROM
        vw_gerenciador_doc07_visipess v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_visipess_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_uorg_acessa)
    FROM
        vw_gerenciador_doc07_visisetr v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_visisetr_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.rotulo)
    FROM
        vw_gerenciador_doc07_rotulo v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_rotulo_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.designacao)
    FROM
        vw_gerenciador_doc07_designa v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_designa_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.oficiotitular)
    FROM
        vw_gerenciador_doc07_ofictitu v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_ofictitu_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.aviso)
    FROM
        vw_gerenciador_doc07_aviso v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_aviso_tb), CAST(multiset
    (SELECT
        solr.fnc_limpar_caracter_espec(v.id_documento),
        solr.fnc_limpar_caracter_espec(v.id_unidade_organica_cadastro)
    FROM
        vw_gerenciador_doc07_notaexp v
    WHERE v.id_documento = doc.id
    ) AS gerenciador_doc07_notaexp_tb))) .getclobval() AS xml
FROM
    vw_gerenciador_doc07#full doc;


COMMENT ON TABLE "SOLR"."VW_GERENCIADOR_DOC07#FULL_XML"
IS
    'REV 001 - solr.views_gerenciador - ULISSES e FABIANAG em 17/06/2022 - JIRAs 9254, 8819 e 9456. Adicionados os campos DATATEMPOPARADO_DT, GRUPOTEMATICOPRINCIPAL_STR, TEMINTIMACAOPENDENTENOVA_STR.';


CREATE SYNONYM solr.vw_gerenciador_doc#crg_s FOR solr.vw_gerenciador_doc07#crg;


CREATE SYNONYM solr.vw_gerenciador_doc_visipess_s FOR solr.vw_gerenciador_doc07_visipess;


CREATE SYNONYM solr.vw_gerenciador_doc_visisetr_s FOR solr.vw_gerenciador_doc07_visisetr;


CREATE SYNONYM solr.vw_gerenciador_doc_rotulo_s FOR solr.vw_gerenciador_doc07_rotulo;


CREATE SYNONYM solr.vw_gerenciador_doc_designa_s FOR solr.vw_gerenciador_doc07_designa;


CREATE SYNONYM solr.vw_gerenciador_doc_ofictitu_s FOR solr.vw_gerenciador_doc07_ofictitu;


CREATE SYNONYM solr.vw_gerenciador_doc_aviso_s FOR solr.vw_gerenciador_doc07_aviso;


CREATE SYNONYM solr.vw_gerenciador_doc_notaexp_s FOR solr.vw_gerenciador_doc07_notaexp;


CREATE SYNONYM solr.vw_gerenciador_doc_s FOR solr.vw_gerenciador_doc07;


CREATE SYNONYM solr.vw_gerenciador_doc#xml_s FOR solr.vw_gerenciador_doc07#xml;


CREATE SYNONYM solr.vw_gerenciador_doc#full_s FOR solr.vw_gerenciador_doc07#full;


CREATE SYNONYM solr.vw_gerenciador_doc#full_xml_s FOR solr.vw_gerenciador_doc07#full_xml;



GRANT
SELECT ON solr.vw_gerenciador_doc07#crg TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_visipess TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_visisetr TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_rotulo TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_designa TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_ofictitu TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_aviso TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_notaexp TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07 TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_10 TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_41 TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_92 TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07#xml TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_10#xml TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_41#xml TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_92#xml TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07#full TO unico_web;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07#full_xml TO unico_web;
 

GRANT
SELECT ON solr.vw_gerenciador_doc07#crg TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_visipess TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_visisetr TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_rotulo TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_designa TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_ofictitu TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_aviso TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_notaexp TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07 TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_10 TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_41 TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_92 TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07#xml TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_10#xml TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_41#xml TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07_92#xml TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07#full TO rl_unico_r;
 
GRANT
SELECT ON solr.vw_gerenciador_doc07#full_xml TO rl_unico_r;
 

GRANT
EXECUTE ON solr.gerenciador_doc07 TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_visipess_tb TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_visipess TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_visisetr_tb TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_visisetr TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_rotulo_tb TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_rotulo TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_designa_tb TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_designa TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_ofictitu_tb TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_ofictitu TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_aviso_tb TO unico_web;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_aviso TO unico_web;


GRANT
EXECUTE ON solr.gerenciador_doc07 TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_visipess_tb TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_visipess TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_visisetr_tb TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_visisetr TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_rotulo_tb TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_rotulo TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_designa_tb TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_designa TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_ofictitu_tb TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_ofictitu TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_aviso_tb TO rl_unico_r;
 
GRANT
EXECUTE ON solr.gerenciador_doc07_aviso TO rl_unico_r;
