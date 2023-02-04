resource "aws_elasticache_cluster" "redis_simple" {
  description         = "${var.product}-redis-${var.service}- use apicips"
  cluster_id           = "${var.product}-redis-${var.service}"
  engine               = "redis"
  node_type            = "cache.t4g.small"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  engine_version       = "7.0"
  port                 = 6379
  az_mode              = "single-az"
  snapshot_retention_limit = 1
  subnet_group_name    = aws_elasticache_subnet_group.subnet-g-ec.name
  #security_group_ids = [aws_elasticache_security_group.security-redis-g.id]
  security_group_ids = [aws_security_group.sg-redis.id]
}
resource "aws_elasticache_subnet_group" "subnet-g-ec" {
  name       = "${var.product}-redis-${var.service}-gs"
  subnet_ids = toset(data.aws_subnets.private.ids)
}

#resource "aws_elasticache_security_group" "security-redis-g" {
#  name                 = "${var.product}-${var.environment_prefix}-ec-sg"
#  security_group_names = [aws_security_group.sg-redis.name]
#}

resource "aws_security_group" "sg-redis" {
  name        = "${var.product}-${var.environment_prefix}-redis-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpcid

  ingress {
    description = "${var.product}-${var.environment_prefix}-ips"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
    #security_groups = ["${module.alb.security_group_id}"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow egress traffic"
  }

}