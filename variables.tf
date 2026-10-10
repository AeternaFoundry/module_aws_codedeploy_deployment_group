variable "codedeploy_deployment_groups" {
  description = <<EOT
Map of codedeploy_deployment_groups, attributes below
Required:
    - app_name
    - deployment_group_name
    - service_role_arn
Optional:
    - autoscaling_groups
    - deployment_config_name
    - outdated_instances_strategy
    - region
    - tags
    - tags_all
    - termination_hook_enabled
    - alarm_configuration (block):
        - alarms (optional)
        - enabled (optional)
        - ignore_poll_alarm_failure (optional)
    - auto_rollback_configuration (block):
        - enabled (optional)
        - events (optional)
    - blue_green_deployment_config (block):
        - deployment_ready_option (optional, block):
            - action_on_timeout (optional)
            - wait_time_in_minutes (optional)
        - green_fleet_provisioning_option (optional, block):
            - action (optional)
        - terminate_blue_instances_on_deployment_success (optional, block):
            - action (optional)
            - termination_wait_time_in_minutes (optional)
    - deployment_style (block):
        - deployment_option (optional)
        - deployment_type (optional)
    - ec2_tag_filter (block):
        - key (optional)
        - type (optional)
        - value (optional)
    - ec2_tag_set (block):
        - ec2_tag_filter (optional, block):
            - key (optional)
            - type (optional)
            - value (optional)
    - ecs_service (block):
        - cluster_name (required)
        - service_name (required)
    - load_balancer_info (block):
        - elb_info (optional, block):
            - name (optional)
        - target_group_info (optional, block):
            - name (optional)
        - target_group_pair_info (optional, block):
            - prod_traffic_route (required, block):
                - listener_arns (required)
            - target_group (required, block):
                - name (required)
            - test_traffic_route (optional, block):
                - listener_arns (required)
    - on_premises_instance_tag_filter (block):
        - key (optional)
        - type (optional)
        - value (optional)
    - trigger_configuration (block):
        - trigger_events (required)
        - trigger_name (required)
        - trigger_target_arn (required)
EOT

  type = map(object({
    app_name                    = string
    deployment_group_name       = string
    service_role_arn            = string
    autoscaling_groups          = optional(set(string))
    deployment_config_name      = optional(string)
    outdated_instances_strategy = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    termination_hook_enabled    = optional(bool)
    alarm_configuration = optional(object({
      alarms                    = optional(set(string))
      enabled                   = optional(bool)
      ignore_poll_alarm_failure = optional(bool)
    }))
    auto_rollback_configuration = optional(object({
      enabled = optional(bool)
      events  = optional(set(string))
    }))
    blue_green_deployment_config = optional(object({
      deployment_ready_option = optional(object({
        action_on_timeout    = optional(string)
        wait_time_in_minutes = optional(number)
      }))
      green_fleet_provisioning_option = optional(object({
        action = optional(string)
      }))
      terminate_blue_instances_on_deployment_success = optional(object({
        action                           = optional(string)
        termination_wait_time_in_minutes = optional(number)
      }))
    }))
    deployment_style = optional(object({
      deployment_option = optional(string)
      deployment_type   = optional(string)
    }))
    ec2_tag_filter = optional(list(object({
      key   = optional(string)
      type  = optional(string)
      value = optional(string)
    })))
    ec2_tag_set = optional(list(object({
      ec2_tag_filter = optional(list(object({
        key   = optional(string)
        type  = optional(string)
        value = optional(string)
      })))
    })))
    ecs_service = optional(object({
      cluster_name = string
      service_name = string
    }))
    load_balancer_info = optional(object({
      elb_info = optional(list(object({
        name = optional(string)
      })))
      target_group_info = optional(list(object({
        name = optional(string)
      })))
      target_group_pair_info = optional(object({
        prod_traffic_route = object({
          listener_arns = set(string)
        })
        target_group = list(object({
          name = string
        }))
        test_traffic_route = optional(object({
          listener_arns = set(string)
        }))
      }))
    }))
    on_premises_instance_tag_filter = optional(list(object({
      key   = optional(string)
      type  = optional(string)
      value = optional(string)
    })))
    trigger_configuration = optional(list(object({
      trigger_events     = set(string)
      trigger_name       = string
      trigger_target_arn = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.codedeploy_deployment_groups : (
        v.load_balancer_info == null || (v.load_balancer_info.target_group_pair_info == null || (length(v.load_balancer_info.target_group_pair_info.target_group) >= 1 && length(v.load_balancer_info.target_group_pair_info.target_group) <= 2))
      )
    ])
    error_message = "Each target_group list must contain between 1 and 2 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.codedeploy_deployment_groups : (
        length(v.app_name) >= 0 && length(v.app_name) <= 100
      )
    ])
    error_message = "must be between 0 and 100 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.codedeploy_deployment_groups : (
        v.blue_green_deployment_config == null || (v.blue_green_deployment_config.terminate_blue_instances_on_deployment_success == null || (v.blue_green_deployment_config.terminate_blue_instances_on_deployment_success.termination_wait_time_in_minutes == null || (v.blue_green_deployment_config.terminate_blue_instances_on_deployment_success.termination_wait_time_in_minutes <= 2880)))
      )
    ])
    error_message = "must be at most 2880"
  }
  validation {
    condition = alltrue([
      for k, v in var.codedeploy_deployment_groups : (
        v.deployment_config_name == null || (length(v.deployment_config_name) >= 0 && length(v.deployment_config_name) <= 100)
      )
    ])
    error_message = "must be between 0 and 100 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.codedeploy_deployment_groups : (
        length(v.deployment_group_name) >= 0 && length(v.deployment_group_name) <= 100
      )
    ])
    error_message = "must be between 0 and 100 characters"
  }
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

