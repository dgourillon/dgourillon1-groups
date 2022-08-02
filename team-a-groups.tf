locals {

  group_list_team_a = ["gcp-team-a","gcp-team-a-admin"]

}

module "team_a_groups" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"
  for_each = toset(local.group_list_team_a)

  id           = "${each.key}@dgourillon1.joonix.net"
  display_name = "${each.key}"
  description  = "${each.key}"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "dgourillon1.joonix.net"
  members      = ["dgourillon-aliases@dgourillon1.joonix.net","${each.key}-user@dgourillon1.joonix.net"]
  depends_on = [
    googleworkspace_user.team_a_users
  ]
}

resource "googleworkspace_user" "team_a_users" {
  for_each = toset(local.group_list_team_a)
  primary_email = "${each.key}-user@dgourillon1.joonix.net"
  password      = var.default_password

  name {
    family_name = "${each.key}"
    given_name  = "${each.key}"
  }

  recovery_email = "dgourillon@google.com"
}

