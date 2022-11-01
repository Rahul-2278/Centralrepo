module "vpc" {
    source = "./modules/vpc"
    vpc_cidr_block_b = var.vpc_cidr_block
    vpc_tag_b = var.vpc_tag
  
}

module "subnet" {
    source = "./modules/subnet"
    public_subnet_cidr_block_b = var.public_subnet_cidr_block
    public_az_b = var.public_az
    public_tags_b = var.public_tags
    private_subnet_cidr_block_b = var.private_subnet_cidr_block
    private_az_b = var.private_az
    private_tags_b = var.private_tags
    igw_tag_b = var.igw_tag
    ngw_tag_b = var.ngw_tag
    vpc_id_output_subnet = module.vpc.vpc_id_output

  
}

module "security_group" {
    source = "./modules/security_group"
    vpc_cidr_block_b = var.vpc_cidr_block
    sg_name_b = var.sg_name
    vpc_id_output_sg = module.vpc.vpc_id_output
  
}



module "ec2" {
    source = "./modules/ec2"
    public_key_name_b = var.public_key_name
    public_ami_id_b = var.public_ami_id
    public_instance_type_b = var.public_instance_type
    public_subnet_id_output_ec2 = module.subnet.public_subnet_id_output
    public_instance_tags_b = var.public_instance_tags
    private_ami_id_b = var.private_ami_id
    private_instance_type_b = var.private_instance_type
    private_key_name_b = var.private_key_name
    private_subnet_id_output_ec2   = module.subnet.private_subnet_id_output
    private_instance_tags_b = var.private_instance_tags
    sg_id_output_ec2 = module.security_group.sg_id_output
  
}