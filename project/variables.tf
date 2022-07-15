variable "billing_account_id" {
  type        = string
  description = "Billing account ID"
}

variable "folder_id" {
  type        = string
  description = "folder ID"
}

variable "projects" {
  type        = list
  description = "Project names"
}

variable "parent_folder" {
  type        = string
  description = "Parent folder"
}

variable "environment" {
  type        = list
  description = "environment"
}