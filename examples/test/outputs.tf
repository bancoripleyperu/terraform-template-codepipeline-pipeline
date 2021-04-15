output "bucket" {
  description = "Name required for tests"
  value       = module.this.bucket.id
}

output "role" {
  description = "Name required for tests"
  value       = module.this.role.id
}

output "codebuild" {
  description = "Name required for tests"
  value       = module.this.codebuild.name
}