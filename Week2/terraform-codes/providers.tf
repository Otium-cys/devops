terraform {
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }

  backend "s3" {
    bucket = "test-s3-tf-state-cys"
    key = "terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "test-ddb-lock-table-cys" #락정보?
    encrypt = "true"
  }
}

provider "aws" {
  region = var.aws_region
}