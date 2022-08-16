

module "team_b_groups" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"
  
  id           = "pso-clearstream@${var.organization.domain}"
  display_name = "pso-clearstream"
  description  = "pso-clearstream"
  owners       = ["${var.group_deployment_deployment_sa}"]
  domain       = "${var.organization.domain}"
  members      = ["elisebailey@google.com","ktchana@google.com","philippfischer@google.com","arturpacan@google.com","marcusroy@google.com","matten@google.com"]
  depends_on = [
    googleworkspace_user.team_b_users
  ]
}

