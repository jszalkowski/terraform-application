# Application Module

## Description

This module creaets the following:
1. a load balancer;
2. an autoscaling group;
3. a launch configuration;
4. an ECS cluster;
5. an ECS cluster service; and
6. an ECS task definition.

## Variables

Name | Description | Default
---- | ----------- | -------
`app_name` | application name | |
`app_version` | application version (appended to the name) | |
`authorized_keys` | public keys for SSH access | |
`cluster_size` | number of active instances running in cluster | |
`container_cpu` | container CPU (1024 = 1 vcpu) | |
`container_environment` | container configuration | |
`container_image` | container image | |
`container_memory` | container memory (MB) | |
`container_port` | container port | 80
`environment` | environment to configure | |
`host_security_group_id` | security group IDs for the host pool | |
`host_subnet_ids` | list of subnet IDs for the host pool | |
`image` | image for hosts | |
`instance_port` | instance port | |
`instance_protocol` | instance protocol | http
`instance_type` | instance type for hosts | |
`internal` | flag for internal application pool | |
`lb_port` | load balancer port | |
`lb_protocol` | load balancer protocol | |
`lb_security_group_id` | security group ID for the load balancer | |
`lb_subnet_ids` | list of subnet IDs for the load balancer | |
`pool_size` | number of instances in pool | |
`region` | region to configure | |
`ssh_user` | user for SSH access | ec2-user
`tier` | application tier | |

## Outputs

Name | Description
---- | -----------
`host` | DNS name for the load balancer