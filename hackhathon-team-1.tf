locals {

  group_list_team_hackathon = ["gcp-mre-hackathon","gcp-mre-hackathon-admin"]

}

module "team_hackathon_groups" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"
  for_each = toset(local.group_list_team_hackathon)

  id           = "${each.key}@${var.organization.domain}"
  display_name = "${each.key}"
  description  = "${each.key}"
  owners       = ["${var.group_deployment_deployment_sa}"]
  domain       = "${var.organization.domain}"
  members      = [var.default_group_member,"${each.key}-user@${var.organization.domain}"]
  depends_on = [
    googleworkspace_user.team_hackathon_users
  ]
}

resource "googleworkspace_user" "team_hackathon_users" {
  for_each = toset(local.group_list_team_hackathon)
  primary_email = "${each.key}-user@${var.organization.domain}"
  password      = var.default_password

  name {
    family_name = "${each.key}"
    given_name  = "${each.key}"
  }
  suspended = true
  recovery_email = "${var.default_recovery_email}"
}

