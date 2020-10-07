provider "aws" {
  region = var.location
}

resource "aws_launch_template" "LT" {
  name = var.LT_name
  image_id = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.SG_ssh.id]

  tag_specifications {
    resource_type = "instance"

    tags = var.tags
  }

  user_data = filebase64("Scripts/user_access.cloud-init")

  tags = var.tags
}

resource "aws_autoscaling_group" "ASG" {
  availability_zones   = var.ASG_Locations
  desired_capacity     = 1
  max_size             = 1
  min_size             = 1

  launch_template {
    id      = aws_launch_template.LT.id
    version = "$Latest"
  }

  tags = [{
    "Name" = "Cristian.monsalveg"
    "Project" = "Training"
  }]
}