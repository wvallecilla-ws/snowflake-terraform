locals {
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }

  databases = ["T_SANDBOX", "T_STAGING", "T_MANAGED"]
  schemas   = ["RAW", "RAW_CLEANSED", "SELFSERVICE"]

  /* dic_databases = {
    test_db_sandbox = "TEST_SANDBOX"
    test_db_staging = "TEST_STAGING"
    test_db_managed = "TEST_MANAGED"
  }*/
}
