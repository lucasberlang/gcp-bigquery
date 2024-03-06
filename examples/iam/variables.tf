
variable "project_id" {
  description = "fixture"
  type        = string
}

variable "region" {
  description = "fixture"
  type        = string
  default     = "europe-west1"
}

######
# Vars
######

variable "iam_dataset" {
  description = "IAM bindings in {ROLE|dataset_id => [MEMBERS]} format."
  type        = map(list(string))
  default     = {}
}
