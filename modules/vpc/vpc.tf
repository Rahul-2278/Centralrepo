resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr_block_b
    instance_tenancy = "default"
    tags ={

        name = var.vpc_tag_b
    }
  
}