resource "aws_security_group" "allow_SSH_GOCD_internal_inbounds" {
  name        = "allow_internal_SSH_GOCD"
  description = "Allow SSH and SSH_GOCD_internal inbounds"
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
    description = "Allow GOCD to internal."
    from_port   = 8153
    to_port     = 8153
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

resource "aws_security_group" "allow_SSH_Nexus_internal_inbounds" {
  name        = "allow_internal_SSH_Nexus"
  description = "Allow SSH and SSH_Nexus_internal inbounds"
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
    description = "Allow Nexus to internal."
    from_port   = 8081
    to_port     = 8081
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