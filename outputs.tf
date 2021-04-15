output "bucket" {
  description = "S3 bucket values"
  value       = module.s3-bucket.values
}

output "role" {
  description = "IAM role values"
  value       = module.iam-role.values
}

output "codebuild" {
  description = "Codebuild project values"
  value       = module.codebuild-project.values
}

output "codepipeline" {
  description = "Codepipeline values"
  value       = module.codepipeline-pipeline.values
}