resource "aws_security_group" "allow_SSH_NGINX_bastian" {
  name        = "allow_SSH_NGINX"
  description = "Allow SSH and NGINX inbound traffic"
  vpc_id      = "${aws_vpc.terraform_iti_vpc.id}"

# inbount connections for SSH.
  ingress {
    description = "Allow SSH to VPC."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# inbount connections for Nginx.
  ingress {
    description = "Allow Nginx to VPC."
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# outbound connections.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow ssh and NGINX"
  }
}