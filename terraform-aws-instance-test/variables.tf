variable "sg_ids" {
    default = ["sg-09ae3e91bc174bb9b"]
}

variable "tags" {
  default = {
    Name ="cart"
    Terraform ="true"
    Environment="dev"
  }
}

variable "instance_type" {
    default = "t3.large"
}