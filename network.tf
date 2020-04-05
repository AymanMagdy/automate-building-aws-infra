resource "aws_internet_gateway" "first_igw" {
    vpc_id = "${aws_vpc.terraform_iti_vpc.id}"
    tags = {
    Name = "first_igw"
  }
}