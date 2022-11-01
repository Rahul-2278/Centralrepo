#----------------vpc_variable-----------
variable "vpc_cidr_block" {
    type = string
    default = "10.4.0.0/16"
  
}

variable "vpc_tag" {
    type = string
    default = "my_vpc_1st"
  
}



#-----------------subnet_variable-------------



variable "public_subnet_cidr_block" {
    type = string
    default = "10.4.1.0/24"
  
}



variable "public_az" {
    type = string
    default = "us-east-1a"
  
}

variable "public_tags" {
    type = string
    default = "public_subnet"

  
}



variable "private_subnet_cidr_block" {
    type = string
    default = "10.4.2.0/24"
  
}


variable "private_az" {
    type = string
    default = "us-east-1c"
  
}

variable "private_tags" {
    type = string
    default = "private_subnet"

  
}

variable "igw_tag" {
    type = string
    default = "my_igw"
  
}

variable "ngw_tag" {
    type = string
    default = "my_ngw"
  
}


#----------------security_group_variable--------------------------

variable "sg_name" {
    type = string
    default = "my_sg"
  
}

#---------------------ec2_variable-------------------------------------


variable "public_ami_id" {
    type = string
    default = "ami-026b57f3c383c2eec"
  
}

variable "public_instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "public_key_name" {
    type = string
    default = "key"
  
}



variable "public_instance_tags" {
    type = string
    default = "public_instance"
  
}

variable "private_ami_id" {
    type = string
    default = "ami-026b57f3c383c2eec"
  
}

variable "private_instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "private_key_name" {
    type = string
    default = "key"
  
}


variable "private_instance_tags" {
    type = string
    default = "private_instance"
  
}
