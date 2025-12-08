resource "aws_kinesis_stream" "telematics_stream" {
    name             = "telematics-stream-tmh"
    shard_count      = 1

    retention_period = 2
    
    stream_mode_details {
        stream_mode = "ON_DEMAND"
    }

    tags = {
        Environment = "dev"
    }
}