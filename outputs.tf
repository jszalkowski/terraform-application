/*
 * application outputs
 */

output "host" {
  value = "${aws_elb.load-balancer.dns_name}"
}
