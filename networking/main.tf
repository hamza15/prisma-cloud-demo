resource "aws_vpc" "prisma_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  # depends_on = [ aws_default_security_group.vpc_sg ]
}

resource "aws_default_security_group" "vpc_sg" {

  vpc_id = aws_vpc.prisma_vpc.id

  ingress {
    protocol  = "-1"
    self      = true
    from_port = 0
    to_port   = 0
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}