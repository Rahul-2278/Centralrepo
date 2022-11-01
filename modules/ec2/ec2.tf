resource "aws_instance" "publiic_instance" {
    ami = var.public_ami_id_b
    instance_type = var.public_instance_type_b
    key_name = var.public_key_name_b
    subnet_id = var.public_subnet_id_output_ec2
    security_groups = [var.sg_id_output_ec2]
    tags = {
        name = var.public_instance_tags_b
    
    }
  
}

resource "aws_instance" "private_instance" {
    ami = var.private_ami_id_b
    instance_type = var.private_instance_type_b
    key_name = var.private_key_name_b
    subnet_id = var.private_subnet_id_output_ec2
    security_groups = [var.sg_id_output_ec2]
    tags = {
       name = var.private_instance_tags_b
    }
  
}