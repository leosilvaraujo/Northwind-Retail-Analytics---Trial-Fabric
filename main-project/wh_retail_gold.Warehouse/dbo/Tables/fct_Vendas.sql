CREATE TABLE [dbo].[fct_Vendas] (
    [pedido_id]      INT            NULL,
    [item_pedido_id] INT            NULL,
    [cliente_id]     INT            NULL,
    [produto_id]     INT            NULL,
    [loja_id]        INT            NULL,
    [data_pedido]    DATE           NULL,
    [canal]          VARCHAR (8000) NULL,
    [quantidade]     INT            NULL,
    [desconto_pct]   FLOAT (53)     NULL,
    [preco_unitario] FLOAT (53)     NULL,
    [valor_bruto]    FLOAT (53)     NULL,
    [valor_liquido]  FLOAT (53)     NULL,
    [data_carga]     DATETIME2 (6)  NULL
);


GO