terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 3.27"
    }
  }

  #Above helps to exact version != donot use version

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = var.profile
  region  = var.region
}

resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "server-${random_pet.my-pet.id}"
  }
}
output "awsinstance_id" {
  value = aws_instance.app_server.id
}

resource "random_pet" "my-pet" {
  prefix = var.prefix
}

