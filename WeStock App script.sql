-- SCRIPT WESTOCK APP

/* Exclusao das tabelas e respectivos lancamentos:

DROP TABLE T_WSA_USUARIO CASCADE CONSTRAINTS ;

DROP TABLE T_WSA_CONTA CASCADE CONSTRAINTS ;

DROP TABLE T_WSA_TIPO_CONTA CASCADE CONSTRAINTS ;

DROP TABLE T_WSA_PRODUTO CASCADE CONSTRAINTS ;

*/


-- CRIACAO DAS TABELAS


-- Tabela Usuario
CREATE TABLE T_WSA_USUARIO (
    id_usuario      NUMBER(10)      NOT NULL,
    nm_usuario      VARCHAR(100)    NOT NULL,
    ds_email        VARCHAR(200)    NOT NULL,
    ds_senha        VARCHAR(200)    NOT NULL
);

ALTER TABLE T_WSA_USUARIO
    ADD CONSTRAINT PK_WSA_USUARIO PRIMARY KEY (id_usuario);

ALTER TABLE T_WSA_USUARIO
    ADD CONSTRAINT UN_WSA_USUARIO UNIQUE (ds_email);


-- Tabela Conta
CREATE TABLE T_WSA_CONTA (
    id_conta        NUMBER(10)      NOT NULL,
    id_tipo_conta   NUMBER(10)      NOT NULL,
    id_user         NUMBER(10)      NOT NULL,
    nm_conta        VARCHAR(100)        NULL
);

ALTER TABLE T_WSA_CONTA
    ADD CONSTRAINT PK_WSA_CONTA PRIMARY KEY (id_conta);
    

-- Tabela Tipo de conta
CREATE TABLE T_WSA_TIPO_CONTA (
    id_tp_conta    NUMBER(10)   NOT NULL,
    ds_tp_conta    VARCHAR(100) NOT NULL
);

ALTER TABLE T_WSA_TIPO_CONTA
    ADD CONSTRAINT PK_WSA_TIPO_CONTA PRIMARY KEY (id_tp_conta);


-- Tabela produto
CREATE TABLE T_WSA_PRODUTO (
    id_produto      NUMBER(10)      NOT NULL,
    id_conta_vinc   NUMBER(10)      NOT NULL,
    nm_produto      VARCHAR(100)    NOT NULL,
    img_produto     BLOB                NULL,
    ds_produto      VARCHAR(200)        NULL,
    qt_produto      NUMBER(10)      NOT NULL,
    cd_sku          VARCHAR(100)        NULL,
    ds_peso_prod    FLOAT(10)           NULL,
    ds_tam_prod     FLOAT(10)           NULL,
    ds_cor_prod     VARCHAR2(100)       NULL,
    vl_compra       FLOAT(10)           NULL,
    vl_venda        FLOAT(10)           NULL,
    ds_local        VARCHAR2(100)       NULL
);

ALTER TABLE T_WSA_PRODUTO
    ADD CONSTRAINT PK_WSA_PRODUTO PRIMARY KEY (id_produto, id_conta_vinc);



-- CRIACAO FOREIGN KEYS

-- Relacionamento entre Conta e Tipo de Conta
ALTER TABLE T_WSA_CONTA
    ADD CONSTRAINT FK_WSA_CONTA_TP_CONTA FOREIGN KEY (id_tipo_conta)
        REFERENCES T_WSA_TIPO_CONTA (id_tp_conta);

-- Relacionamento entre Conta e Usuario
ALTER TABLE T_WSA_CONTA
    ADD CONSTRAINT FK_WSA_CONTA_USUARIO FOREIGN KEY (id_user)
        REFERENCES T_WSA_USUARIO (id_usuario);

-- Relacionamento entre Produto e Conta
ALTER TABLE T_WSA_PRODUTO
    ADD CONSTRAINT FK_WSA_PRODUTO_CONTA FOREIGN KEY (id_conta_vinc)
        REFERENCES T_WSA_CONTA (id_conta) ON DELETE CASCADE;



-- INCLUSAO DE DADOS

--Tabela USUÁRIO
INSERT INTO T_WSA_USUARIO (
    id_usuario,
    nm_usuario,
    ds_email,
    ds_senha
    ) 
    VALUES (
        [cod. ident. usuario],
        '[nome usuario]',
        '[email usuario]',
        '[senha usuario]'
        );
        
--Tabela CONTA
INSERT INTO T_WSA_CONTA (
    id_conta,
    id_tipo_conta,
    id_user,
    nm_conta
    ) 
    VALUES (
        [cod. ident. conta],
        [cod. ident. tipo de conta],
        [cod. ident. usuario],
        '[nome conta]'
        );

