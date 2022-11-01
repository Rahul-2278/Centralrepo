resource "aws_security_group" "my_sg" {
    vpc_id = var.vpc_id_output_sg
    name = var.sg_name_b

      #Incoming traffic
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.vpc_cidr_block_b]
  }

  #Outgoing traffic
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = [var.vpc_cidr_block_b]
  }
}
  