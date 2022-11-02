module "ec2" {
  source        = "github.com/FaridaMukhit/terraform-session-october//modules/ec2?ref=v1.0.0"
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  env           = "dev"
  s3_bucket_name = "test"
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"
}