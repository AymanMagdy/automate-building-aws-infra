resource "aws_security_group" "allow_SSH_Nginx_internal_inbounds" {
  name        = "allow_internal_SSH_NGINX"
  description = "Allow SSH and SSH_NGINXinternal inbounds"
  vpc_id      = "${aws_vpc.terraform_iti_vpc.id}"

  # inbount connections for SSH.
  ingress {
    description = "Allow SSH to internal."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # inbount connections for Nginx.
  ingress {
    description = "Allow Nginx to internal."
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # outbound connections.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow ssh and NGINX internal inbounds"
  }
}