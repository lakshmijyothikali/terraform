resource "aws_instance" "roboshop" {
  count                  = length(var.instances)
  ami                    = var.ami_id
  instance_type          = var.environment == "dev" ? var.instance_type_dev : var.instance_type_prod
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = merge(var.common_tags,
      {
        Component = var.instances[count.index]
      })
}

resource "aws_security_group" "allow-all" {
  name        = var.securitygroup_name
  description = var.securitygroup_description
  
 ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

   egress {
     from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  tags = merge(var.common_tags,
               {
                Name = "allow_all"
               })
}