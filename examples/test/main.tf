module "this" {
  source = "../../"

  template_name      = "titan-dev-test"
  source_buildspec   = file("buildspec.yml")
  source_provider    = "S3"
  source_s3bucket    = module.s3-bucket.values.id
  source_s3objectkey = "build"

  tags = {
    Project = "titan"
  }
}

# dependencies
module "s3-bucket" {
  source  = "bancoripleyperu/s3-bucket/aws"
  version = "0.0.4"

  bucket        = "titan-dev-test-source"
  force_destroy = true
  tags = {
    Project = "titan"
  }
}