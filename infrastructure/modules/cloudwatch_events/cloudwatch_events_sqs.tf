resource "aws_cloudwatch_event_rule" "lambda_sqs" {
  name                = "${var.name}-sqs"
  description         = "${replace(var.name, "_", " ")}"
  schedule_expression = "rate(5 minutes)"
  is_enabled          = true
}

resource "aws_cloudwatch_event_target" "lambda_sqs" {
  rule      = "${aws_cloudwatch_event_rule.lambda_sqs.name}"
  target_id = "${var.name}"
  arn       = "${var.lambda_arn_sqs}"
}

resource "aws_lambda_permission" "lambda_sqs" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_cloudwatch_event_target.lambda_sqs.arn}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.lambda_sqs.arn}"
}
