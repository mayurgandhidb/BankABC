terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 3.27"
    }
    google = {
      source  = "hashicorp/google"
      version = "3.64.0"
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
provider "google" {
  credentials = var.credentials

  project = var.project
  region  = "us-central1"
  zone    = var.zone
}

resource "random_pet" "my-pet" {
  prefix = var.prefix
}

resource "google_compute_network" "terraform_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "server-${random_pet.my-pet.id}"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = google_compute_network.terraform_network.name
    access_config {
    }
  }
}
