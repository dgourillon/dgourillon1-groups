
module "group_team-a" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"

  id           = "team-a@dgourillon1.joonix.net"
  display_name = "team-a"
  description  = "team-a"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "dgourillon1.joonix.net"
  members      = ["dgourillon-aliases@dgourillon1.joonix.net"]
}

resource "googleworkspace_user" "team-a-user" {
  primary_email = "fast-org-admin@dgourillon1.joonix.net"
  password      = var.default_password

  name {
    family_name = "team-a"
    given_name  = "team-a"
  }

  recovery_email = "dgourillon@google.com"
}


module "group-team-a-admin" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"

  id           = "team-a-admin@dgourillon1.joonix.net"
  display_name = "team-a-admin"
  description  = "team-a-admin"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "dgourillon1.joonix.net"
  members      = ["dgourillon-aliases@dgourillon1.joonix.net"]
}

resource "googleworkspace_user" "team-a-admin-user" {
  primary_email = "team-a-admin-user@dgourillon1.joonix.net"
  password      = var.default_password

  name {
    family_name = "team-a-admin-user"
    given_name  = "team-a-admin-user"
  }

  recovery_email = "dgourillon@google.com"
}

