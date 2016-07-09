/*
 * configuration for autoscaling groups
 */

resource "aws_autoscaling_group" "autoscaling-group" {
  name = "${var.app_name}${var.app_version}-${var.environment}-${var.tier}-asg"
  launch_configuration = "${aws_launch_configuration.launch-configuration.name}"
  min_size = "${var.pool_size}"
  max_size = "${var.pool_size}"
  load_balancers = ["${aws_elb.load-balancer.name}"]
  vpc_zone_identifier  = ["${split(",", var.host_subnet_ids)}"]
  tag {
    key = "Name"
    value = "${var.app_name}${var.app_version}-${var.environment}-${var.tier}-server"
    propagate_at_launch = true
  }
  tag {
    key = "Application"
    value = "${var.app_name}"
    propagate_at_launch = true
  }
  tag {
    key = "Environment"
    value = "${var.environment}"
    propagate_at_launch = true
  }
}
