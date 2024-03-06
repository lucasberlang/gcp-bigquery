# Google Bigquery IAM Terraform Module

Terraform module which creates additive permissions in a datasets and tables in BigQuery.

* [GCP Bigquery Dataset IAM](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_iam#google_bigquery_dataset_iam_member)
* [GCP Bigquery Table IAM](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table_iam#google_bigquery_table_iam_member)

## Terraform versions

Supported version 0.15 and higher.

## Usage

```hcl
module "bigquery-iam" {
  source = "git::https://github.com/lucasberlang/gcp-cloud-storage.git//modules/iam?ref=v1.5.0"

  [...]
}
```

>The value of the ref source argument can be any terraform module version, please see [version list](https://github.com/lucasberlang/gcp-bigquery/tags). Make sure to use the latest module version.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_bigquery_dataset_iam_member.dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_iam_member) | resource |
| [google_bigquery_table_iam_member.table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_dataset"></a> [iam\_dataset](#input\_iam\_dataset) | IAM bindings in {ROLE\|dataset\_id => [MEMBERS]} format. | `map(list(string))` | `{}` | no |
| <a name="input_iam_tables"></a> [iam\_tables](#input\_iam\_tables) | IAM bindings in {ROLE\|project\_id\|dataset\_id\|table\_id => [MEMBERS]} format. | `map(list(string))` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_etag_dataset"></a> [etag\_dataset](#output\_etag\_dataset) | The etag of the IAM policy. |
| <a name="output_etag_table"></a> [etag\_table](#output\_etag\_table) | The etag of the IAM policy. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Test

### Environment

Since most automated tests written with Terratest can make potentially destructive changes in your environment, we
strongly recommend running tests in an environment that is totally separate from production. For example, if you are
testing infrastructure code for GCP, you should run your tests in a completely separate GCP account.

### Requirements

Terratest uses the Go testing framework. To use terratest, you need to install:

* [Go](https://golang.org/) (requires version >=1.13)

### Running

Now you should be able to run the example test.

1. Change your working directory to the `test/src` folder.
1. Each time you want to run the tests:

```bash
go test -timeout 20m
```

### Terraform CLI

On the `examples/dummy` folder, perform the following commands.

* Get the plugins:

```bash
terraform init
```

* Review and apply the infrastructure test build:

```bash
terraform apply -var-file=fixtures.europe-west1.tfvars
```

* Remove all resources:

```bash
terraform destroy -auto-approve
```
