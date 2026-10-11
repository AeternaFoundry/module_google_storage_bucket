resource "google_storage_bucket" "storage_buckets" {
  for_each = var.storage_buckets

  location                    = each.value.location
  name                        = each.value.name
  default_event_based_hold    = each.value.default_event_based_hold
  deletion_policy             = each.value.deletion_policy
  enable_object_retention     = each.value.enable_object_retention
  force_destroy               = each.value.force_destroy
  labels                      = each.value.labels
  project                     = each.value.project
  public_access_prevention    = each.value.public_access_prevention
  requester_pays              = each.value.requester_pays
  rpo                         = each.value.rpo
  storage_class               = each.value.storage_class
  uniform_bucket_level_access = each.value.uniform_bucket_level_access

  dynamic "autoclass" {
    for_each = each.value.autoclass != null ? [each.value.autoclass] : []
    content {
      enabled                = autoclass.value.enabled
      terminal_storage_class = autoclass.value.terminal_storage_class
    }
  }

  dynamic "cors" {
    for_each = each.value.cors != null ? each.value.cors : []
    content {
      max_age_seconds = cors.value.max_age_seconds
      method          = cors.value.method
      origin          = cors.value.origin
      response_header = cors.value.response_header
    }
  }

  dynamic "custom_placement_config" {
    for_each = each.value.custom_placement_config != null ? [each.value.custom_placement_config] : []
    content {
      data_locations = custom_placement_config.value.data_locations
    }
  }

  dynamic "encryption" {
    for_each = each.value.encryption != null ? [each.value.encryption] : []
    content {
      dynamic "customer_managed_encryption_enforcement_config" {
        for_each = encryption.value.customer_managed_encryption_enforcement_config != null ? [encryption.value.customer_managed_encryption_enforcement_config] : []
        content {
          restriction_mode = customer_managed_encryption_enforcement_config.value.restriction_mode
        }
      }
      dynamic "customer_supplied_encryption_enforcement_config" {
        for_each = encryption.value.customer_supplied_encryption_enforcement_config != null ? [encryption.value.customer_supplied_encryption_enforcement_config] : []
        content {
          restriction_mode = customer_supplied_encryption_enforcement_config.value.restriction_mode
        }
      }
      default_kms_key_name = encryption.value.default_kms_key_name
      dynamic "google_managed_encryption_enforcement_config" {
        for_each = encryption.value.google_managed_encryption_enforcement_config != null ? [encryption.value.google_managed_encryption_enforcement_config] : []
        content {
          restriction_mode = google_managed_encryption_enforcement_config.value.restriction_mode
        }
      }
    }
  }

  dynamic "hierarchical_namespace" {
    for_each = each.value.hierarchical_namespace != null ? [each.value.hierarchical_namespace] : []
    content {
      enabled = hierarchical_namespace.value.enabled
    }
  }

  dynamic "ip_filter" {
    for_each = each.value.ip_filter != null ? [each.value.ip_filter] : []
    content {
      allow_all_service_agent_access = ip_filter.value.allow_all_service_agent_access
      allow_cross_org_vpcs           = ip_filter.value.allow_cross_org_vpcs
      mode                           = ip_filter.value.mode
      dynamic "public_network_source" {
        for_each = ip_filter.value.public_network_source != null ? [ip_filter.value.public_network_source] : []
        content {
          allowed_ip_cidr_ranges = public_network_source.value.allowed_ip_cidr_ranges
        }
      }
      dynamic "vpc_network_sources" {
        for_each = ip_filter.value.vpc_network_sources != null ? ip_filter.value.vpc_network_sources : []
        content {
          allowed_ip_cidr_ranges = vpc_network_sources.value.allowed_ip_cidr_ranges
          network                = vpc_network_sources.value.network
        }
      }
    }
  }

  dynamic "lifecycle_rule" {
    for_each = each.value.lifecycle_rule != null ? each.value.lifecycle_rule : []
    content {
      action {
        storage_class = lifecycle_rule.value.action.storage_class
        type          = lifecycle_rule.value.action.type
      }
      condition {
        age                                     = lifecycle_rule.value.condition.age
        created_before                          = lifecycle_rule.value.condition.created_before
        custom_time_before                      = lifecycle_rule.value.condition.custom_time_before
        days_since_custom_time                  = lifecycle_rule.value.condition.days_since_custom_time
        days_since_noncurrent_time              = lifecycle_rule.value.condition.days_since_noncurrent_time
        matches_prefix                          = lifecycle_rule.value.condition.matches_prefix
        matches_storage_class                   = lifecycle_rule.value.condition.matches_storage_class
        matches_suffix                          = lifecycle_rule.value.condition.matches_suffix
        noncurrent_time_before                  = lifecycle_rule.value.condition.noncurrent_time_before
        num_newer_versions                      = lifecycle_rule.value.condition.num_newer_versions
        send_age_if_zero                        = lifecycle_rule.value.condition.send_age_if_zero
        send_days_since_custom_time_if_zero     = lifecycle_rule.value.condition.send_days_since_custom_time_if_zero
        send_days_since_noncurrent_time_if_zero = lifecycle_rule.value.condition.send_days_since_noncurrent_time_if_zero
        send_num_newer_versions_if_zero         = lifecycle_rule.value.condition.send_num_newer_versions_if_zero
        size_above_bytes                        = lifecycle_rule.value.condition.size_above_bytes
        size_below_bytes                        = lifecycle_rule.value.condition.size_below_bytes
        with_state                              = lifecycle_rule.value.condition.with_state
      }
    }
  }

  dynamic "logging" {
    for_each = each.value.logging != null ? [each.value.logging] : []
    content {
      log_bucket        = logging.value.log_bucket
      log_object_prefix = logging.value.log_object_prefix
    }
  }

  dynamic "retention_policy" {
    for_each = each.value.retention_policy != null ? [each.value.retention_policy] : []
    content {
      is_locked        = retention_policy.value.is_locked
      retention_period = retention_policy.value.retention_period
    }
  }

  dynamic "soft_delete_policy" {
    for_each = each.value.soft_delete_policy != null ? [each.value.soft_delete_policy] : []
    content {
      retention_duration_seconds = soft_delete_policy.value.retention_duration_seconds
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }

  dynamic "versioning" {
    for_each = each.value.versioning != null ? [each.value.versioning] : []
    content {
      enabled = versioning.value.enabled
    }
  }

  dynamic "website" {
    for_each = each.value.website != null ? [each.value.website] : []
    content {
      main_page_suffix = website.value.main_page_suffix
      not_found_page   = website.value.not_found_page
    }
  }
}

