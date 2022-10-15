variable "env" {
    type = string
    description = "this is a variable for Environment"
    default = "dev"
}

variable "instance_type" {
    type = string
    description = "this is a variable for instance type"
    default = "t2.micro"
}

variable "ami" {
    type = string
    description = "this is a variable for ami id"
    default = "ami-026b57f3c383c2eec"
}