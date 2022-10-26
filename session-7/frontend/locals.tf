locals {
    name = "aws-${var.region}-${var.stage}-${var.env}-${var.project}-rtype"
    common_tags = {
        Environment = var.env
        Team = "DevOps"
        owner = "farida"
        Project     = var.project
        Account     = var.stage
        Name = "${var.env}-sqs-2"
    }
}