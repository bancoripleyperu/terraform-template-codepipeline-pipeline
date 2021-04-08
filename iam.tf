module "iam-role" {
  source  = "bancoripleyperu/iam-role/aws"
  version = "0.0.3"

  name         = var.template_name == null ? random_string.this.result : var.template_name
  aws_services = ["codepipeline.amazonaws.com", "codebuild.amazonaws.com"]
  tags         = var.tags
}

resource "aws_iam_policy" "this" {
  name = var.template_name == null ? random_string.this.result : var.template_name
  path = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow",
        Action = [
          "s3:*"
        ],
        Resource = ["arn:aws:s3:::${module.s3-bucket.values.id}/*"]
      },
      {
        Effect   = "Allow",
        Action = [
          "s3:ListBucket"
        ],
        Resource = ["arn:aws:s3:::${module.s3-bucket.values.id}"]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = module.iam-role.values.name
  policy_arn = aws_iam_policy.this.arn
}