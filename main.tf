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