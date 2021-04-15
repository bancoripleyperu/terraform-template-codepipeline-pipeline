## Usage

```hcl
module "codepipeline-pipeline" {
  source  = "bancoripleyperu/codepipeline-pipeline/template"
  version = "0.0.1"

  template_name      = "myPipeline"
  source_buildspec   = file("buildspec.yml")
  source_provider    = "S3"
  source_s3bucket    = module.s3-bucket.values.id
  source_s3objectkey = "build"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.19 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.19 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_codebuild-project"></a> [codebuild-project](#module\_codebuild-project) | bancoripleyperu/codebuild-project/aws | 0.0.6 |
| <a name="module_codepipeline-pipeline"></a> [codepipeline-pipeline](#module\_codepipeline-pipeline) | bancoripleyperu/codepipeline-pipeline/aws | 0.0.3 |
| <a name="module_iam-role"></a> [iam-role](#module\_iam-role) | bancoripleyperu/iam-role/aws | 0.0.4 |
| <a name="module_s3-bucket"></a> [s3-bucket](#module\_s3-bucket) | bancoripleyperu/s3-bucket/aws | 0.0.5 |
| <a name="module_vpc-securitygroup"></a> [vpc-securitygroup](#module\_vpc-securitygroup) | bancoripleyperu/vpc-securitygroup/aws | 0.0.3 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_compute_type"></a> [environment\_compute\_type](#input\_environment\_compute\_type) | (Optional) The environment compute type of the codebuild project | `string` | `"BUILD_GENERAL1_SMALL"` | no |
| <a name="input_environment_image"></a> [environment\_image](#input\_environment\_image) | (Optional) The environment image of the codebuild project | `string` | `"aws/codebuild/amazonlinux2-x86_64-standard:3.0"` | no |
| <a name="input_environment_type"></a> [environment\_type](#input\_environment\_type) | (Optional) The environment type of the codebuild project | `string` | `"LINUX_CONTAINER"` | no |
| <a name="input_environment_variable"></a> [environment\_variable](#input\_environment\_variable) | (Optional) Environment variable | `map(string)` | `{}` | no |
| <a name="input_privileged_mode"></a> [privileged\_mode](#input\_privileged\_mode) | (Optional) The privileged mode of the codebuild project | `string` | `false` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | (Optional) The security group ids of the codebuild project | `list(string)` | `null` | no |
| <a name="input_source_branch"></a> [source\_branch](#input\_source\_branch) | (Optional) The name of the branch | `string` | `null` | no |
| <a name="input_source_buildspec"></a> [source\_buildspec](#input\_source\_buildspec) | The buildspec of the codebuild project | `string` | n/a | yes |
| <a name="input_source_connection"></a> [source\_connection](#input\_source\_connection) | (Optional) The arn of the connection | `string` | `null` | no |
| <a name="input_source_owner"></a> [source\_owner](#input\_source\_owner) | (Optional) The owner of the source | `string` | `"AWS"` | no |
| <a name="input_source_provider"></a> [source\_provider](#input\_source\_provider) | (Optional) The provider of the source | `string` | `"CodeStarSourceConnection"` | no |
| <a name="input_source_repository"></a> [source\_repository](#input\_source\_repository) | (Optional) The name of the repository | `string` | `null` | no |
| <a name="input_source_s3bucket"></a> [source\_s3bucket](#input\_source\_s3bucket) | (Optional) The s3 bucket of the source | `string` | `null` | no |
| <a name="input_source_s3objectkey"></a> [source\_s3objectkey](#input\_source\_s3objectkey) | (Optional) The s3 object key of the source | `string` | `null` | no |
| <a name="input_source_version"></a> [source\_version](#input\_source\_version) | (Optional) The version of the source | `string` | `"1"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | (Optional) The subnets id of the codebuild project | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the role. | `map(string)` | `{}` | no |
| <a name="input_template_name"></a> [template\_name](#input\_template\_name) | CodePipeline template name | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (Optional) The vpc id of the codebuild project | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | S3 bucket values |
| <a name="output_codebuild"></a> [codebuild](#output\_codebuild) | Codebuild project values |
| <a name="output_codepipeline"></a> [codepipeline](#output\_codepipeline) | Codepipeline values |
| <a name="output_role"></a> [role](#output\_role) | IAM role values |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Test

```sh
gem install bundler
bundle install --jobs 4 --retry 3
bundle exec kitchen test
```

## Doc

```sh
pre-commit run -a
```

## Autor
 
Module managed by [Banco Ripley Peru](https://ripley.com.pe)