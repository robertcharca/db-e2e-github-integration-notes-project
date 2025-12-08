output "kinesis_stream_name" {
    value = aws_kinesis_stream.telematics_stream.name
}

output "kinesis_stream_arn" {
    value = aws_kinesis_stream.telematics_stream.arn
}

output "databricks_kinesis_role_arn" {
    value = aws_iam_role.databricks_kinesis_role.arn
}