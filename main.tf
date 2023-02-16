terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.56.3"
    }
  }
}

provider "snowflake" {
  role             = "SYSADMIN"
  username         = "tf-snow-win"
  account          = "ex87478.ap-southeast-2" # the Snowflake account identifier
  private_key_path = "C:\\Users\\W74732\\.ssh\\snowflake_tf_snow_key.p8"
}

resource "snowflake_database" "db" {
  name = "TF_DEMO"
}

/* resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "x-small"

  auto_suspend = 60
} */


resource "snowflake_schema" "SELFSERVICE" {
  /* provider = snowflake.sys_admin */
  database = "TF_DEMO"
  name     = "SELFSERVICE"
  comment  = "SelfService Test"
  depends_on = [
    snowflake_database.db
  ]
}
