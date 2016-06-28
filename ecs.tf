/*
 * ECS configration
 */

resource "aws_ecs_cluster" "cluster" {
  name = "${var.app_name}${var.app_version}-${var.environment}-${var.tier}-cluster"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecs_task_definition" "task-definition" {
  family = "${var.app_name}${var.app_version}-${var.environment}-${var.tier}-td"
  container_definitions = "${template_file.container-definitions.rendered}"
}

resource "aws_ecs_service" "cluster-service" {
  name = "${var.app_name}${var.app_version}-${var.environment}-${var.tier}-cs"
  task_definition = "${aws_ecs_task_definition.task-definition.arn}"
  desired_count = "${var.cluster_size}"
  cluster = "${aws_ecs_cluster.cluster.id}"
  iam_role = "${var.service_role_arn}"
  load_balancer {
    elb_name = "${aws_elb.load-balancer.id}"
    container_name = "${var.app_name}${var.app_version}-${var.environment}-${var.tier}-container"
    container_port = "${var.container_port}"
  }
}
