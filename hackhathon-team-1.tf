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
 
}

