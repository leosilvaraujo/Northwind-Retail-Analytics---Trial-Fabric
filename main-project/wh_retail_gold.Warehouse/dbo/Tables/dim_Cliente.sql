CREATE TABLE [dbo].[dim_Cliente] (
    [cliente_id]    BIGINT         NULL,
    [nome_cliente]  VARCHAR (8000) NULL,
    [email]         VARCHAR (8000) NULL,
    [estado]        VARCHAR (8000) NULL,
    [data_cadastro] DATE           NULL,
    [segmento]      VARCHAR (8000) NULL,
    [data_carga]    DATETIME2 (6)  NULL
);


GO