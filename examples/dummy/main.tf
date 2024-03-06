
provider "google" {
  project = var.project_id
  region  = var.region
}

module "bq" {
  source = "../.."

  id                = var.id
  consumo           = "n3"
  offset            = var.offset
  project_id        = var.project_id
  access_identities = var.access_identities
  access            = var.access
  options           = var.options
  tables            = var.tables

  tags = var.tags
}

module "bq_madrid" {
  source = "../.."

  id                = var.id
  location          = "europe-southwest1"
  offset            = var.offset
  project_id        = var.project_id
  access_identities = var.access_identities
  access            = var.access
  options           = var.options
  tables            = var.tables

  tags = var.tags
}

module "bq_madrid_consumo" {
  source = "../.."

  id                = var.id
  location          = "europe-southwest1"
  consumo           = "n3"
  offset            = var.offset
  project_id        = var.project_id
  access_identities = var.access_identities
  access            = var.access
  options           = var.options
  tables            = var.tables

  tags = var.tags
}
