module "vpc" {
    source = "./modules/vpc"
}

module "subnet" {
    source      = "./modules/subnet"
    vpc_id      = module.vpc.vpc_id
    environment  = module.vpc.environment
    aws_region = var.aws_region
    aws_profile = var.aws_profile   
}