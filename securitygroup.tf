module "vpc-securitygroup" {
  source  = "bancoripleyperu/vpc-securitygroup/aws"
  version = "0.0.2"
  count   = var.vpc_id == null ? 0 : 1

  name   = var.template_name == null ? random_string.this.result : var.template_name
  vpc_id = var.vpc_id
  tags   = var.tags
}

resource "aws_security_group_rule" "this" {
  count = var.vpc_id == null ? 0 : 1

  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = var.vpc_id == null ? null : module.vpc-securitygroup[0].values.id
}