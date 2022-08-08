
locals {

  group_list = ["gcp-organization-admins","gcp-devops","gcp-network-admins","gcp-security-admins","gcp-support"]

}

module "fast_fabric_groups" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"
  for_each = toset(local.group_list)

  id           = "${each.key}@${var.organization.domain}"
  display_name = "${each.key}"
  description  = "${each.key}"
  owners       = ["${var.group_deployment_deployment_sa}"]
  domain       = "${var.organization.domain}"
  members      = concat(var.default_group_members,["${each.key}-user@${var.organization.domain}"])
  depends_on = [
    googleworkspace_user.fast_fabric_users
  ]
}

resource "googleworkspace_user" "fast_fabric_users" {
  for_each = toset(local.group_list)
  primary_email = "${each.key}-user@${var.organization.domain}"
  password      = var.default_password

  name {
    family_name = "${each.key}"
    given_name  = "${each.key}"
  }
  suspended = true
  recovery_email = "${var.default_recovery_email}"
}

