resource "aws_subnet" "public_subnet" {
    cidr_block = var.public_subnet_cidr_block_b
    vpc_id = var.vpc_id_output_subnet
    availability_zone = var.public_az_b
    tags = {
      "name" = var.public_tags_b
    }
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = var.vpc_id_output_subnet
    tags = {
      "name" = var.igw_tag_b
    }
}

resource "aws_route_table" "igw_rt" {
    vpc_id = var.vpc_id_output_subnet
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    } 
}

resource "aws_route_table_association" "igw_association" {
    route_table_id = aws_internet_gateway.my_igw.id
    subnet_id = aws_subnet.public_subnet.id
}

resource "aws_subnet" "private_subnet" {
    vpc_id = var.vpc_id_output_subnet
    cidr_block = var.private_subnet_cidr_block_b
    availability_zone = var.private_az_b
    tags = {
      "name" = var.private_tags_b
    }
  
}

resource "aws_eip" "elastic" {
    vpc = true
  
}

resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = aws_eip.elastic.id
    subnet_id = aws_subnet.public_subnet.id
    tags = {
      "name" = var.ngw_tag_b
    }

  
}


resource "aws_route_table" "nat_rt" {
    vpc_id = var.vpc_id_output_subnet
    route {

        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway.id
    }
  
}

resource "aws_route_table_association" "nat_association" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.nat_rt.id
    
  
}