# RESOURCE FOR MY ROLE
resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "assumerolelambda"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = var.lambda_role_name
  }
}

# POLICY TO ALLOW MY LAMBDA TO ACCESS CLOUDWATCH LOGS
resource "aws_iam_policy" "lambda_cloudwatch_access" {
  name        = "lambda_CW_access"
  path        = "/"
  description = "My Policy to allow my lambda function to put logs into cloudwatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # ELEMENT 1
      {
        "Sid" : "cwlogaccess"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "*" # ALL CLOUDWATCH LogGroup RESOURCES
      },
      # ELEMENT 2
      {
        "Sid" : "s3List",
        "Action" : [
          "s3:List*"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      },
      # ELEMENT 3
      {
        "Sid" : "s3access",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject",
        ],
        "Effect" : "Allow",
        "Resource" : [
          "arn:aws:s3:::${var.pet_bucket_name}", # ALLOW ON THIS BUCKET ONLY
          "arn:aws:s3:::${var.pet_bucket_name}/*"
        ]
      }
    ]
  })
}

# ATTACH POLICY TO THE ROLE
resource "aws_iam_role_policy_attachment" "lambda_role_policy_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_cloudwatch_access.arn
}

# ARN arn:aws:s3:::talent-academy-pascal-petbucket
#    -- name of the resource in AWS with a specific structure
# ID -- generated identifier e.g. i-123ewrewfs, sg-sdfs3434534