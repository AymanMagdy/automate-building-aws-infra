resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.terraform_iti_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = "${aws_internet_gateway.first_igw.id}"
  }

  tags = {
    Name = "public_route_table"
  }
}
