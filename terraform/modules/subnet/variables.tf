variable "vpc_id" {
    description = "ID of the VPC"
    type = string
}

variable "subneta_cidr" {
  description = "CIDR block for the subnet"
  type = string
  default = "11.11.1.0/16"
}

variable "subneta_name" {
  description = "Name of the subnet A"
  type = string
  default = "Subnet A"
}

variable "availability_zone" {
    description = "AZ for the subnet"
    type = string
    default = "us-east-a"
  
}