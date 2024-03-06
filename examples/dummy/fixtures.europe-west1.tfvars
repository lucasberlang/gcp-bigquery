
id = "dtnml3"

offset = 1

access_identities = {
  "test2" = "lucas.calvo@caixabankpre.com",
  "test1" = "javier.perez@caixabankpre.com"
}

options = {
  max_time_travel_hours = 72
}

access = {
  "test1" = {
    role = "OWNER"
    type = "user"
  },
  "test2" = {
    role = "READER"
    type = "user"
  }
}

tables = {
  "table-dummy" = {
    friendly_name = "gcp"
    labels = {
      "team"   = "ds1",
      "system" = "fin",
    }
    schema              = <<EOF
        [
          {
            "name": "permalink",
            "type": "STRING",
            "mode": "NULLABLE",
            "description": "The Permalink"
          },
          {
            "name": "state",
            "type": "STRING",
            "mode": "NULLABLE",
            "description": "State where the head office is located"
          }
        ]
        EOF
    deletion_protection = false
  },
}

project_id = "agl-sec-segcld-pre-00"

######
# Tags
######

tags = {
  "provider"                = "go",
  "region"                  = "euw1",
  "enterprise"              = "cxb",
  "account"                 = "poc",
  "system"                  = "tst"
  "environment"             = "poc",
  "cmdb_name"               = "",
  "security_exposure_level" = "mz",
  "status"                  = "",
  "on_service"              = "yes",
}
