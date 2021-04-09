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
        Effect = "Allow",
        Action = [
          "s3:*"
        ],
        Resource = ["arn:aws:s3:::${module.s3-bucket.values.id}/*"]
      },
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket"
        ],
        Resource = ["arn:aws:s3:::${module.s3-bucket.values.id}"]
      },
      {
        Effect = "Allow",
        Action = [
          "codestar-connections:UseConnection"
        ],
        Resource = ["arn:aws:codestar-connections:*:*:connection/*"]
      },
      {
        Effect = "Allow",
        Action = [
          "codebuild:StartBuild",
          "codebuild:BatchGetBuilds"
        ],
        Resource = ["arn:aws:codebuild:*:*:project/${module.s3-bucket.values.id}"]
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:DescribeLogStreams",
          "logs:PutRetentionPolicy",
          "logs:PutLogEvents"
        ],
        Resource = ["arn:aws:logs:*:*:log-group:/aws/codebuild/${module.s3-bucket.values.id}:log-stream:*"]
      },
      {
        Effect = "Allow",
        Action = [
          "ssm:GetParameters"
        ],
        Resource = ["arn:aws:ssm:*:*:parameter/${module.s3-bucket.values.id}"]
      },
      {
        Effect = "Allow",
        Action = [
          "secretsmanager:GetSecretValue"
        ],
        Resource = ["arn:aws:secretsmanager:*:*:secret:*pipeline*"]
      },
      {
        Effect = "Allow",
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeDhcpOptions",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface",
          "ec2:DescribeSubnets",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeVpcs",
          "ecr:GetAuthorizationToken"
        ],
        Resource = ["*"]
      },
      {
        Effect = "Allow",
        Action = [
          "ec2:CreateNetworkInterfacePermission"
        ],
        Resource = ["arn:aws:ec2:*:*:network-interface/*"],
        Condition = {
          StringEquals = {
            "ec2:AuthorizedService" = "codebuild.amazonaws.com"
          }
        }
      },
      {
        Effect = "Allow",
        Action = [
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer"
        ],
        Resource = [
          "arn:aws:ecr:*:*:repository/*sonar*",
          "arn:aws:ecr:*:*:repository/*postman*"
        ]
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = module.iam-role.values.name
  policy_arn = aws_iam_policy.this.arn
}