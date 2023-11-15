#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function.html

# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["lambda.amazonaws.com"]
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  # assume_role_policy = data.aws_iam_policy_document.assume_role.json
  assume_role_policy = file("lambda/policy.json")

  inline_policy {
    policy = file("lambda/policy.json")
  }
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda/lambda.py"
  output_path = "lambda_function_payload.zip"
}



resource "aws_lambda_layer_version" "python_layer" {
  layer_name = "layer"
  description = "My Python Lambda Layer"

  compatible_runtimes = ["python3.10"]  # Specify the runtime(s) your layer supports

  s3_bucket = "kuyesura-s3"

  s3_key = "layer.zip"


  # Path to the directory containing your Python dependencies
  # source_code_hash = filebase64sha256("my_lambda_function/boto_lib.zip")

  # Configuration for the AWS Lambda Layer
  # filename = "my_lambda_function/boto_lib.zip"  # Specify the correct path to your ZIP file
}

resource "aws_lambda_function" "ETL_lambda" {

  layers = [aws_lambda_layer_version.python_layer.arn]

  filename      = "lambda_function_payload.zip"

  function_name = "ETL_Lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler = "lambda.hello_lambda"

  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime = "python3.10"

  environment {
    variables = {
      foo = "bar"
    }
  }
}