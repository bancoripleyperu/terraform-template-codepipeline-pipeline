module "this" {
  source = "../../"

  template_name      = random_string.this.result
  source_buildspec   = file("buildspec.yml")
  source_provider    = "S3"
  source_s3bucket    = module.s3-bucket.values.id
  source_s3objectkey = "build"

  tags = {
    Project = "titan"
  }
}

resource "random_string" "this" {
  length  = 8
  special = false
  upper   = false
}

module "s3-bucket" {
  source  = "bancoripleyperu/s3-bucket/aws"
  version = "0.0.4"

  bucket        = "${random_string.this.result}-source"
  force_destroy = true
  tags = {
    Project = "titan"
  }
}