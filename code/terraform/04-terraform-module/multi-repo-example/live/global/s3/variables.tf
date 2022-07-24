variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default = "terraform-up-and-running-state-822924082960"
}

variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default = "terraform-up-and-running-table-822924082960"
}