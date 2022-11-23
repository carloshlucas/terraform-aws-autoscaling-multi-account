resource "aws_autoscaling_group" "asg" {
  desired_capacity        = var.desired_capacity
  min_size                = var.min_size
  max_size                = var.max_size
  termination_policies    = [var.termination_policies]
  default_instance_warmup = 120
  wait_for_elb_capacity   = var.wait_for_elb_capacity
  health_check_type       = "ELB"
  vpc_zone_identifier     = [var.subnetid_aza, var.subnetid_azb, var.subnetid_azc]
  target_group_arns       = [aws_lb_target_group.webapp.id]

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.webapp.id
        version            = aws_launch_template.webapp.latest_version
      }
    }
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }

}
resource "aws_autoscaling_policy" "asg_policy" {
  name                   = "asgp-webapp"
  autoscaling_group_name = aws_autoscaling_group.asg.id
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 10.0
  }
}
