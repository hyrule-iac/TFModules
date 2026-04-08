variable "vpc_id" {
    description = "Name of the vpc"
    type = string
}

variable "subnet_id" {
  description = "Id of subnet"
  type = string
}

variable "ami_id" {
  description = "AMI ID of the instance"
  type = string
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "Type of instance to fire up"
  type = string
  default = "t2.micro"
}

variable "instance_name" {
  description = "Name of EC2"
  type = string
  default = "Instance Ec2"
}


