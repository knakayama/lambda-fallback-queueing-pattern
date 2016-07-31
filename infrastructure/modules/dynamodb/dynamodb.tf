resource "aws_dynamodb_table" "dynamodb" {
  name           = "${var.name}"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "Id"

  #range_key      = "GameTitle"

  attribute {
    name = "Id"
    type = "S"
  }
}
