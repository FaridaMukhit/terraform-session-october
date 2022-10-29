resource "aws_instance" "main" {
  ami           = var.ami  
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.web.id ]
  tags = {
    Name        = var.env
  }
} 
// reference to resource:
// first_label.ssecond_label.attribute
// reference to input variable
// var.variable.name
// reference to data source
// data.first_label.ssecond_label.attribute
// data types:
// 1. string = always uses double quotations
// 2. number = never uses double quotationos
// 3. boolean = never uses double quotationos

// reference is dynamic 
// dynamic things do not use double quotations 

// reference to input variabl = var.variable_name
