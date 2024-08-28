#-----custom network creation------#
#-----create VPC
resource "aws_vpc" "cust" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "cust-vpc"
  }

}

#---create internet gateway and attach to vpc
resource "aws_internet_gateway" "cust" {
  vpc_id = aws_vpc.cust.id
  tags = {
    Name = "cust-ig"
  }

}

#----create subnet
resource "aws_subnet" "cust" {
  vpc_id            = aws_vpc.cust.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "Pub-subnet"
  }


}

resource "aws_subnet" "cust2" {
  vpc_id            = aws_vpc.cust.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "Pvt-subnet"
  }


}

#----create RT and attach to I.G
resource "aws_route_table" "cust" {
  vpc_id = aws_vpc.cust.id
  route {
    gateway_id = aws_internet_gateway.cust.id
    cidr_block = "0.0.0.0/0"
  }

}

#---subnet associate
resource "aws_route_table_association" "cust" {
  route_table_id = aws_route_table.cust.id
  subnet_id      = aws_subnet.cust.id

}
#----create S.G

resource "aws_security_group" "allow_tls" {
  name   = "allow_tls"
  vpc_id = aws_vpc.cust.id
  tags = {
    Name = "dev_sg"
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


}

 