resource "snowflake_database" "db_sandbox" {
  provider = snowflake.sysadmin
  name     = "SANDBOX"
}

resource "snowflake_database" "db_staging" {
  provider = snowflake.sysadmin
  name     = "STAGING"
}

resource "snowflake_database" "db_managed" {
  provider = snowflake.sysadmin
  name     = "MANAGED"
}

resource "snowflake_schema" "schema_sandbox_raw" {
  provider   = snowflake.sysadmin
  database   = snowflake_database.db_sandbox.name
  name       = "RAW"
  is_managed = false
}

resource "snowflake_schema" "schema_sandbox_raw_cleansed" {
  provider   = snowflake.sysadmin
  database   = snowflake_database.db_sandbox.name
  name       = "RAW_CLEANSED"
  is_managed = false
}

resource "snowflake_schema" "schema_sandbox_selfservice" {
  provider   = snowflake.sysadmin
  database   = snowflake_database.db_sandbox.name
  name       = "SELFSERVICE"
  is_managed = false
}


# Using dynamic
/* resource "snowflake_database" "db_dynamic" {
  count    = 3
  provider = snowflake.sysadmin
  name     = "DYNAMIC-${count.index}"
} */

resource "snowflake_database" "db_dynamic" {
  for_each = {
    "db_sandbox" = "W_SANDBOX"
    "db_staging" = "W_STAGING"
    "db_managed" = "W_MANAGED"
  }
  provider = snowflake.sysadmin
  name     = each.value
}

resource "snowflake_schema" "schema_dynamic_sandbox" {
  for_each = {
    "schema_raw"          = "RAW"
    "schema_raw_cleansed" = "RAW_CLEANSED"
    "schema_selfservice"  = "SELFSERVICE"
  }
  provider   = snowflake.sysadmin
  database   = snowflake_database.db_dynamic["db_sandbox"].name
  name       = each.value
  is_managed = false
}

resource "snowflake_schema" "schema_dynamic_staging" {
  for_each = {
    "schema_raw"          = "RAW"
    "schema_raw_cleansed" = "RAW_CLEANSED"
    "schema_selfservice"  = "SELFSERVICE"
  }
  provider   = snowflake.sysadmin
  database   = snowflake_database.db_dynamic["db_staging"].name
  name       = each.value
  is_managed = false
}


resource "snowflake_schema" "schema_dynamic_managed" {
  for_each = {
    "schema_raw"          = "RAW"
    "schema_raw_cleansed" = "RAW_CLEANSED"
    "schema_selfservice"  = "SELFSERVICE"
  }
  provider   = snowflake.sysadmin
  database   = snowflake_database.db_dynamic["db_managed"].name
  name       = each.value
  is_managed = false
}