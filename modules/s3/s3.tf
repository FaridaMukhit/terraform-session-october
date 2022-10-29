resource "aws_s3_bucket" "main" {
  bucket = "${var.env}-${var.bucket_name}"
  acl = var.bucket_acl
}  