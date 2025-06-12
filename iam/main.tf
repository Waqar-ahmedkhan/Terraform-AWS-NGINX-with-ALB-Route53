resource "aws_iam_role" "ec2_role" {
  name = var.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name        = var.name
    Environment = "Production"
    Terraform   = "true"
  }
}

resource "aws_iam_role_policy" "ec2_policy" {
  name = "${var.name}-policy"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = "s3:*"
        Resource = "arn:aws:s3:::my-terraform-state-waqar/*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.name
  role = aws_iam_role.ec2_role.name
}