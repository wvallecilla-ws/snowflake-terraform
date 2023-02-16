terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.31.0"
    }
  }
}

provider "snowflake" {
  alias = "terraform"
  role  = "ACCOUNTADMIN"
}


resource "snowflake_database" "TF_DEMO" {
  provider                    = snowflake.terraform
  name                        = "TF_DEMO"
  comment                     = "Terraform Test"
  data_retention_time_in_days = 1
}
