resource "aws_instance" "main" {
  ami = var.image_id["ubuntu"]
  instance_type = var.instance_type["master"]
  key_name = var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_gps]
  tags = {
    Name = "main"
  }
  user_data = file("user_data.sh")
}