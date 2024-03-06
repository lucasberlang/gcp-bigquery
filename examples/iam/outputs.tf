
######
# google_bigquery_dataset
######

output "etag_dataset" {
  description = "The etag of the IAM policy."
  value       = module.bq-iam.etag_dataset
}
