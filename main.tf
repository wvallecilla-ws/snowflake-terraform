
resource "snowflake_database" "db" {
  provider = snowflake.sysadmin
  name     = "TF_DEMO_DB"
}

/* resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "x-small"

  auto_suspend = 60
} */


/* resource "snowflake_schema" "SELFSERVICE" {
  provider = snowflake.sysadmin
  database = snowflake_database.db.name
  name     = "SELFSERVICE"
  comment  = "SelfService Test"
  depends_on = [
    snowflake_database.db
  ]
} */

resource "snowflake_schema" "schema" {
  provider   = snowflake.sysadmin
  database   = snowflake_database.db.name
  name       = "TF_DEMO_SCHEMA"
  is_managed = false
}


resource "snowflake_role" "role" {
  provider = snowflake.securityadmin
  name     = "TF_DEMO_SVC_ROLE"
}

resource "snowflake_database_grant" "grant" {
  provider          = snowflake.securityadmin
  database_name     = snowflake_database.db.name
  privilege         = "USAGE"
  roles             = [snowflake_role.role.name]
  with_grant_option = false
}

resource "snowflake_schema_grant" "grant" {
  provider          = snowflake.securityadmin
  database_name     = snowflake_database.db.name
  schema_name       = snowflake_schema.schema.name
  privilege         = "USAGE"
  roles             = [snowflake_role.role.name]
  with_grant_option = false
}

resource "snowflake_warehouse_grant" "grant" {
  provider          = snowflake.securityadmin
  warehouse_name    = "COMPUTE_WH"
  privilege         = "USAGE"
  roles             = [snowflake_role.role.name]
  with_grant_option = false
}

resource "tls_private_key" "svc_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "snowflake_user" "user" {
  provider          = snowflake.securityadmin
  name              = "tf_demo_user"
  default_warehouse = "COMPUTE_WH"
  default_role      = snowflake_role.role.name
  default_namespace = "${snowflake_database.db.name}.${snowflake_schema.schema.name}"
  rsa_public_key    = substr(tls_private_key.svc_key.public_key_pem, 27, 398)
}

resource "snowflake_role_grants" "grants" {
  provider  = snowflake.securityadmin
  role_name = snowflake_role.role.name
  users     = [snowflake_user.user.name]
}
