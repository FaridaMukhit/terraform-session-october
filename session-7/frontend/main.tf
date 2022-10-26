resource "aws_sqs_queue" "main-1" {
  name = replace(local.name, "rtype", "sqs-1")
  tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "sqs-1") })
}

resource "aws_sqs_queue" "main-2" {
  name = replace(local.name, "rtype", "sqs-2")
  tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "sqs-2") })
}

resource "aws_sqs_queue" "main-3" {
  name = replace(local.name, "rtype", "sqs-3")
  tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "sqs-3") })
}