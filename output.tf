output "main" {
    description = "ID of the ec2 instance master:"
    value = aws_instance.main.id
}