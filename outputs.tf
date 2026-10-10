output "codedeploy_deployment_groups_id" {
  description = "Map of id values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.id if v.id != null && length(v.id) > 0 }
}
output "codedeploy_deployment_groups_alarm_configuration" {
  description = "Map of alarm_configuration values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => one(v.alarm_configuration) if v.alarm_configuration != null && length(v.alarm_configuration) > 0 }
}
output "codedeploy_deployment_groups_app_name" {
  description = "Map of app_name values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.app_name if v.app_name != null && length(v.app_name) > 0 }
}
output "codedeploy_deployment_groups_arn" {
  description = "Map of arn values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "codedeploy_deployment_groups_auto_rollback_configuration" {
  description = "Map of auto_rollback_configuration values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => one(v.auto_rollback_configuration) if v.auto_rollback_configuration != null && length(v.auto_rollback_configuration) > 0 }
}
output "codedeploy_deployment_groups_autoscaling_groups" {
  description = "Map of autoscaling_groups values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.autoscaling_groups if v.autoscaling_groups != null && length(v.autoscaling_groups) > 0 }
}
output "codedeploy_deployment_groups_blue_green_deployment_config" {
  description = "Map of blue_green_deployment_config values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => one(v.blue_green_deployment_config) if v.blue_green_deployment_config != null && length(v.blue_green_deployment_config) > 0 }
}
output "codedeploy_deployment_groups_compute_platform" {
  description = "Map of compute_platform values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.compute_platform if v.compute_platform != null && length(v.compute_platform) > 0 }
}
output "codedeploy_deployment_groups_deployment_config_name" {
  description = "Map of deployment_config_name values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.deployment_config_name if v.deployment_config_name != null && length(v.deployment_config_name) > 0 }
}
output "codedeploy_deployment_groups_deployment_group_id" {
  description = "Map of deployment_group_id values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.deployment_group_id if v.deployment_group_id != null && length(v.deployment_group_id) > 0 }
}
output "codedeploy_deployment_groups_deployment_group_name" {
  description = "Map of deployment_group_name values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.deployment_group_name if v.deployment_group_name != null && length(v.deployment_group_name) > 0 }
}
output "codedeploy_deployment_groups_deployment_style" {
  description = "Map of deployment_style values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => one(v.deployment_style) if v.deployment_style != null && length(v.deployment_style) > 0 }
}
output "codedeploy_deployment_groups_ec2_tag_filter" {
  description = "Map of ec2_tag_filter values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.ec2_tag_filter if v.ec2_tag_filter != null && length(v.ec2_tag_filter) > 0 }
}
output "codedeploy_deployment_groups_ec2_tag_set" {
  description = "Map of ec2_tag_set values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.ec2_tag_set if v.ec2_tag_set != null && length(v.ec2_tag_set) > 0 }
}
output "codedeploy_deployment_groups_ecs_service" {
  description = "Map of ecs_service values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => one(v.ecs_service) if v.ecs_service != null && length(v.ecs_service) > 0 }
}
output "codedeploy_deployment_groups_load_balancer_info" {
  description = "Map of load_balancer_info values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => one(v.load_balancer_info) if v.load_balancer_info != null && length(v.load_balancer_info) > 0 }
}
output "codedeploy_deployment_groups_on_premises_instance_tag_filter" {
  description = "Map of on_premises_instance_tag_filter values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.on_premises_instance_tag_filter if v.on_premises_instance_tag_filter != null && length(v.on_premises_instance_tag_filter) > 0 }
}
output "codedeploy_deployment_groups_outdated_instances_strategy" {
  description = "Map of outdated_instances_strategy values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.outdated_instances_strategy if v.outdated_instances_strategy != null && length(v.outdated_instances_strategy) > 0 }
}
output "codedeploy_deployment_groups_region" {
  description = "Map of region values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.region if v.region != null && length(v.region) > 0 }
}
output "codedeploy_deployment_groups_service_role_arn" {
  description = "Map of service_role_arn values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.service_role_arn if v.service_role_arn != null && length(v.service_role_arn) > 0 }
}
output "codedeploy_deployment_groups_tags" {
  description = "Map of tags values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "codedeploy_deployment_groups_tags_all" {
  description = "Map of tags_all values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "codedeploy_deployment_groups_termination_hook_enabled" {
  description = "Map of termination_hook_enabled values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.termination_hook_enabled if v.termination_hook_enabled != null }
}
output "codedeploy_deployment_groups_trigger_configuration" {
  description = "Map of trigger_configuration values across all codedeploy_deployment_groups, keyed the same as var.codedeploy_deployment_groups"
  value       = { for k, v in aws_codedeploy_deployment_group.codedeploy_deployment_groups : k => v.trigger_configuration if v.trigger_configuration != null && length(v.trigger_configuration) > 0 }
}

