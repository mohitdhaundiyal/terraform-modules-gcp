variable "buckets" {
  type = list(object({
    name               = optional(string)
    project_id         = optional(string)
    location           = optional(string)
    storage_class      = optional(string)
    bucket_policy_only = optional(bool)
    labels             = optional(map(any))
    versioning         = optional(bool)
    retention_policy = optional(list(object({
      is_locked        = optional(bool)
      retention_period = optional(number)
    })))
    lifecycle_rule = optional(list(object({
      action_type    = optional(string)
      storage_class  = optional(string)
      age            = optional(number)
      created_before = optional(string)
    })))
    force_destroy = optional(bool)
  }))
  description = "The list of bucket details"
  default     = []
}
