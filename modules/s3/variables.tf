variable "bucket_name" {
    type = string
    description = "bucket name has to be unique"
    default = "terraform-test-bucket-farida"
}

variable "bucket_acl" {
    type = string
    description = "This is variable for acl. values can be private or public"
    default = "private"
}

variable "env" {
    type = string
    description = "this is variable for environment"
    default = "dev"
}