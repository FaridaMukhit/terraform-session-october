module "s3" {
######### path to child module ########
    source = "../../modules/s3" 
######## variables #########  
    env = "dev"
    bucket_name = "terraform-test-bucket-farida"
    bucket_acl = "private"
}

module "ec2" {
    source = "../../modules/ec2"
    env = "dev"
    instance_type = "t2.micro"
    ami = "ami-026b57f3c383c2eec"
########### referemce to child module output = module.module_name.output_name ###############
    s3_bucket_name = module.s3.s3_bucket_name   
}