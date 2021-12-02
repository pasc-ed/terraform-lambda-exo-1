# LAMBDA RESOURCE FOR MY PET PYTHON SCRIPT
resource "aws_lambda_function" "pet_lambda" {
  filename      = data.archive_file.pet_script.output_path
  function_name = var.pet_script_filename
  role          = aws_iam_role.lambda_role.arn
  handler       = "${var.pet_script_filename}.pet_info"

  source_code_hash = data.archive_file.pet_script.output_base64sha256

  runtime = "python3.8"
}