variable "vpc_id" { }
variable "environment" { }

variable "port_SG" {
  description = "List of ports"
  type = list(any)
  default = [ "80", "22", "8080" ]
}