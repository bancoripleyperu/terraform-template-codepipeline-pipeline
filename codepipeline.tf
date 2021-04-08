module "codepipeline-pipeline" {
  source  = "bancoripleyperu/codepipeline-pipeline/aws"
  version = "0.0.2"

  name                    = var.template_name == null ? random_string.this.result : var.template_name
  role_arn                = module.iam-role.values.arn
  build_project_name      = module.codebuild-project.values.id
  tags                    = var.tags

  source_owner            = var.source_owner
  source_provider         = var.source_provider
  source_version          = var.source_version

  artifact_store_location = module.s3-bucket.values.id

  source_connection       = var.source_connection
  source_repository       = var.source_repository
  source_branch           = var.source_branch

  source_s3bucket         = var.source_s3bucket
  source_s3objectkey      = var.source_s3objectkey
}