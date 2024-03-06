
######
# Google Bigquery Module
######

locals {
  _iam_additive_pairs_dataset = flatten([
    for role, members in var.iam_dataset : [
      for member in members : { role = role, member = member }
    ]
  ])

  iam_additive_dataset = {
    for pair in local._iam_additive_pairs_dataset :
    "${pair.role}-${pair.member}" => pair
  }

  _iam_additive_pairs_tables = flatten([
    for role, members in var.iam_tables : [
      for member in members : { role = role, member = member }
    ]
  ])

  iam_additive_tables = {
    for pair in local._iam_additive_pairs_tables :
    "${pair.role}-${pair.member}" => pair
  }
}

resource "google_bigquery_dataset_iam_member" "dataset" {
  for_each = local.iam_additive_dataset

  dataset_id = split("|", each.value.role)[1]
  role       = split("|", each.value.role)[0]
  member     = each.value.member
}

resource "google_bigquery_table_iam_member" "table" {
  for_each = local.iam_additive_tables

  project    = split("|", each.value.role)[1]
  dataset_id = split("|", each.value.role)[2]
  table_id   = split("|", each.value.role)[3]
  role       = split("|", each.value.role)[0]
  member     = each.value.member
}
