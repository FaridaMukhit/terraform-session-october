module "ec2" {
  source        = "github.com/FaridaMukhit/terraform-session-october//modules/ec2"
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  env           = "dev"
  s3_bucket_name = "test"

}