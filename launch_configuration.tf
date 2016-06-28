/*
 * launch configuration definitions
 */

resource "aws_launch_configuration" "launch-configuration" {
  name_prefix = "${var.app_name}${var.app_version}-${var.environment}-${var.tier}-launch-configuration-"
  image_id = "${var.image}"
  instance_type = "${var.instance_type}"
  iam_instance_profile = "${var.instance_profile_name}"
  security_groups = ["${var.internal_security_group_id}"]
  user_data = "${template_file.ecs-user-data.rendered}"
  lifecycle {
    create_before_destroy = true
  }
}
