
######
# google_bigquery_dataset
######

output "etag_dataset" {
  description = "The etag of the IAM policy."
  value       = [for k in google_bigquery_dataset_iam_member.dataset : k.etag]
}

output "etag_table" {
  description = "The etag of the IAM policy."
  value       = [for k in google_bigquery_table_iam_member.table : k.etag]
}
