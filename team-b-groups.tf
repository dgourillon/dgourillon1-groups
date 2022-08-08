locals {

  group_list_team_b = ["gcp-team-b","gcp-team-b-admin"]

}

module "team_b_groups" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"
  for_each = toset(local.group_list_team_b)

  id           = "${each.key}@${var.organization.domain}"
  display_name = "${each.key}"
  description  = "${each.key}"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "${var.organization.domain}"
  members      = ["dgourillon-aliases@${var.organization.domain}","${each.key}-user@${var.organization.domain}"]
  depends_on = [
    googleworkspace_user.team_b_users
  ]
}

resource "googleworkspace_user" "team_b_users" {
  for_each = toset(local.group_list_team_b)
  primary_email = "${each.key}-user@${var.organization.domain}"
  password      = var.default_password

  name {
    family_name = "${each.key}"
    given_name  = "${each.key}"
  }
  suspended = true
  recovery_email = "dgourillon@google.com"
}

