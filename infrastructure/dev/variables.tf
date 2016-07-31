variable "aws_region" {}

variable "apex_function_sqs" {}

variable "apex_function_dynamodb" {}

variable "name" {
  default = "lambda_fallback_queueing_pattern"
}
