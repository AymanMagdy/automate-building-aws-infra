resource "aws_instance" "private_subnet_instances_az1" {
  ami           = "${var.aws_ami_type}"
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.aws_ec2_public_key_pair.id}"
  subnet_id     = "${aws_subnet.private_subnet1.id}"

  tags = {
      Name = "GOCD instance"
  }
}

resource "aws_instance" "private_subnet_instances_az2" {
  ami           = "${var.aws_ami_type}"
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.aws_ec2_public_key_pair.id}"
  subnet_id     = "${aws_subnet.private_subnet2.id}"

  tags = {
      Name = "Nexus instance"
  }
}