locals {

  group_list_team_a = ["gcp-team-a","gcp-team-a-admin"]

}

module "team_a_groups" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"
  for_each = toset(local.group_list_team_a)

  id           = "${each.key}@${var.organization.domain}"
  display_name = "${each.key}"
  description  = "${each.key}"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "${var.organization.domain}"
  members      = ["dgourillon-aliases@${var.organization.domain}","${each.key}-user@${var.organization.domain}"]
  depends_on = [
    googleworkspace_user.team_a_users
  ]
}

resource "googleworkspace_user" "team_a_users" {
  for_each = toset(local.group_list_team_a)
  primary_email = "${each.key}-user@${var.organization.domain}"
  password      = var.default_password

  name {
    family_name = "${each.key}"
    given_name  = "${each.key}"
  }
  suspended = true
  recovery_email = "dgourillon@google.com"
}

