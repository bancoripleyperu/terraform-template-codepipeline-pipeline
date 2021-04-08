module "s3-bucket" {
  source  = "bancoripleyperu/s3-bucket/aws"
  version = "0.0.4"

  bucket        = var.template_name == null ? random_string.this.result : var.template_name
  force_destroy = true
  tags          = var.tags
}