variable "vpc_name" {
  description = "Name of the VPC"
  type = string
  default = "cool-vpc-4-modules"
}

variable "vpc_cidr" {
    description = "CIDR IP for the VPC"
    type = string
    default = "10.12.0.0/16"
}