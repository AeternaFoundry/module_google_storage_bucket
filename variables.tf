variable "storage_buckets" {
  description = <<EOT
Map of storage_buckets, attributes below
Required:
    - location
    - name
Optional:
    - default_event_based_hold
    - deletion_policy
    - enable_object_retention
    - force_destroy
    - labels
    - project
    - public_access_prevention
    - requester_pays
    - rpo
    - storage_class
    - uniform_bucket_level_access
    - autoclass (block):
        - enabled (required)
        - terminal_storage_class (optional)
    - cors (block):
        - max_age_seconds (optional)
        - method (optional)
        - origin (optional)
        - response_header (optional)
    - custom_placement_config (block):
        - data_locations (required)
    - encryption (block):
        - customer_managed_encryption_enforcement_config (optional, block):
            - restriction_mode (required)
        - customer_supplied_encryption_enforcement_config (optional, block):
            - restriction_mode (required)
        - default_kms_key_name (optional)
        - google_managed_encryption_enforcement_config (optional, block):
            - restriction_mode (required)
    - hierarchical_namespace (block):
        - enabled (required)
    - ip_filter (block):
        - allow_all_service_agent_access (optional)
        - allow_cross_org_vpcs (optional)
        - mode (required)
        - public_network_source (optional, block):
            - allowed_ip_cidr_ranges (required)
        - vpc_network_sources (optional, block):
            - allowed_ip_cidr_ranges (required)
            - network (required)
    - lifecycle_rule (block):
        - action (required, block):
            - storage_class (optional)
            - type (required)
        - condition (required, block):
            - age (optional)
            - created_before (optional)
            - custom_time_before (optional)
            - days_since_custom_time (optional)
            - days_since_noncurrent_time (optional)
            - matches_prefix (optional)
            - matches_storage_class (optional)
            - matches_suffix (optional)
            - noncurrent_time_before (optional)
            - num_newer_versions (optional)
            - send_age_if_zero (optional)
            - send_days_since_custom_time_if_zero (optional)
            - send_days_since_noncurrent_time_if_zero (optional)
            - send_num_newer_versions_if_zero (optional)
            - size_above_bytes (optional)
            - size_below_bytes (optional)
            - with_state (optional)
    - logging (block):
        - log_bucket (required)
        - log_object_prefix (optional)
    - retention_policy (block):
        - is_locked (optional)
        - retention_period (required)
    - soft_delete_policy (block):
        - retention_duration_seconds (optional)
    - timeouts (block):
        - create (optional)
        - read (optional)
        - update (optional)
    - versioning (block):
        - enabled (required)
    - website (block):
        - main_page_suffix (optional)
        - not_found_page (optional)
EOT

  type = map(object({
    location                    = string
    name                        = string
    default_event_based_hold    = optional(bool)
    deletion_policy             = optional(string)
    enable_object_retention     = optional(bool)
    force_destroy               = optional(bool)
    labels                      = optional(map(string))
    project                     = optional(string)
    public_access_prevention    = optional(string)
    requester_pays              = optional(bool)
    rpo                         = optional(string)
    storage_class               = optional(string)
    uniform_bucket_level_access = optional(bool)
    autoclass = optional(object({
      enabled                = bool
      terminal_storage_class = optional(string)
    }))
    cors = optional(list(object({
      max_age_seconds = optional(number)
      method          = optional(list(string))
      origin          = optional(list(string))
      response_header = optional(list(string))
    })))
    custom_placement_config = optional(object({
      data_locations = set(string)
    }))
    encryption = optional(object({
      customer_managed_encryption_enforcement_config = optional(object({
        restriction_mode = string
      }))
      customer_supplied_encryption_enforcement_config = optional(object({
        restriction_mode = string
      }))
      default_kms_key_name = optional(string)
      google_managed_encryption_enforcement_config = optional(object({
        restriction_mode = string
      }))
    }))
    hierarchical_namespace = optional(object({
      enabled = bool
    }))
    ip_filter = optional(object({
      allow_all_service_agent_access = optional(bool)
      allow_cross_org_vpcs           = optional(bool)
      mode                           = string
      public_network_source = optional(object({
        allowed_ip_cidr_ranges = list(string)
      }))
      vpc_network_sources = optional(list(object({
        allowed_ip_cidr_ranges = list(string)
        network                = string
      })))
    }))
    lifecycle_rule = optional(list(object({
      action = object({
        storage_class = optional(string)
        type          = string
      })
      condition = object({
        age                                     = optional(number)
        created_before                          = optional(string)
        custom_time_before                      = optional(string)
        days_since_custom_time                  = optional(number)
        days_since_noncurrent_time              = optional(number)
        matches_prefix                          = optional(list(string))
        matches_storage_class                   = optional(list(string))
        matches_suffix                          = optional(list(string))
        noncurrent_time_before                  = optional(string)
        num_newer_versions                      = optional(number)
        send_age_if_zero                        = optional(bool)
        send_days_since_custom_time_if_zero     = optional(bool)
        send_days_since_noncurrent_time_if_zero = optional(bool)
        send_num_newer_versions_if_zero         = optional(bool)
        size_above_bytes                        = optional(number)
        size_below_bytes                        = optional(number)
        with_state                              = optional(string)
      })
    })))
    logging = optional(object({
      log_bucket        = string
      log_object_prefix = optional(string)
    }))
    retention_policy = optional(object({
      is_locked        = optional(bool)
      retention_period = string
    }))
    soft_delete_policy = optional(object({
      retention_duration_seconds = optional(number)
    }))
    timeouts = optional(object({
      create = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
    versioning = optional(object({
      enabled = bool
    }))
    website = optional(object({
      main_page_suffix = optional(string)
      not_found_page   = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.storage_buckets : (
        v.lifecycle_rule == null || (length(v.lifecycle_rule) <= 100)
      )
    ])
    error_message = "Each lifecycle_rule list must contain at most 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.storage_buckets : (
        v.lifecycle_rule == null || alltrue([for item in v.lifecycle_rule : (item.condition.with_state == null || (contains(["LIVE", "ARCHIVED", "ANY", ""], item.condition.with_state)))])
      )
    ])
    error_message = "must be one of: \"LIVE\", \"ARCHIVED\", \"ANY\", \"\""
  }
  validation {
    condition = alltrue([
      for k, v in var.storage_buckets : (
        v.ip_filter == null || (contains(["Enabled", "Disabled"], v.ip_filter.mode))
      )
    ])
    error_message = "must be one of: \"Enabled\", \"Disabled\""
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

