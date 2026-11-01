module "prod_vpc" {
  source             = "./modules/vpc"
  environment        = "prod"
  vpc_cidr           = "10.100.0.0/16"
  public_subnet_cidr = "10.100.1.0/24"
}

module "prod_ec2" {
  source        = "./modules/ec2"
  environment   = "prod"
  vpc_id        = module.prod_vpc.vpc_id
  subnet_id     = module.prod_vpc.public_subnet_id
  ami_id        = "ami-04a81a99f5ec58529" # Ubuntu 24.04 LTS AMI
  instance_type = var.instance_type
}