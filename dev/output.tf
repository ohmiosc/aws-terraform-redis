output "subnets_ids" {
  value = data.aws_subnets.private.ids
}
output "vpc_ips" {
  value = data.aws_vpc.selected.cidr_block
}
