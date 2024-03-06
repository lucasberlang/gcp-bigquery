
######
# google_bigquery_dataset
######

variable "iam_dataset" {
  description = "IAM bindings in {ROLE|dataset_id => [MEMBERS]} format."
  type        = map(list(string))
  default     = {}
}

variable "iam_tables" {
  description = "IAM bindings in {ROLE|project_id|dataset_id|table_id => [MEMBERS]} format."
  type        = map(list(string))
  default     = {}
}
