resource "aws_subnet" "public_subnet1" {
  vpc_id                  = "${aws_vpc.terraform_iti_vpc.id}"
  cidr_block              = "10.0.1.0/28"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2b"

  tags = {
    Name = "public_subnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = "${aws_vpc.terraform_iti_vpc.id}"
  cidr_block              = "10.0.2.0/28"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2c"

  tags = {
    Name = "public_subnet2"
  }
}