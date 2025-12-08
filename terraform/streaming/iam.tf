# IAM role that Databricks will assume
resource "aws_iam_role" "databricks_kinesis_role" {
    name = "databricks-kinesis-access-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = {
                    Service = "databricks.amazonaws.com"
                }
                Action = "sts:AssumeRole"
            }
        ]
    })
}

# IAM policy with the required minimal permissions
resource "aws_iam_policy" "databricks_kinesis_read_policy" {
    name        = "databricks-kinesis-read-policy"
    description = "Minimal permissions for Databricks to read from Kinesis"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Action = [
                    "kinesis:DescribeStream",
                    "kinesis:GetRecords",
                    "kinesis:GetShardIterator",
                    "kinesis:ListStreams",
                    "kinesis:ListShards"
                ]
                Resource = [
                    aws_kinesis_stream.telematics_stream.arn
                ]
            }
        ]
    })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "attach_kinesis_policy" {
    role       = aws_iam_role.databricks_kinesis_role.name
    policy_arn = aws_iam_policy.databricks_kinesis_read_policy.arn
}