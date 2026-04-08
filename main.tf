module "vpc-mod" {
  source   = "./terraform/modules/vpc"
  vpc_cidr = "10.12.0.0/16"
  vpc_name = "module-vpc"
}

module "subnet_module" {
  source            = "./terraform/modules/subnet"
  vpc_id            = module.vpc-mod.vpc_id
  subneta_cidr      = "10.12.0.0/16"
  subneta_name      = "module-subnet"
  availability_zone = "us-east-1a"
}

module "ec2-workers" {
  source        = "./terraform/modules/ec2"
  vpc_id        = module.vpc-mod.vpc_id
  subnet_id     = module.subnet_module.subnet_id
  ami_id        = "ami_12"
  instance_name = "Module-ec2-instance"
  instance_type = "t2.micro"

}

module "ec2-dev-workers" {
  source        = "./terraform/modules/ec2"
  vpc_id        = module.vpc-mod.vpc_id
  subnet_id     = module.subnet_module.subnet_id
  ami_id        = "ami_111232"
  instance_name = "Module-ec2-instance"
  instance_type = "t2.micro"

}