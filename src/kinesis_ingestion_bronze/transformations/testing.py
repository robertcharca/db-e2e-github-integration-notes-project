from pyspark import pipelines as dp

@dp.table
def sample_aggregation_testing_pipeline():
    return (
        spark.read.format("csv")
        .option("header", "true")
        .load("s3://testing-agente-agente-123456/data/claims.csv")
    )