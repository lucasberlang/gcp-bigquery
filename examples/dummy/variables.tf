
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

variable "id" {
  description = "Dataset id."
  type        = string
}

variable "offset" {
  description = "The offset to be added to the bigquery dataset"
  type        = number
  default     = 1
}

variable "access" {
  description = "Map of access rules with role and identity type. Keys are arbitrary and must match those in the `access_identities` or `access_identities_views` variable. \n <a name=role:></a>[role:](#role:) Describes the rights granted to the user specified by the other member of the access object. Basic, predefined, and custom roles are supported. Predefined roles that have equivalent basic roles are swapped by the API to their basic counterparts. \n <a name=type:></a>[type:](#type:) Type of access to dataset, possible values are: `domain`, `group`, `special_group`, `user`, `view`."
  type = map(object({
    role = string
    type = string
  }))
  validation {
    condition = can([
      for k, v in var.access :
      index(["domain", "group", "special_group", "user", "view"], v.type)
    ])
    error_message = "Access type must be one of 'domain', 'group', 'special_group', 'user', 'view'."
  }
}

variable "access_identities" {
  description = "Map of access identities used for basic access roles. Identities have the following format: \n <a name=domain:></a>[domain:](#domain:) A domain to grant access to. Any users signed in with the domain specified will be granted the specified access. \n <a name=group_by_email:></a>[group_by_email:](#group_by_email:) An email address of a Google Group to grant access to. \n <a name=special_group:></a>[special_group:](#special_group:)A special group to grant access to. Possible values include: \n - projectOwners: Owners of the enclosing project. \n - projectReaders: Readers of the enclosing project. \n - projectWriters: Writers of the enclosing project. \n - allAuthenticatedUsers: All authenticated BigQuery users. \n <a name=user_by_email:></a>[user_by_email:](#user_by_email:) An email address of a user to grant access to. For example: fred@example.com"
  type        = map(string)
}

variable "options" {
  description = "Dataset options. \n <a name=default_table_expiration_ms:></a>[default_table_expiration_ms:](#default_table_expiration_ms:) The default lifetime of all tables in the dataset, in milliseconds. The minimum value is 3600000 milliseconds (one hour). \n <a name=default_partition_expiration_ms:></a>[default_partition_expiration_ms:](#default_partition_expiration_ms:) The default partition expiration for all partitioned tables in the dataset, in milliseconds. \n <a name=delete_contents_on_destroy:></a>[delete_contents_on_destroy:](#delete_contents_on_destroy:) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present. \n <a name=max_time_travel_hours:></a>[max_time_travel_hours:](#max_time_travel_hours:) Defines the time travel window in hours. The value can be from 48 to 168 hours (2 to 7 days)."
  type = object({
    default_table_expiration_ms     = optional(number)
    default_partition_expiration_ms = optional(number)
    delete_contents_on_destroy      = optional(bool)
    max_time_travel_hours           = optional(number)
  })
}

######
# google_bigquery_table
######

variable "tables" {
  description = "Table definitions. Options and partitioning default to null. Partitioning can only use `range` or `time`, set the unused one to null. \n <a name=friendly_name:></a>[friendly_name:](#friendly_name:) A descriptive name for the table. \n <a name=labels:></a>[labels:](#labels:) A mapping of labels to assign to the resource. \n <a name=clustering:></a>[clustering:](#clustering:) Specifies column names to use for data clustering. Up to four top-level columns are allowed, and should be specified in descending priority order. \n <a name=encryption_key:></a>[encryption_key:](#encryption_key:) The self link or full name of a key which should be used to encrypt this table. Note that the default bigquery service account will need to have encrypt/decrypt permissions on this key - you may want to see the google_bigquery_default_service_account datasource and the google_kms_crypto_key_iam_binding resource. \n <a name=expiration_time:></a>[expiration_time:](#expiration_time:) The time when this table expires, in milliseconds since the epoch. If not present, the table will persist indefinitely. Expired tables will be deleted and their storage reclaimed. \n <a name=field:></a>[field:](#field:) The field used to determine how to create a time-based partition. If time-based partitioning is enabled without this value, the table is partitioned based on the load time. \n <a name=end:></a>[end:](#end:) End of the range partitioning, exclusive. \n <a name=interval:></a>[interval:](#interval:) The width of each range within the partition. \n <a name=start:></a>[start:](#start:) Start of the range partitioning, inclusive. \n <a name=expiration_ms:></a>[expiration_ms:](#expiration_ms:) Number of milliseconds for which to keep the storage for a partition. \n <a name=type:></a>[type:](#type:) The supported types are DAY, HOUR, MONTH, and YEAR, which will generate one partition per day, hour, month, and year, respectively. \n <a name=schema:></a>[schema:](#schema:) A JSON schema for the table. \n <a name=deletion_protection:></a>[deletion_protection:](#deletion_protection:) Whether or not to allow Terraform to destroy the instance. Unless this field is set to false in Terraform state, a terraform destroy or terraform apply that would delete the instance will fail."
  type = map(object({
    friendly_name = string
    labels        = optional(map(string))
    options = optional(object({
      clustering      = optional(list(string))
      encryption_key  = string
      expiration_time = optional(number)
    }))
    partitioning = optional(object({
      field = optional(string)
      range = optional(object({
        end      = number
        interval = number
        start    = number
      }))
      time = optional(object({
        expiration_ms = number
        type          = string
      }))
    }))
    schema              = optional(string)
    deletion_protection = optional(bool)
  }))
  default = {}
}

######
# Tags
######

variable "tags" {
  description = "fixture"
  type        = map(string)
}
