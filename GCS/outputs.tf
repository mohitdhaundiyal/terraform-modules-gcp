output "buckets" {
  description = "The created storage bucket"
  value = [
    for bucket_key, bucket in local.buckets : {
      name           = google_storage_bucket.bucket[bucket_key].name
      project_id     = google_storage_bucket.bucket[bucket_key].project
      encryption     = google_storage_bucket.bucket[bucket_key].encryption
      labels         = google_storage_bucket.bucket[bucket_key].labels
      location       = google_storage_bucket.bucket[bucket_key].location
      logging        = google_storage_bucket.bucket[bucket_key].logging
      lifecycle_rule = google_storage_bucket.bucket[bucket_key].lifecycle_rule
      storage_class  = google_storage_bucket.bucket[bucket_key].storage_class
      versioning     = google_storage_bucket.bucket[bucket_key].versioning
      force_destroy  = google_storage_bucket.bucket[bucket_key].force_destroy
    }
  ]
}
