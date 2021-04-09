variable "template_name" {
  description = "CodePipeline template name"
  type        = string
  default     = null
}

variable "source_buildspec" {
  description = "The buildspec of the codebuild project"
  type        = string
}

variable "environment_type" {
  description = "(Optional) The environment type of the codebuild project"
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "environment_compute_type" {
  description = "(Optional) The environment compute type of the codebuild project"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "environment_image" {
  description = "(Optional) The environment image of the codebuild project"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
}

variable "privileged_mode" {
  description = "(Optional) The privileged mode of the codebuild project"
  type        = string
  default     = false
}

variable "environment_variable" {
  description = "(Optional) Environment variable"
  type        = map(string)
  default     = {}
}

variable "source_connection" {
  description = "(Optional) The arn of the connection"
  type        = string
  default     = null
}

variable "source_repository" {
  description = "(Optional) The name of the repository"
  type        = string
  default     = null
}

variable "source_branch" {
  description = "(Optional) The name of the branch"
  type        = string
  default     = null
}

variable "source_s3bucket" {
  description = "(Optional) The s3 bucket of the source"
  type        = string
  default     = null
}

variable "source_s3objectkey" {
  description = "(Optional) The s3 object key of the source"
  type        = string
  default     = null
}

variable "source_owner" {
  description = "(Optional) The owner of the source"
  type        = string
  default     = "AWS"
}

variable "source_provider" {
  description = "(Optional) The provider of the source"
  type        = string
  default     = "CodeStarSourceConnection"
}

variable "source_version" {
  description = "(Optional) The version of the source"
  type        = string
  default     = "1"
}

variable "vpc_id" {
  description = "(Optional) The vpc id of the codebuild project"
  type        = string
  default     = null
}

variable "subnets" {
  description = "(Optional) The subnets id of the codebuild project"
  type        = list(string)
  default     = null
}

variable "security_group_ids" {
  description = "(Optional) The security group ids of the codebuild project"
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the role."
  type        = map(string)
  default     = {}
}