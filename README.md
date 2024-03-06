# Google Bigquery Terraform Module

Terraform module which creates a datasets and tables in BigQuery.

Inspired by and adapted from [this](https://registry.terraform.io/modules/terraform-google-modules/bigquery)
and its [source code](https://github.com/terraform-google-modules/terraform-google-bigquery).

* [GCP Bigquery Dataset](https://www.terraform.io/docs/providers/google/r/bigquery_dataset.html)
* [GCP Bigquery Table](https://www.terraform.io/docs/providers/google/r/bigquery_table.html)
* [GCP Dataset Access](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_access)

## Terraform versions

Supported version 0.15 and higher.

## Usage

```hcl
module "bigquery" {
  source = "git::https://github.com/lucasberlang/gcp-bigquery.git?ref=v1.4.0"

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
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.68.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 4.68.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_bigquery_dataset_access.domain](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_bigquery_dataset_access) | resource |
| [google-beta_google_bigquery_dataset_access.group_by_email](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_bigquery_dataset_access) | resource |
| [google-beta_google_bigquery_dataset_access.special_group](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_bigquery_dataset_access) | resource |
| [google-beta_google_bigquery_dataset_access.user_by_email](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_bigquery_dataset_access) | resource |
| [google-beta_google_bigquery_dataset_access.views](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_bigquery_dataset_access) | resource |
| [google-beta_google_bigquery_table.default](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_bigquery_table) | resource |
| [google_bigquery_dataset.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset) | resource |
| [google_bigquery_dataset_iam_member.bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_iam_member) | resource |
| [google_bigquery_table.views](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access"></a> [access](#input\_access) | Map of access rules with role and identity type. Keys are arbitrary and must match those in the `access_identities` or `access_identities_views` variable. <br> <a name=role:></a>[role:](#role:) Describes the rights granted to the user specified by the other member of the access object. Basic, predefined, and custom roles are supported. Predefined roles that have equivalent basic roles are swapped by the API to their basic counterparts. <br> <a name=type:></a>[type:](#type:) Type of access to dataset, possible values are: `domain`, `group`, `special_group`, `user`, `view`. | <pre>map(object({<br>    role = string<br>    type = string<br>  }))</pre> | `{}` | no |
| <a name="input_access_identities"></a> [access\_identities](#input\_access\_identities) | Map of access identities used for basic access roles. Identities have the following format: <br> <a name=domain:></a>[domain:](#domain:) A domain to grant access to. Any users signed in with the domain specified will be granted the specified access. <br> <a name=group\_by\_email:></a>[group\_by\_email:](#group\_by\_email:) An email address of a Google Group to grant access to. <br> <a name=special\_group:></a>[special\_group:](#special\_group:)A special group to grant access to. Possible values include: <br> - projectOwners: Owners of the enclosing project. <br> - projectReaders: Readers of the enclosing project. <br> - projectWriters: Writers of the enclosing project. <br> - allAuthenticatedUsers: All authenticated BigQuery users. <br> <a name=user\_by\_email:></a>[user\_by\_email:](#user\_by\_email:) An email address of a user to grant access to. For example: fred@example.com | `map(string)` | `{}` | no |
| <a name="input_access_identities_views"></a> [access\_identities\_views](#input\_access\_identities\_views) | Map of access identities used for basic access roles. View identities have the format 'project\_id\|dataset\_id\|table\_id'. | `map(string)` | `{}` | no |
| <a name="input_consumo"></a> [consumo](#input\_consumo) | Variable to identify if a dataset is of type consumption. | `string` | `""` | no |
| <a name="input_dataset_access"></a> [dataset\_access](#input\_dataset\_access) | Set access in the dataset resource instead of using separate resources. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Optional description. | `string` | `"Terraform managed."` | no |
| <a name="input_encryption_key"></a> [encryption\_key](#input\_encryption\_key) | Self link of the KMS key that will be used to protect destination table. | `string` | `null` | no |
| <a name="input_iam"></a> [iam](#input\_iam) | IAM bindings in {ROLE => [MEMBERS]} format. Mutually exclusive with the access\_* variables used for basic roles. | `map(list(string))` | `{}` | no |
| <a name="input_id"></a> [id](#input\_id) | Dataset id. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Dataset location. | `string` | `"europe-west4"` | no |
| <a name="input_offset"></a> [offset](#input\_offset) | The offset to be added to the bigquery dataset | `number` | `1` | no |
| <a name="input_options"></a> [options](#input\_options) | Dataset options. <br> <a name=default\_table\_expiration\_ms:></a>[default\_table\_expiration\_ms:](#default\_table\_expiration\_ms:) The default lifetime of all tables in the dataset, in milliseconds. The minimum value is 3600000 milliseconds (one hour). <br> <a name=default\_partition\_expiration\_ms:></a>[default\_partition\_expiration\_ms:](#default\_partition\_expiration\_ms:) The default partition expiration for all partitioned tables in the dataset, in milliseconds. <br> <a name=delete\_contents\_on\_destroy:></a>[delete\_contents\_on\_destroy:](#delete\_contents\_on\_destroy:) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present. <br> <a name=max\_time\_travel\_hours:></a>[max\_time\_travel\_hours:](#max\_time\_travel\_hours:) Defines the time travel window in hours. The value can be from 48 to 168 hours (2 to 7 days). | <pre>object({<br>    default_table_expiration_ms     = optional(number)<br>    default_partition_expiration_ms = optional(number)<br>    delete_contents_on_destroy      = optional(bool)<br>    max_time_travel_hours           = optional(number)<br>  })</pre> | `{}` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Id of the project where datasets will be created. | `string` | n/a | yes |
| <a name="input_tables"></a> [tables](#input\_tables) | Table definitions. Options and partitioning default to null. Partitioning can only use `range` or `time`, set the unused one to null. The key of the map is the table name. <br> <a name=friendly\_name:></a>[friendly\_name:](#friendly\_name:) A descriptive name for the table. <br> <a name=labels:></a>[labels:](#labels:) A mapping of labels to assign to the resource. <br> <a name=clustering:></a>[clustering:](#clustering:) Specifies column names to use for data clustering. Up to four top-level columns are allowed, and should be specified in descending priority order. <br> <a name=encryption\_key:></a>[encryption\_key:](#encryption\_key:) The self link or full name of a key which should be used to encrypt this table. Note that the default bigquery service account will need to have encrypt/decrypt permissions on this key - you may want to see the google\_bigquery\_default\_service\_account datasource and the google\_kms\_crypto\_key\_iam\_binding resource. <br> <a name=expiration\_time:></a>[expiration\_time:](#expiration\_time:) The time when this table expires, in milliseconds since the epoch. If not present, the table will persist indefinitely. Expired tables will be deleted and their storage reclaimed. <br> <a name=field:></a>[field:](#field:) The field used to determine how to create a time-based partition. If time-based partitioning is enabled without this value, the table is partitioned based on the load time. <br> <a name=end:></a>[end:](#end:) End of the range partitioning, exclusive. <br> <a name=interval:></a>[interval:](#interval:) The width of each range within the partition. <br> <a name=start:></a>[start:](#start:) Start of the range partitioning, inclusive. <br> <a name=expiration\_ms:></a>[expiration\_ms:](#expiration\_ms:) Number of milliseconds for which to keep the storage for a partition. <br> <a name=type:></a>[type:](#type:) The supported types are DAY, HOUR, MONTH, and YEAR, which will generate one partition per day, hour, month, and year, respectively. <br> <a name=schema:></a>[schema:](#schema:) A JSON schema for the table. <br> <a name=deletion\_protection:></a>[deletion\_protection:](#deletion\_protection:) Whether or not to allow Terraform to destroy the instance. Unless this field is set to false in Terraform state, a terraform destroy or terraform apply that would delete the instance will fail. | <pre>map(object({<br>    friendly_name = string<br>    labels        = optional(map(string))<br>    options = optional(object({<br>      clustering      = optional(list(string))<br>      encryption_key  = string<br>      expiration_time = optional(number)<br>    }))<br>    partitioning = optional(object({<br>      field = optional(string)<br>      range = optional(object({<br>        end      = number<br>        interval = number<br>        start    = number<br>      }))<br>      time = optional(object({<br>        expiration_ms = number<br>        type          = string<br>      }))<br>    }))<br>    schema              = optional(string)<br>    deletion_protection = optional(bool)<br>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | n/a | yes |
| <a name="input_views"></a> [views](#input\_views) | View definitions. <br> <a name=friendly\_name:></a>[friendly\_name:](#friendly\_name:) A descriptive name for the table. <br> <a name=labels:></a>[labels:](#labels:) A mapping of labels to assign to the resource. <br> <a name=query:></a>[query:](#query:) A query that BigQuery executes when the view is referenced. <br> <a name=use\_legacy\_sql:></a>[use\_legacy\_sql:](#use\_legacy\_sql:) Specifies whether to use BigQuery's legacy SQL for this view. The default value is true. If set to false, the view will use BigQuery's standard SQL. <br> <a name=deletion\_protection:></a>[deletion\_protection:](#deletion\_protection:) Whether or not to allow Terraform to destroy the instance. Unless this field is set to false in Terraform state, a terraform destroy or terraform apply that would delete the instance will fail. | <pre>map(object({<br>    friendly_name       = string<br>    labels              = optional(map(string))<br>    query               = string<br>    use_legacy_sql      = bool<br>    deletion_protection = optional(bool)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dataset"></a> [dataset](#output\_dataset) | Dataset resource. |
| <a name="output_dataset_id"></a> [dataset\_id](#output\_dataset\_id) | Dataset id. |
| <a name="output_id"></a> [id](#output\_id) | Fully qualified dataset id. |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | Dataset self link. |
| <a name="output_table_ids"></a> [table\_ids](#output\_table\_ids) | Map of fully qualified table ids keyed by table ids. |
| <a name="output_tables"></a> [tables](#output\_tables) | Table resources. |
| <a name="output_view_ids"></a> [view\_ids](#output\_view\_ids) | Map of fully qualified view ids keyed by view ids. |
| <a name="output_views"></a> [views](#output\_views) | View resources. |
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
