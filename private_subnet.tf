resource "aws_subnet" "private_subnet1" {
    vpc_id = "${aws_vpc.terraform_iti_vpc.id}"
    cidr_block  = "10.0.3.0/28"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2b"

    tags = {
        Name = "private_subnet1"
    }
}

resource "aws_subnet" "private_subnet2" {
    vpc_id = "${aws_vpc.terraform_iti_vpc.id}"
    cidr_block  = "10.0.4.0/28"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2c"

    tags = {
        Name = "private_subnet2"
    }
}
