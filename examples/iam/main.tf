
provider "google" {
  project = var.project_id
  region  = var.region
}

module "bq-iam" {
  source = "../../modules/iam"

  iam_dataset = var.iam_dataset
}
