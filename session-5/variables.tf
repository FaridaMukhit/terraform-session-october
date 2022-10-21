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

variable "ami" {
  type        = string
  description = "this is a variable for ami id"
  default     = "ami-026b57f3c383c2eec"
}
variable "ingress_ports" {
  type        = list(string)
  description = "this is a list of ports for ingress rule"
  default     = [ "22", "80", "443", "3306", "53", "5432", "2049"]
}

variable "ingress_ciders" {
  type        = list(string)
  description = "this is a list of CIDRs for ingress ports"
  default     = [ "8.0.0.0/8", "10.0.0.0/16", "0.0.0.0/0", "192.168.1.0/24", "0.0.0.0/0", "192.168.1.0/24", "8.0.0.0/8"]
}