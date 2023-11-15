resource "aws_vpc" "acer" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Acer Vpc"
  }
}

resource "aws_subnet" "acer_subnet_public" {

  vpc_id     = aws_vpc.acer.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public subnet"
  }
  
}

# resource "aws_internet_gateway" "acer_gw" {
#     vpc_id = aws_vpc.acer

# }