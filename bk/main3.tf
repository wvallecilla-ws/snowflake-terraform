terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.35"
    }
  }
}


provider "snowflake" {
  // required
  username = "tf-snow-win"
  account  = "ex87478.ap-southeast-2" # the Snowflake account identifier
  /* region   = "ap-southeast-2.aws" */

  // optional, exactly one must be set
  /* password               = "..."
  oauth_access_token     = "..."*/
  private_key_path = "C:\\Users\\W74732\\.ssh\\snowflake_tf_snow_key.p8"
  /* private_key            = "..."
  private_key_passphrase = "..."
  oauth_refresh_token    = "..."
  oauth_client_id        = "..."
  oauth_client_secret    = "..."
  oauth_endpoint         = "..."
  oauth_redirect_url     = "..." */

  // optional
  alias = "sys_admin"
  role  = "SYSADMIN"
  /* host      = "..."
  warehouse = "..." */
}

resource "snowflake_database" "TF_DEMO" {
  provider                    = snowflake.sys_admin
  name                        = "TF_DEMO"
  comment                     = "Terraform Test"
  data_retention_time_in_days = 1
}

resource "snowflake_schema" "SELFSERVICE" {
  provider = snowflake.sys_admin
  database = "TF_DEMO"
  name     = "SELFSERVICE"
  comment  = "SelfService Test"
}

/* resource "snowflake_database" "RAW" {
  provider                    = snowflake.sys_admin
  name                        = "RAW"
  comment                     = "RAW DB"
  data_retention_time_in_days = 1
} */

/* 
resource "snowflake_warehouse" "warehouse" {
  provider       = snowflake.sys_admin
  name           = "TF_DEMO_WH"
  warehouse_size = "x-small"
  auto_suspend   = 60
} */
