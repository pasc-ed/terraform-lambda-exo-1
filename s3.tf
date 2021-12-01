resource "aws_s3_bucket" "my_pet_bucket" {
  bucket = var.pet_bucket_name

  versioning {
    enabled = true
  }

  tags = {
    Name        = var.pet_bucket_name
    Environment = "Test"
  }
}