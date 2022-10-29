variable "ami" {
    type = string
    description = "amazon image machine"
    default = "ami-026b57f3c383c2eec"
}

variable "instance_type" {
    type = string
    description = "size of ec2"
    default = "t2.micro"
}

variable "env" {
    type = string
    description = "this is variable for environment"
    default = "dev"
}

variable "s3_bucket_name" {
    type = string
    description = "this is variable for s3 bucket name for app to upload images"
    default = "test"
}
