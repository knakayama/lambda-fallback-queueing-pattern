resource "aws_cloudwatch_event_rule" "lambda_dynamodb" {
  name                = "${var.name}-dynamodb"
  description         = "${replace(var.name, "_", " ")}"
  schedule_expression = "rate(1 minute)"
  is_enabled          = true
}

resource "aws_cloudwatch_event_target" "lambda_dynamodb" {
  rule      = "${aws_cloudwatch_event_rule.lambda_dynamodb.name}"
  target_id = "${var.name}"
  arn       = "${var.lambda_arn_dynamodb}"
}

resource "aws_lambda_permission" "lambda_dynamodb" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_cloudwatch_event_target.lambda_dynamodb.arn}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.lambda_dynamodb.arn}"
}
