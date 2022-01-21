variable "public_subnet_CIDR" { }
variable "vpc_SG_ids" { }
variable "subnet_id" { }

variable "instance_type" {
    type = string
    default = "t2.micro"
}