output "parent_folder" {
  description = "Contains the resource name"
  value       = google_folder.parent_folder.name
}

output "parent_lifecycle_state" {
  description = "Lifecycle state of the folder"
  value       = google_folder.parent_folder.lifecycle_state
}

output "child_folder" {
  description = "Contains the resource name"
  value       = { for k, v in google_folder.child_folder : k => v.name }
}

output "child_lifecycle_state" {
  description = "Lifecycle state of the folder"
  value       = { for k, v in google_folder.child_folder : k => v.lifecycle_state } 
}