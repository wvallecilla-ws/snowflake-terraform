terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "ifocux"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
  /* alias            = "sysadmin"
  username         = var.snowflake_username
  account          = var.snowflake_account
  region           = var.snowflake_region
  private_key_path = var.snowflake_private_key_path
  role             = "SYSADMIN" */
}

resource "snowflake_database" "demo_db" {
  /* provider = snowflake.sysadmin */
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
