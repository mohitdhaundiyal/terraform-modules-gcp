locals {
  buckets = {
    for bucket in var.buckets :
    bucket.name => bucket
  }
}

resource "google_storage_bucket" "bucket" {
  for_each                    = local.buckets
  name                        = each.value["name"]
  project                     = each.value["project_id"]
  location                    = each.value["location"]
  storage_class               = each.value["storage_class"]
  uniform_bucket_level_access = each.value["bucket_policy_only"]
  labels                      = each.value["labels"]
  force_destroy               = each.value["force_destroy"]

  versioning {
    enabled = each.value["versioning"]
  }

  dynamic "retention_policy" {
    for_each = lookup(each.value, "retention_policy", null) != null ? lookup(each.value, "retention_policy", null) : []
    content {
      is_locked        = retention_policy.value["is_locked"]
      retention_period = retention_policy.value["retention_period"]
    }
  }

  dynamic "lifecycle_rule" {
    for_each = lookup(each.value, "lifecycle_rule", null) != null ? lookup(each.value, "lifecycle_rule", null) : []
    content {
      action {
        type          = lookup(lifecycle_rule.value, "action_type", null)
        storage_class = lookup(lifecycle_rule.value, "storage_class", null)
      }
      condition {
        age            = lookup(lifecycle_rule.value, "age", null)
        created_before = lookup(lifecycle_rule.value, "created_before", null)
      }
    }
  }

}
