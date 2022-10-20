resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "${var.env}-vpc"  
  }
}
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    "Name" = "${var.env}-pub-sub-1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
  tags = {
    "Name" = "${var.env}-pub-sub-2"
  }
}
resource "aws_subnet" "public_subnet3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet3_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1c"
  tags = {
    "Name" = "${var.env}-pub-sub-3"
  }
}
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "${var.env}-priv-sub-1"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "${var.env}-priv-sub-2"
  }
}
resource "aws_subnet" "private_subnet3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet3_cidr
  availability_zone = "us-east-1c"
  tags = {
    "Name" = "${var.env}-priv-sub-3"
  }
}

resource "aws_route_table" "pub_rtb" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-pub-rtb"
  }
}
resource "aws_route_table" "priv_rtb" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-priv-rtb"
  }
}
resource "aws_route" "internet_route" {
  route_table_id         = aws_route_table.pub_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_igw.id
}

#Public Route Table association with Public Subnets
resource "aws_route_table_association" "pub_sub1_rt" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.pub_rtb.id
}
resource "aws_route_table_association" "pub_sub2_rt" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.pub_rtb.id
}
resource "aws_route_table_association" "pub_sub3_rt" {
  subnet_id      = aws_subnet.public_subnet3.id
  route_table_id = aws_route_table.pub_rtb.id
}

#Private Route Table Association with Private Subnets
resource "aws_route_table_association" "priv_sub1_rt" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.priv_rtb.id
}
resource "aws_route_table_association" "priv_sub2_rt" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.priv_rtb.id
}
resource "aws_route_table_association" "priv_sub3_rt" {
  subnet_id      = aws_subnet.private_subnet3.id
  route_table_id = aws_route_table.priv_rtb.id
}

resource "aws_internet_gateway" "dev_igw" { # Provides a resource to create a VPC Internet Gateway.
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-igw"
  }
}

resource "aws_eip" "NatEIP" { # Provides an Elastic IP resource.
  vpc = true
  depends_on = [ aws_internet_gateway.dev_igw ]
}

resource "aws_nat_gateway" "NATgw" { #Provides a resource to create NAT Gateway
   allocation_id = aws_eip.NatEIP.id
   subnet_id = aws_subnet.public_subnet1.id
 }

# Route table for Public Subnet
# Public Subnet traffic reaches Internet via Internet Gateway
 resource "aws_route_table" "PublicRT" {    
    vpc_id =  aws_vpc.main.id
         route {
    cidr_block = "0.0.0.0/0"             
    gateway_id = aws_internet_gateway.dev_igw.id
     }
}

# Route table for Private Subnets
# Private Subnet traffic reaches the Internet via Nat Gateway
 resource "aws_route_table" "PrivateRT" {    
   vpc_id = aws_vpc.main.id
   route {
   cidr_block = "0.0.0.0/0"            
   nat_gateway_id = aws_nat_gateway.NATgw.id
   }
 }
