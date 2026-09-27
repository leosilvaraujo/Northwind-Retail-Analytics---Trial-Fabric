# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "03167705-8a2c-4afb-b2e4-6f351fa402d6",
# META       "default_lakehouse_name": "lh_retail",
# META       "default_lakehouse_workspace_id": "132eeac1-17df-4579-b949-1720c023504d",
# META       "known_lakehouses": [
# META         {
# META           "id": "03167705-8a2c-4afb-b2e4-6f351fa402d6"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

from pyspark.sql import functions as F
from delta.tables import DeltaTable

df_bronze =  spark.read.table('bronze_produtos')


#limpeza de dados camada bronze
df_silver =  (
    df_bronze.drop_duplicates(['produto_id'])
             .withColumn('data_carga', F.current_timestamp() )
) 

table_name = "silver_produtos"

if spark.catalog.tableExists(table_name):
    # Tabela já existe -> faz o MERGE (upsert)
    silver_table = DeltaTable.forName(spark, table_name)
    (
        silver_table.alias("target")
        .merge(
            df_silver.alias("source"),
            "target.produto_id = source.produto_id"
        )
        .whenMatchedUpdateAll()
        .whenNotMatchedInsertAll()
        .execute()
    )
else:
    # Primeira execução -> cria a tabela
    (
        df_silver.write
        .format("delta")
        .mode("overwrite")
        .saveAsTable(table_name)
    )



# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
