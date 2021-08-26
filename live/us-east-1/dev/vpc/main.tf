  
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "private-subnets" {
  count             = length(var.private_subnets_config)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_config[count.index].cidr_block
  availability_zone = var.private_subnets_config[count.index].az

  tags = merge(var.default_tags, {
    Name = "${var.project_name}-private-${var.private_subnets_config[count.index].az}"
  })
}