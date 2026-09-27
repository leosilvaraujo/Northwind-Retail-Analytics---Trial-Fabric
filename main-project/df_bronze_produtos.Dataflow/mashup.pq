[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "produtos_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared produtos = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "132eeac1-17df-4579-b949-1720c023504d"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "03167705-8a2c-4afb-b2e4-6f351fa402d6"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "bronze"]}[Content],
  #"Navigation 4" = #"Navigation 3"{[Name = "produtos"]}[Content],
  #"Navigation 5" = #"Navigation 4"{[Name = "dim_produtos.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 5", [Delimiter = ",", Columns = 6, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"produto_id", Int64.Type}, {"nome_produto", type text}, {"categoria", type text}, {"preco_unitario", type number}, {"custo_unitario", type number}, {"fornecedor_id", Int64.Type}})
in
  #"Changed column type";
shared produtos_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "132eeac1-17df-4579-b949-1720c023504d"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "03167705-8a2c-4afb-b2e4-6f351fa402d6"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "dim_produtos", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
