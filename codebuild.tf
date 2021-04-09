module "codebuild-project" {
  source  = "bancoripleyperu/codebuild-project/aws"
  version = "0.0.5"

  name             = var.template_name == null ? random_string.this.result : var.template_name
  source_type      = "CODEPIPELINE"
  source_buildspec = var.source_buildspec
  service_role     = module.iam-role.values.arn
  artifacts_type   = "CODEPIPELINE"
  privileged_mode  = var.privileged_mode
  tags             = var.tags

  environment_type         = var.environment_type
  environment_compute_type = var.environment_compute_type
  environment_image        = var.environment_image
  environment_variable     = var.environment_variable

  vpc_id             = var.vpc_id
  subnets            = var.subnets
  security_group_ids = var.vpc_id == null ? null : module.vpc-securitygroup.values.*.id[0]
}