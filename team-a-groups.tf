locals {

  group_list = ["gcp-team-a","gcp-team-a-admin"]

}

module "fast_fabric_groups" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"
  for_each = toset(local.group_list)

  id           = "${each.key}@dgourillon1.joonix.net"
  display_name = "${each.key}"
  description  = "${each.key}"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "dgourillon1.joonix.net"
  members      = ["dgourillon-aliases@dgourillon1.joonix.net"]
  depends_on = [
    googleworkspace_user.fast_fabric_users
  ]
}

resource "googleworkspace_user" "fast_fabric_users" {
  for_each = toset(local.group_list)
  primary_email = "${each.key}-user@dgourillon1.joonix.net"
  password      = var.default_password

  name {
    family_name = "${each.key}"
    given_name  = "${each.key}"
  }

  recovery_email = "dgourillon@google.com"
}

