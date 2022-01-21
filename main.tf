module "vpc" {
    source = "./modules/vpc"
}

module "subnet" {
    source      = "./modules/subnet"
    vpc_id      = module.vpc.vpc_id
    environment  = module.vpc.environment 
    CIDR_block_VPC = module.vpc.CIDR_block_VPC
}

module "security" {
    source = "./modules/security"
    vpc_id  = module.vpc.vpc_id
    environment = module.vpc.environment
}

module "ec2" {
    source = "./modules/ec2"
    public_subnet_CIDR = module.subnet.public_subnet_CIDR
    vpc_SG_ids = module.security.vpc_SG_ids
    subnet_id = module.subnet.subnet_id
}