resource "aws_vpc" "lf_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags {
    Name = "Main VPC for Project"
  }
}


resource "aws_subnet" "public_subnet_1" {
  vpc_id = "${aws_vpc.lf_vpc.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-2a"
  tags {
      Name = "Public Subnet"
      Range = "10.0.1.0/24"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = "${aws_vpc.lf_vpc.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-2b"
  tags {
      Name = "Public Subnet"
      Range = "10.0.10.0/24"
  }
}
resource "aws_subnet" "private_subnet_1" {
  vpc_id = "${aws_vpc.lf_vpc.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-2a"
  tags {
      Name = "private subnet"
      Range = "10.0.2.0/24"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id = "${aws_vpc.lf_vpc.id}"
  cidr_block = "10.0.20.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-2b"
  tags {
      Name = "private subnet"
      Range = "10.0.2.0/24"
  }
}




resource "aws_internet_gateway" "gateway" {
    vpc_id = "${aws_vpc.lf_vpc.id}"
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.lf_vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gateway.id}"
}
