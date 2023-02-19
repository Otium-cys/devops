resource "aws_s3_bucket" "test-s3-tf-state" {

  bucket = "<AWS S3 Bucket Name>"

  tags = {
    "Name" = "<AWS S3 Bucket Name>"
  }
  
}

resource "aws_dynamodb_table" "<AWS DynamoDB Table Name>" {

  depends_on   = [aws_s3_bucket.test-s3-tf-state]
  name         = "<AWS DynamoDB Table Name>"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "<AWS DynamoDB Table Name>"
  }

}