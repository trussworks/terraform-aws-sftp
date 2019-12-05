variable "name" {
  description = "Name of the AWS Transfer Server"
  type        = string
}

variable "iam_role_name" {
  description = "Name of the AWS Transfer Server IAM Role used for logging to CloudWatch Logs"
  type        = string
  default     = "sftp-logging-role"
}

variable "zone_id" {
  description = "Route53 Zone ID of the SFTP Endpoint CNAME record.  Also requires domain_name."
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "Domain name of the SFTP Endpoint as a CNAME record.  Also requires zone_id."
  type        = string
  default     = ""
}
