# resource "<provicder>_<type>" "<name>" {
#  [config . .]
# } 
# <name>은 테라폼 코드에서 리소스를 참조하기 위해 사용할수 있는 식별자
resource "aws_s3_bucket" "test-s3-tf-state" {

  bucket = "test-s3-tf-state-cys" 

  tags = {
    "Name" = "test-s3-tf-state-cys"
  }
  
}

resource "aws_dynamodb_table" "test-ddb-lock-table" {

  depends_on   = [aws_s3_bucket.test-s3-tf-state]
  name         = "test-ddb-lock-table-cys"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S" #대문자s는 스트링형태의 타입
  }

  tags = {
    "Name" = "test-ddb-lock-table-cys"
  }

}