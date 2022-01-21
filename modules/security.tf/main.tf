resource "aws_security_group" "SecurityGroup_EC2inPublicSubnet" {
  name  =   "SecurityGroup"
  vpc_id    =   var.vpc_id

  dynamic "ingress" {
      for_each = var.port_SG
      content {
          from_port = ingress.value
          to_port   = ingress.value
          protocol  = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
      }
  }

  egress {
      from_port =   0
      to_port   =   0
      protocol  =   "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
      Name = "${var.environment}-EC2inPublicSubnet-SG"
  }
}