--Tabela TIPO CONTA
INSERT INTO T_WSA_TIPO_CONTA (id_tp_conta, ds_tp_conta)
    VALUES (1, 'Profissional');

INSERT INTO T_WSA_TIPO_CONTA (id_tp_conta, ds_tp_conta)
    VALUES (2, 'Pessoal');

--Tabela PRODUTO
INSERT INTO T_WSA_PRODUTO (
    id_produto,
    id_conta_vinc,
    nm_produto,
    ds_produto,
    qt_produto,
    cd_sku,
    ds_peso_prod,
    ds_tam_prod,
    ds_cor_prod,
    vl_compra,
    vl_venda,
    ds_local
    )
    VALUES (
        [cod. ident. produto],
        [cod. ident. conta],
        '[nome produto]'
        '[descricao produto]'
        [qtde. produto],
        [cod. sku],
        [peso produto],
        [tamanho produto],
        '[cor produto]',
        [valor compra produto],
        [valor venda produto],
        '[localizacao produto]'
        );


-- CONSULTA DE DADOS

--Tabela USUÁRIO (Consulta dados usuário)
SELECT * FROM T_WSA_USUARIO
WHERE id_usuario = [cod. ident. usuario];

--Tabela CONTA (Consulta contas cadastradas)
SELECT * FROM T_WSA_CONTA
WHERE id_user = [cod. ident. usuario];

--Tabela PRODUTO (Consulta produtos cadastrados)
SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta];

SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta] 
    AND nm_produto = '[nome produto consultado]';
    
SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta] 
    AND ds_produto = '[descricao produto consultado]';

SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta]
    AND qt_produto = [quantidade produto consultada];

SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta]
    AND cd_sku = [codigo sku consultado];

SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta]
    AND ds_peso_produto = [peso produto consultado];

SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta]
    AND ds_tam_produto = [tamanho produto consultado];

SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta]
    AND ds_cor_produto = '[cor produto consultada]';

SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta]
    AND vl_compra = [valor de compra consultado];

SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta]
    AND vl_venda = [valor de venda consultado];

SELECT * FROM T_WSA_PRODUTO
WHERE id_conta_vinc = [cod. ident. conta]
    AND ds_local = '[localizacao consultada]';


-- ALTERACAO DE DADOS

--Tabela USUÁRIO
UPDATE T_WSA_USUARIO
SET nm_usuario = '[nome atualizado]'
WHERE id_usuario = [cod. ident. usuario];

--Tabela CONTA
UPDATE T_WSA_CONTA
SET nm_conta = '[nome conta atualizado]'
WHERE id_conta = [cod. ident. conta];

--Tabela PRODUTO
UPDATE T_WSA_PRODUTO
SET nm_produto = '[nome produto atualizado]'
WHERE id_produto = [cod. ident. produto];

UPDATE T_WSA_PRODUTO
SET ds_produto = '[descricao produto atualizada]'
WHERE id_produto = [cod. ident. produto];

UPDATE T_WSA_PRODUTO
SET qt_produto = [quantidade produto atualizada]
WHERE id_produto = [cod. ident. produto];

UPDATE T_WSA_PRODUTO
SET cd_sku = [codigo sku atualizado]
WHERE id_produto = [cod. ident. produto];

UPDATE T_WSA_PRODUTO
SET ds_peso_produto = [peso produto atualizado]
WHERE id_produto = [cod. ident. produto];

UPDATE T_WSA_PRODUTO
SET ds_tam_produto = [tamanho produto atualizado]
WHERE id_produto = [cod. ident. produto];

UPDATE T_WSA_PRODUTO
SET ds_cor_produto = '[cor produto atualizada]'
WHERE id_produto = [cod. ident. produto];

UPDATE T_WSA_PRODUTO
SET vl_compra = [valor de compra atualizado]
WHERE id_produto = [cod. ident. produto];

UPDATE T_WSA_PRODUTO
SET vl_venda = [valor de venda atualizado]
WHERE id_produto = [cod. ident. produto];

UPDATE T_WSA_PRODUTO
SET ds_local = '[localizacao atualizada]'
WHERE id_produto = [cod. ident. produto];


-- EXCLUSAO DE DADOS

--Tabela CONTA
DELETE FROM T_WSA_CONTA
WHERE id_conta = [cod. ident. conta];

--Tabela PRODUTO
DELETE FROM T_WSA_PRODUTO
WHERE id_produto = [cod. ident. produto];
