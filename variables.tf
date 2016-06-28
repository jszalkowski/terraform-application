/*
 * variables for application
 */

variable "region" {
  type = "string"
  description = "region to configure"
}

variable "environment" {
  type = "string"
  description = "environment to configure"
}

variable "app_name" {
  type = "string"
  description = "application name"
}

variable "app_version" {
  description = "application version (appended to the name)"
  default = ""
}

variable "tier" {
  type = "string"
  description = "application tier"
}

variable "s3_remote_bucket" {
  type = "string"
  description = "S3 bucket for state files"
}

variable "instance_profile_name" {
  type = "string"
  description = "instance profile for ELB registration"
}

variable "service_role_arn" {
  type = "string"
  description = "service role for ECS registration"
}

variable "public_subnet_ids" {
  type = "string"
  description = "list of public subnet IDs"
}

variable "private_subnet_ids" {
  type = "string"
  description = "list of private subnet IDs"
}

variable "public_web_security_group_id" {
  type = "string"
  description = "public security group ID"
}

variable "internal_security_group_id" {
  type = "string"
  description = "private security group ID"
}

variable "az_count" {
  description = "number of availability zones to span"
  default = 2
}

variable "lb_protocol" {
  type = "string"
  description = "load balancer protocol"
}

variable "lb_port" {
  type = "string"
  description = "load balancer port"
}

variable "instance_protocol" {
  description = "instance protocol"
  default = "http"
}

variable "instance_port" {
  description = "instance port"
  default = 80
}

variable "container_port" {
  description = "container port"
  default = 80
}

variable "image" {
  type = "string"
  description = "image for hosts"
}

variable "instance_type" {
  type = "string"
  description = "instance type for hosts"
}

variable "pool_size" {
  type = "string"
  description = "number of instances in pool"
}

variable "cluster_size" {
  type = "string"
  description = "number of active instances running in cluster"
}

variable "container_image" {
  type = "string"
  description = "container image"
}

variable "container_environment" {
  type = "string"
  description = "container configuration"
}

variable "container_memory" {
  type = "string"
  description = "container memory (MB)"
}

variable "container_cpu" {
  type = "string"
  description = "container CPU (1024 = 1 vcpu)"
}

variable "ssh_user" {
  description = "user for SSH access"
  default = "ec2-user"
}

variable "authorized_keys" {
  type = "string"
  description = "public keys for SSH access"
}
