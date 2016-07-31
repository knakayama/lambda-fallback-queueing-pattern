module "iam" {
  source = "../modules/iam"

  name = "${var.name}"
}

module "sqs" {
  source = "../modules/sqs"

  name = "${var.name}"
}

module "dynamodb" {
  source = "../modules/dynamodb"

  name = "${var.name}"
}

module "cloudwatch_events" {
  source = "../modules/cloudwatch_events"

  name                = "${var.name}"
  lambda_arn_sqs      = "${var.apex_function_sqs}"
  lambda_arn_dynamodb = "${var.apex_function_dynamodb}"
}
