resource "aws_vpc" "vpc-module-worker" {
  cidr_block = var.vpc_cidr

  tags = {
    name = var.vpc_name
  }
}