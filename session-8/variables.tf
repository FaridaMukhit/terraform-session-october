variable "env" {
  type        = string
  description = "this is a variable for Environment"
  default     = "dev"
}

variable "instance_type" {
  type        = string
  description = "this is a variable for instance type"
  default     = "t2.micro"
}

variable "main_vpc_cidr" {
  type        = string
  description = "This is a variable for the Main Vpc Cidr Block"
  default     = "10.0.0.0/16"
}

variable "public_subnet1_cidr" {
  type        = string
  description = "This is a variable for the Public Subnet-1 Cidr Block"
  default     = "10.0.1.0/24"
}

variable "public_subnet2_cidr" {
  type        = string
  description = "This is a variable for the Public Subnet-2 Cidr Block"
  default     = "10.0.2.0/24"
}

variable "public_subnet3_cidr" {
  type        = string
  description = "This is a variable for the Public Subnet-3 Cidr Block"
  default     = "10.0.3.0/24"
}

variable "private_subnet1_cidr" {
  type        = string
  description = "This is a variable for the Private Subnet-1 Cidr Block"
  default     = "10.0.11.0/24"
}

variable "private_subnet2_cidr" {
  type        = string
  description = "This is a variable for the Private Subnet-2 Cidr Block"
  default     = "10.0.12.0/24"
}

variable "private_subnet3_cidr" {
  type        = string
  description = "This is a variable for the Private Subnet-3 Cidr Block"
  default     = "10.0.13.0/24"
}
