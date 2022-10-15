resource "aws_instance" "first_ec2" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  tags = {
    Name        = "first"
    Environment = "dev"
  }
} 

// resource = block 
// aws_instance = first label = resource type = predefined by terraform
// first_ec2 = second lable = logical name or ID (name for the resource) = defined by author 
// argument = consists of key/value, name/value = configurations and components of your resource
// - key = predefined by terraform
// - value = defined by author

# Each  terraform file has an extension called ".tf"

# terraform has 2 types of blocks
// 1. resourse    = create and manage resources, services, infrastructures
// 2. data source = 

// each block expect 2 labels, resource expects 2 labels 