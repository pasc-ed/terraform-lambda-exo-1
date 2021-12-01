# LAMBDA RESOURCE FOR MY PET PYTHON SCRIPT
resource "aws_lambda_function" "pet_lambda" {
  filename      = data.archive_file.pet_script.output_path
  function_name = var.pet_script_filename
  role          = aws_iam_role.lambda_role.arn
  handler       = "${var.pet_script_filename}.pet_info"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("./files/lambda_function_payload.zip"))}"
  source_code_hash = data.archive_file.pet_script.output_base64sha256

  runtime = "python3.8"
}