terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
assume_role {
role_arn = "arn:aws:iam::268003200000:role/terraform"

}
}
variable "mynewkey" {
  type    = string
  default = "mynewkeysetser"
}
resource "aws_security_group" "demo-sg" {
  name = "sec-grp"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
