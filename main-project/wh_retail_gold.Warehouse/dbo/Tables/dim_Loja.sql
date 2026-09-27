CREATE TABLE [dbo].[dim_Loja] (
    [loja_id]    BIGINT         NULL,
    [nome_loja]  VARCHAR (8000) NULL,
    [estado]     VARCHAR (8000) NULL,
    [tipo_loja]  VARCHAR (8000) NULL,
    [data_carga] DATETIME2 (6)  NULL
);


GO