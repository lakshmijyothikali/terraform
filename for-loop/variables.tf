variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type_dev" {
  default     = "t2.micro"
}

variable "instance_type_prod" {
  default     = "t2.small"
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


variable "environment" {
    default = "dev"
}

variable "instances" {
    default = {
        mysql    = "t3.micro"
        mongodb  = "t3.micro"
        rabbitmq = "t3.micro"
        redis    = "t3.micro" 
    }
    #defalut = default = ["mysql", "mongodb", "rabbitmq", "redis"]
}

variable "zoneid" {
    default = "Z00601042A7NLOUIR8AZ6"
}

variable "domain_name" {
    default = "jyothiaws84s.site"
}