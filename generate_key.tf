# Generate the key.
resource "tls_private_key" "aws_terraform_key" {
  algorithm   = "RSA"
  rsa_bits = "2048"
}

resource "local_file" "ec2-private-key" {
    content = "${tls_private_key.aws_terraform_key.private_key_pem}"
    filename = "${path.module}/ec2.pem"
} 

# Create a new secrete manager.
resource "aws_secretsmanager_secret" "aws_secrete_manager_key" {
  name = "building_aws_terraform"
}

resource "aws_key_pair" "aws_ec2_public_key_pair" {
  key_name = "aws_ec2_public_key_pair"
  public_key = "${tls_private_key.aws_terraform_key.public_key_openssh}"
}

resource "aws_secretsmanager_secret_version" "aws_ec2_private_key" {
  secret_id     = "${aws_secretsmanager_secret.aws_secrete_manager_key.id}"
  secret_string = "${tls_private_key.aws_terraform_key.private_key_pem}"
}