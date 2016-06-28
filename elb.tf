/*
 * ELB configuration
 */

resource "aws_elb" "load-balancer" {
  name = "${var.app_name}${var.app_version}-${var.environment}-${var.tier}-lb"
  security_groups = ["${var.public_web_security_group_id}"]
  subnets = ["${split(",", var.public_subnet_ids)}"]
  cross_zone_load_balancing = true
  connection_draining = true
  listener {
    instance_port = "${var.instance_port}"
    instance_protocol = "${var.instance_protocol}"
    lb_port = "${var.lb_port}"
    lb_protocol = "${var.instance_protocol}"
  }
  health_check {
    healthy_threshold = 10
    unhealthy_threshold = 2
    target = "TCP:${var.instance_port}"
    interval = 30
    timeout = 5
  }
  tags {
    Name = "${var.app_name}${var.app_version}-${var.environment}-${var.tier}-lb"
    Application = "${var.app_name}"
    Environment = "${var.environment}"
  }
}
