# variables.tf     --> Definition of varibles file
# terraform.tfvars --> Attribution of values to the variables
variable "lambda_role_name" {
  description = "Name of the role for my lambda function"
  default     = "lambda_petfood_assume_role" # Default value if it has not been attributed in the terraform.tfvars file
}

variable "pet_bucket_name" {
  description = "Name of the bucket to store my pets info"
  type        = string # Optional to define variable type as a string
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "pet_script_filename" {
  description = "The file name of my pet script"
}