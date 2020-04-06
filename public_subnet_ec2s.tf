resource "aws_instance" "public_subnet_bastian_instance_az1" {
  ami             = "${var.aws_ami_type}"
  instance_type   = "${var.instance_type}"
  key_name        = "${aws_key_pair.aws_terraform_key_pair.id}"
  subnet_id       = "${aws_subnet.public_subnet1.id}"
  security_groups = ["${aws_security_group.allow_SSH_NGINX_bastian.id}"]

  tags = {
    Name = "bastian instnace"
  }
}

resource "aws_instance" "public_subnet_nginx_instance1_az2" {
  ami             = "${var.aws_ami_type}"
  instance_type   = "${var.instance_type}"
  key_name        = "${aws_key_pair.aws_terraform_key_pair.id}"
  subnet_id       = "${aws_subnet.public_subnet2.id}"
  security_groups = ["${aws_security_group.allow_SSH_Nginx_internal_inbounds.id}"]

  tags = {
    Name = "nginx instance 1"
  }
}

resource "aws_instance" "public_subnet_nginx_instance2_az2" {
  ami             = "${var.aws_ami_type}"
  instance_type   = "${var.instance_type}"
  key_name        = "${aws_key_pair.aws_terraform_key_pair.id}"
  subnet_id       = "${aws_subnet.public_subnet2.id}"
  security_groups = ["${aws_security_group.allow_SSH_Nginx_internal_inbounds.id}"]

  tags = {
    Name = "nginx instance 2"
  }
}
