data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpcid]
  }

  tags = {
    Tier = "private"
  }
}

data "aws_vpc" "selected" {
  id = var.vpcid
}