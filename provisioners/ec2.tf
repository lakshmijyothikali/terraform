resource "aws_instance" "roboshop" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = var.instance_tags

   provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
  }

   provisioner "local-exec" {
    command = "echo instance is destroyed"
    when = destroy
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
  }
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

  tags = var.sg_tags
}