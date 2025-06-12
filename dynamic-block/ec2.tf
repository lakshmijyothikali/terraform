resource "aws_instance" "roboshop" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = var.instance_tags
}

resource "aws_security_group" "allow-all" {
  name        = var.securitygroup_name
  description = var.securitygroup_description
  
 dynamic ingress {
    for_each = var.ingress_ports
    content{
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = "-1"
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }
  }

   egress {
     from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  tags = var.sg_tags
}