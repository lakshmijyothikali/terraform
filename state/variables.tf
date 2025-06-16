variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default     = "t2.micro"
}

variable "instance_tags" {
  type        = map(string)
  default     = {
    Name = "HelloWorld"
  }
}

variable "securitygroup_name" {
  default     = "allow-all"
}

variable "securitygroup_description" {
  type        = string
  default     = "Allow all traffic"
}

variable "from_port" {
  default     = 0
}

variable "to_port" {
  default     = 0
}

variable "cidr_blocks" {
  default     = ["0.0.0.0/0"]
 
 }

variable "ipv6_cidr_blocks" {
  type        = list(string)
  default     = ["::/0"]
}

variable "sg_tags" {
    default = {
        name = "allow-all"
    }
}



