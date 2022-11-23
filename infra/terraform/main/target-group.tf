resource "aws_lb_target_group" "webapp" {
  name                 = "${var.environment}-webapp-target-group"
  target_type          = "instance"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  deregistration_delay = 60
  health_check {
    enabled = true
    matcher = 200
    path    = "/"
  }

}