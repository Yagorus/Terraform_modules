output "vpc_id" {
  value = aws_vpc.my_vpc
}
output "CIDR_block_VPC" {
  value = aws_vpc.my_vpc.cidr_block
}
output "environment" {
  value = var.environment
}