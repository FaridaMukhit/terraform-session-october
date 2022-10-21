resource "aws_security_group" "web" {
  name        = "web-instance-sg-new"
  description = "this is a security group for web instance"
  vpc_id      = "vpc-0e176f3417bb9549e"
}

resource "aws_security_group_rule" "web_ingress" {
  count = length(var.ingress_ports)
 # count.index is 4
  type              = "ingress"
  from_port         = element(var.ingress_ports, count.index) 
  to_port           = element(var.ingress_ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = [ element(var.ingress_ciders, count.index ) ]
  security_group_id = aws_security_group.web.id
}

resource "aws_security_group_rule" "web_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
}