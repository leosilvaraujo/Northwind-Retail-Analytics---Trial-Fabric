CREATE TABLE [dbo].[dim_Produto] (
    [produto_id]     BIGINT         NULL,
    [nome_produto]   VARCHAR (8000) NULL,
    [categoria]      VARCHAR (8000) NULL,
    [preco_unitario] FLOAT (53)     NULL,
    [custo_unitario] FLOAT (53)     NULL,
    [fornecedor_id]  BIGINT         NULL,
    [data_carga]     DATETIME2 (6)  NULL
);


GO