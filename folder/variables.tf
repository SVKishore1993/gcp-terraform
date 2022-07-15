variable "root_folder_id" {
  type        = number
  description = "Root folder ID"
}

variable "parent_folder" {
  type        = string
  description = "Parent folder name"
}


variable "child_environment" {
  type        = list
  description = "child environment name"
}