  terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  
  region = "us-east-1"
}

resource "aws_iam_group" "special" {
  name = "special"

}

resource "aws_iam_user" "lb" {
  name = "Chloe"
}

resource "aws_lightsail_instance" "custom" {
availability_zone = "us-east-1a"
blueprint_id = "ubuntu_18_04"
bundle_id = "medium_1_0"
name = "dev-server"
user_data = " sudo apt-get update && sudo apt-get install -y apache2 && sudo systemctl start apache2 && sudo systemctl enable apache2 && echo '<h1>This is deployed by Marius</h1>' | sudo tee /var/www/html/index.html"
  
}

output "instance1_ip" {
  value = aws_lightsail_instance.custom.private_ip_address
}

output "instance_ip" {
  value = aws_lightsail_instance.custom.public_ip_address
}

output "my-arn" {
  value = aws_lightsail_instance.custom.arn
} 