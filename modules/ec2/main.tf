data "aws_ami" "latest_amazon_linux"{
    owners  =   ["amazon"]
    most_recent = true
        filter {
            name = "name"
            values   =  ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]    
        }
}

resource "aws_instance" "AmazonLinux" {
  count =   length(var.public_subnet_CIDR)
  ami   =   data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_SG_ids.*.id

  user_data = file("./modules/ec2/user_data.sh")
  tags = {
    Name = "EC2_linux"
  }
}