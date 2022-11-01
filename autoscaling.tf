resource "aws_autoscaling_group" "asg" {
  name                 = "asg"
  vpc_zone_identifier  = [var.as_publicsubnet_id_z , var.as_privatesubnet_id_z]
  launch_configuration = var.launchconfig_id_z
  min_size             = 1
  max_size             = 3
  health_check_grace_period = 300
  health_check_type = "EC2"
 
  tag {
      key = "asg_tag"
      value = "ec2 instance"
      propagate_at_launch = true
  }
}