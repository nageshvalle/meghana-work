variable "name_prefix" {
  description = "The prefix for names of created resources"
  type        = string
  default     = "rds"
}

variable "username" {
  description = "The username"
  type        = string
  default     = "postgres"
}

variable "password" {
  description = "The password for the user"
  type        = string
}

variable "rotation_days" {
  description = "The number of days between rotations. When set to `null` (the default) rotation is not configured."
  type        = number
}

variable "secret_recovery_window_days" {
  description = "The number of days that Secrets Manager waits before deleting a secret"
  type        = number
  default     = 0
}

variable "engine" {
  description = "The database engine type"
  type        = string
  default     = "PostgreSQL"
}

variable "host" {
  description = "The host name of the database instance"
  type        = string
  default     = "database-1.ctm73h7awscg.ap-south-1.rds.amazonaws.com"
}

variable "port" {
  description = "The port number of the database instance"
  type        = number
  default     = 5432
}

variable "db_cluster_identifier" {
  description = "The DB cluster identifier"
  type        = string
  default     = "database-1"
}

variable "db_env" {
  description = "The Production Database"
  type        = string
  default     = "Production"
}

variable "rotation_lambda_handler" {
  description = "An optional lambda handler name; useful integration with for certain layer providers"
  type        = string
  default     = null
}

variable "rotation_lambda_env_variables" {
  description = "Optional environment variables for the rotation lambda; useful for integration with for certain layer providers"
  type        = map(string)
  default     = {}
}

variable "rotation_lambda_policy_jsons" {
  description = "Additional policies to add to the rotation lambda; useful for integration with layer providers"
  type        = list(string)
  default     = []
}

variable "rotation_lambda_layers" {
  description = "Optional layers for the rotation lambda."
  type        = list(string)
  default     = null
}

variable "rotation_lambda_subnet_ids" {
  description = "The VPC subnets that the rotation lambda runs in. Required for secret rotation."
  type        = list(string)
  default     = ["subnet-0daf94b73671e479d", "subnet-029c175d2f74f6a5d", "subnet-0aaad286d3c2209ae"]
}

variable "rotation_lambda_vpc_id" {
  description = "The VPC that the secret rotation lambda runs in. Required for secret rotation."
  type        = string
  default     = "vpc-096cb3d7c483a569c"
}

variable "db_security_group_id" {
  description = "The security group ID for the database. Required for secret rotation."
  type        = string
  default     = "sg-0dc0eed0e08f74f7e"
}

variable "recreate_missing_package" {
  description = "Whether to recreate missing Lambda package if it is missing locally or not"
  type        = bool
  default     = true
}

variable "role_permissions_boundary" {
  description = "Optional permissions boundary for rotation lambda IAM role."
  type        = string
  default     = null
}
