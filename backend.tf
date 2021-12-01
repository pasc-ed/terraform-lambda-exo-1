# S3 bucket to store your Terraform tfstates
terraform {
  backend "s3" {
    bucket = "talent-academy-439272626435-tfstates-pascal"
    key    = "terraform-test/terraform.tfstates" # KEY must be unique for each PROJECT
  }
}

# ACCOUNT A
# BUCKET_1_TFSTATES
# - project1/tfstates
# - project2/tfstates
# - ...