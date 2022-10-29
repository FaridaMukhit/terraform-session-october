resource "aws_instance" "main" {
    ami = var.ami
    instance_type = var.instance_type
    tags = {
        Name = "${var.env}-instance"
        S3_Bucket_Name = var.s3_bucket_name
    }
}