variable "snowflake_account" {
  type        = string
  description = "Snowflake account name to connect to, along with the region to which the account belongs"
  default     = "ex87478"
}
variable "snowflake_username" {
  type        = string
  description = "Username to be used to connect to the specified Snowflake account"
  default     = "tf-snow-win"
}
variable "snowflake_private_key_path" {
  type        = string
  description = "Password of the Username being used to connect to the specified Snowflake account"
  default     = "C:\\Users\\W74732\\.ssh\\snowflake_tf_snow_key.p8"
}
variable "snowflake_region" {
  type        = string
  description = "Region of the Snowflake account that is being used."
  default     = "ap-southeast-2"
}

# General
variable "company" {
  type        = string
  description = "Woodside"
  default   = "Woodside"
}
variable "project" {
  type        = string
  description = "Data Technology"
  default   = "Data Technology"
}

variable "billing_code" {
  type        = string
  description = "Billing Code"
  default   = "99887766"
}

