variable "cidr" {}

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "private_subnets" {
  value = aws_vpc.vpc.private_subnets
}
