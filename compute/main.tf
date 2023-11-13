data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_role" {
  name               = "lambda_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda.zip"
  function_name = "checkov_lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.lambda_handler"
  memory_size   = 2048 # 3072 x - <= 2048
  
  runtime = "nodejs14.x"
}