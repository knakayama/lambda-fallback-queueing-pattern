output "lambda_function_role_id" {
  value = "${module.iam.lambda_function_role_id}"
}

output "sqs_id" {
  value = "${module.sqs.id}"
}

output "sqs_arn" {
  value = "${module.sqs.arn}"
}

output "dynamodb_id" {
  value = "${module.dynamodb.id}"
}

output "dynamodb_arn" {
  value = "${module.dynamodb.arn}"
}
