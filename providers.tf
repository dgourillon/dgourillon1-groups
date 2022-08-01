provider "google-beta" {
  #billing_project       = var.project_id
  project       = "ci-groups-dgo1"
  user_project_override = true
}

provider "googleworkspace" {
  #billing_project       = var.project_id
  customer_id  = var.customer_id

}

