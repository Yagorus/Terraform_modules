output "public_subnet_CIDR" {
  value = var.public_subnet_CIDR
}
#17:22 18.01.2022
output "subnet_id" {
  value = aws_subnet.public[0].id
}