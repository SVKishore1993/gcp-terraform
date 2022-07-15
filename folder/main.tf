resource "google_folder" "parent_folder" {
  display_name = "fldr-${var.parent_folder}"
  parent       = "folders/${var.root_folder_id}"
}

# Folder nested under another folder.
resource "google_folder" "child_folder" {
  for_each = toset(var.child_environment)
  display_name = "fldr-${each.value}-${var.parent_folder}"
  parent       = google_folder.parent_folder.name
  depends_on = [
    google_folder.parent_folder
  ]
}