provider "aws" {
    region      = "${var.AWS_REGION}"
    access_key  = "${var.access_key}"
    secrete_key = "${var.secret_access_key}"
}
