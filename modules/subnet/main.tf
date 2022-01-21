data "aws_availability_zones" "AZ" {  }

resource "aws_subnet" "public" {
    #  public_subnet_CIDR  = ["10.0.1.0/24"]
  count             =   length(var.public_subnet_CIDR)
  cidr_block        =   tolist(var.public_subnet_CIDR)[count.index]
  vpc_id            =   var.vpc_id
  # to make EC2 get public ip to use 
  map_public_ip_on_launch = true
  # public_subnet_CIDR  = ["10.0.1.0/24"] | count.index = 0
  availability_zone = data.aws_availability_zones.AZ.names[count.index]

  tags = {
      Name      =   "${var.environment}-PublicSubnet-${count.index + 1}"
      AZ        =   data.aws_availability_zones.AZ.names[count.index]
      Environment = "${var.environment}-PublicSubnet"
  }
}

resource "aws_internet_gateway" "InternetGateway" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.environment}-InternetGateway"
  }
}

resource "aws_route_table" "PublicRT" {
  vpc_id = var.vpc_id

  route  {
    cidr_block  = "0.0.0.0/16"
    gateway_id   = aws_internet_gateway.InternetGateway.id
  }

  tags = {
    Name = "${var.environment}-PublicRT"
  }

  depends_on = [aws_internet_gateway.InternetGateway]
}
resource "aws_route_table_association" "routeTableAssociationPublicRoute" {
  count = length(var.public_subnet_CIDR)
  route_table_id = aws_route_table.PublicRT.id
  
  subnet_id      = aws_subnet.public[0].id
  #element(aws_subnet.public.*.id, count.index)
}

