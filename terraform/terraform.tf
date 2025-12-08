terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    profile = "default"
    region = "us-east-1"
}

module "data_ingestion_streaming" {
    source = "./streaming"
}

module "data_ingestion_database" {
    source = "./database"
}

module "data_ingestion_object" {
    source = "./object"
}