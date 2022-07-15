# Generate a random suffix to associate for project IDs to avoid conflicts
resource "random_id" "this" {
  for_each = var.projects
  byte_length = 2
}


local {
    projects = [var.projects]
    environments =[var.environment]

    projects_environments = distinct(flatten([
    for projects in local.projects : [
      for environments in local.environments : {
        projects        = projects
        environments    = environments
      }
    ]
  ]))
}

resource "google_project" "my_project-in-a-folder" {
  for_each   = { for entry in local.projects_environments: "${entry.projects}.${entry.environments}" => entry }
  name       = "${each.value.environments}-${each.value.projects}-${var.parent_folder}"
  project_id = replace(format("%s-%s", replace(lower(each.value["name"]), " ", "-"), random_id.this[each.key].hex), "/-+/", "-")
  folder_id  = split("/", var.folder_id)[1]
  billing_account  = var.billing_account_id
  auto_create_network = false
}