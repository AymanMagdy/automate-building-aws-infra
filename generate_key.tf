# Generate the key.
resource "tls_private_key" "aws_terraform_key" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

resource "local_file" "ec2-private-key" {
  content  = "${tls_private_key.aws_terraform_key.private_key_pem}"
  filename = "${path.module}/ec2.pem"
}

# Create a new secrete manager.
resource "aws_secretsmanager_secret" "aws_infra_terraform_automate" {
  name                    = "aws_infra_terraform_automate"
  recovery_window_in_days = 0
}

resource "aws_key_pair" "aws_terraform_key_pair_automate" {
  key_name   = "aws_terraform_key_pair_automate2"
  public_key = "${tls_private_key.aws_terraform_key.public_key_openssh}"
}

resource "aws_secretsmanager_secret_version" "aws_ec2_private_key" {
  secret_id     = "${aws_secretsmanager_secret.aws_infra_terraform_automate.id}"
  secret_string = "${tls_private_key.aws_terraform_key.private_key_pem}"
}
