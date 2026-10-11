output "storage_buckets_id" {
  description = "Map of id values across all storage_buckets, keyed the same as var.storage_buckets except keys with no id are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "storage_buckets_autoclass" {
  description = "Map of autoclass values across all storage_buckets, keyed the same as var.storage_buckets except keys with no autoclass are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => one(v.autoclass) if v.autoclass != null && length(v.autoclass) > 0 }
}
output "storage_buckets_cors" {
  description = "Map of cors values across all storage_buckets, keyed the same as var.storage_buckets except keys with no cors are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.cors if v.cors != null && length(v.cors) > 0 }
}
output "storage_buckets_custom_placement_config" {
  description = "Map of custom_placement_config values across all storage_buckets, keyed the same as var.storage_buckets except keys with no custom_placement_config are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => one(v.custom_placement_config) if v.custom_placement_config != null && length(v.custom_placement_config) > 0 }
}
output "storage_buckets_default_event_based_hold" {
  description = "Map of default_event_based_hold values across all storage_buckets, keyed the same as var.storage_buckets except keys with no default_event_based_hold are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.default_event_based_hold if v.default_event_based_hold != null }
}
output "storage_buckets_deletion_policy" {
  description = "Map of deletion_policy values across all storage_buckets, keyed the same as var.storage_buckets except keys with no deletion_policy are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "storage_buckets_effective_labels" {
  description = "Map of effective_labels values across all storage_buckets, keyed the same as var.storage_buckets except keys with no effective_labels are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "storage_buckets_enable_object_retention" {
  description = "Map of enable_object_retention values across all storage_buckets, keyed the same as var.storage_buckets except keys with no enable_object_retention are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.enable_object_retention if v.enable_object_retention != null }
}
output "storage_buckets_encryption" {
  description = "Map of encryption values across all storage_buckets, keyed the same as var.storage_buckets except keys with no encryption are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => one(v.encryption) if v.encryption != null && length(v.encryption) > 0 }
}
output "storage_buckets_force_destroy" {
  description = "Map of force_destroy values across all storage_buckets, keyed the same as var.storage_buckets except keys with no force_destroy are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.force_destroy if v.force_destroy != null }
}
output "storage_buckets_hierarchical_namespace" {
  description = "Map of hierarchical_namespace values across all storage_buckets, keyed the same as var.storage_buckets except keys with no hierarchical_namespace are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => one(v.hierarchical_namespace) if v.hierarchical_namespace != null && length(v.hierarchical_namespace) > 0 }
}
output "storage_buckets_ip_filter" {
  description = "Map of ip_filter values across all storage_buckets, keyed the same as var.storage_buckets except keys with no ip_filter are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => one(v.ip_filter) if v.ip_filter != null && length(v.ip_filter) > 0 }
}
output "storage_buckets_labels" {
  description = "Map of labels values across all storage_buckets, keyed the same as var.storage_buckets except keys with no labels are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "storage_buckets_lifecycle_rule" {
  description = "Map of lifecycle_rule values across all storage_buckets, keyed the same as var.storage_buckets except keys with no lifecycle_rule are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.lifecycle_rule if v.lifecycle_rule != null && length(v.lifecycle_rule) > 0 }
}
output "storage_buckets_location" {
  description = "Map of location values across all storage_buckets, keyed the same as var.storage_buckets except keys with no location are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.location if v.location != null && length(v.location) > 0 }
}
output "storage_buckets_logging" {
  description = "Map of logging values across all storage_buckets, keyed the same as var.storage_buckets except keys with no logging are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => one(v.logging) if v.logging != null && length(v.logging) > 0 }
}
output "storage_buckets_name" {
  description = "Map of name values across all storage_buckets, keyed the same as var.storage_buckets except keys with no name are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "storage_buckets_project" {
  description = "Map of project values across all storage_buckets, keyed the same as var.storage_buckets except keys with no project are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.project if v.project != null && length(v.project) > 0 }
}
output "storage_buckets_project_number" {
  description = "Map of project_number values across all storage_buckets, keyed the same as var.storage_buckets except keys with no project_number are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.project_number if v.project_number != null }
}
output "storage_buckets_public_access_prevention" {
  description = "Map of public_access_prevention values across all storage_buckets, keyed the same as var.storage_buckets except keys with no public_access_prevention are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.public_access_prevention if v.public_access_prevention != null && length(v.public_access_prevention) > 0 }
}
output "storage_buckets_requester_pays" {
  description = "Map of requester_pays values across all storage_buckets, keyed the same as var.storage_buckets except keys with no requester_pays are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.requester_pays if v.requester_pays != null }
}
output "storage_buckets_retention_policy" {
  description = "Map of retention_policy values across all storage_buckets, keyed the same as var.storage_buckets except keys with no retention_policy are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => one(v.retention_policy) if v.retention_policy != null && length(v.retention_policy) > 0 }
}
output "storage_buckets_rpo" {
  description = "Map of rpo values across all storage_buckets, keyed the same as var.storage_buckets except keys with no rpo are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.rpo if v.rpo != null && length(v.rpo) > 0 }
}
output "storage_buckets_self_link" {
  description = "Map of self_link values across all storage_buckets, keyed the same as var.storage_buckets except keys with no self_link are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.self_link if v.self_link != null && length(v.self_link) > 0 }
}
output "storage_buckets_soft_delete_policy" {
  description = "Map of soft_delete_policy values across all storage_buckets, keyed the same as var.storage_buckets except keys with no soft_delete_policy are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => one(v.soft_delete_policy) if v.soft_delete_policy != null && length(v.soft_delete_policy) > 0 }
}
output "storage_buckets_storage_class" {
  description = "Map of storage_class values across all storage_buckets, keyed the same as var.storage_buckets except keys with no storage_class are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.storage_class if v.storage_class != null && length(v.storage_class) > 0 }
}
output "storage_buckets_terraform_labels" {
  description = "Map of terraform_labels values across all storage_buckets, keyed the same as var.storage_buckets except keys with no terraform_labels are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "storage_buckets_time_created" {
  description = "Map of time_created values across all storage_buckets, keyed the same as var.storage_buckets except keys with no time_created are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "storage_buckets_uniform_bucket_level_access" {
  description = "Map of uniform_bucket_level_access values across all storage_buckets, keyed the same as var.storage_buckets except keys with no uniform_bucket_level_access are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.uniform_bucket_level_access if v.uniform_bucket_level_access != null }
}
output "storage_buckets_updated" {
  description = "Map of updated values across all storage_buckets, keyed the same as var.storage_buckets except keys with no updated are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.updated if v.updated != null && length(v.updated) > 0 }
}
output "storage_buckets_url" {
  description = "Map of url values across all storage_buckets, keyed the same as var.storage_buckets except keys with no url are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => v.url if v.url != null && length(v.url) > 0 }
}
output "storage_buckets_versioning" {
  description = "Map of versioning values across all storage_buckets, keyed the same as var.storage_buckets except keys with no versioning are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => one(v.versioning) if v.versioning != null && length(v.versioning) > 0 }
}
output "storage_buckets_website" {
  description = "Map of website values across all storage_buckets, keyed the same as var.storage_buckets except keys with no website are omitted"
  value       = { for k, v in google_storage_bucket.storage_buckets : k => one(v.website) if v.website != null && length(v.website) > 0 }
}

