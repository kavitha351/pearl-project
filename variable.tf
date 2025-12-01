# Please use your default or the custom values for the variables below.

variable "image_id" {
    type = map(string)
    description = "Map of AMI ids for different situations."
    default = {
        "ubuntu"= "{ubuntu-img-id}",
        "amazon-linux" = "{amazon-linux-img-id}" # optional
    } 
}
variable "instance_type" {
    type = map(string)
    description = "Map of instance type for master and slaves."
    default = {
        "master" = "t2.small",
        "slaves" = "t2.micro"
        "medium"= "t2.medium"
    }
}
variable "key_name" {
    type = string
    description = "this is the key name"
    default = "{insert-key-name}"
    sensitive = true
}
variable "subnet_id" {
    type = string
    description = "This is the subnet id"
    default = "{subnet-id}"
}
variable "security_gps" {
    type = string
    description = "This is the security group id"
    default = "{secutity-group-id}"
}