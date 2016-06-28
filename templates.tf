/*
 * container templates
 */

resource "template_file" "container-definitions" {
  template = "${file("${path.module}/container_definitions/container_definition.json")}"
  vars {
    container_name = "${var.app_name}${var.app_version}-${var.environment}-${var.tier}-container"
    container_image = "${var.image}"
    container_memory = "${var.container_memory}"
    container_cpu = "${var.container_cpu}"
    host_port = "${var.instance_port}"
    container_port = "${var.container_port}"
    container_environment = "${var.container_environment}"
  }
}

resource "template_file" "ecs-user-data" {
  template = "${file("${path.module}/user_data/container-setup.sh")}"
  vars {
    user = "${var.ssh_user}"
    authorized_keys = "${var.authorized_keys}"
    cluster_name = "${aws_ecs_cluster.cluster.name}"
  }
  lifecycle {
    create_before_destroy = true
  }
}
