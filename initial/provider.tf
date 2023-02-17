terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.56.3"
    }
    snowsql = {
      source  = "aidanmelen/snowsql"
      version = ">= 0.1.0"
    }
  }
}

provider "snowflake" {
  alias            = "securityadmin"
  username         = var.snowflake_username
  account          = var.snowflake_account
  region           = var.snowflake_region
  private_key_path = var.snowflake_private_key_path
  role             = "SECURITYADMIN"
}

provider "snowflake" {
  alias            = "useradmin"
  username         = var.snowflake_username
  account          = var.snowflake_account
  region           = var.snowflake_region
  private_key_path = var.snowflake_private_key_path
  role             = "USERADMIN"
}

provider "snowflake" {
  alias            = "sysadmin"
  username         = var.snowflake_username
  account          = var.snowflake_account
  region           = var.snowflake_region
  private_key_path = var.snowflake_private_key_path
  role             = "SYSADMIN"
}

provider "snowsql" {
  alias            = "securityadmin"
  username         = var.snowflake_username
  account          = var.snowflake_account
  region           = var.snowflake_region
  private_key_path = var.snowflake_private_key_path
  role             = "SECURITYADMIN"
  warehouse        = "COMPUTE_WH"
}
