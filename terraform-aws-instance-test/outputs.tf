output "pub_id" {
  value = module.ec2-test.public_ip
}

output "priv_ip" {
  value = module.ec2-test.private_ip
}

output "inst_id" {
  value =module.ec2-test.instance_id
}