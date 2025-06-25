module "ec2-test"{
    source = "../terraform-aws-instance"
    instance_type = var.instance_type
    security_groupids = var.sg_ids
    instance_tags = var.tags
}