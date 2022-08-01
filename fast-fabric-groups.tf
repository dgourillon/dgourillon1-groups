
module "group_organization-admins" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"

  id           = "gcp-organization-admins@dgourillon1.joonix.net"
  display_name = "gcp-organization-admins"
  description  = "gcp-organization-admins"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "dgourillon1.joonix.net"
  members      = ["dgourillon-aliases@dgourillon1.joonix.net"]
}

resource "googleworkspace_user" "dwight" {
  primary_email = "test@dgourillon1.joonix.net"
  password      = "testpassword"

  name {
    family_name = "test"
    given_name  = "test"
  }

  recovery_email = "dgourillon@google.com"
}


module "group_gcp-devops" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"

  id           = "gcp-gcp-devops@dgourillon1.joonix.net"
  display_name = "gcp-gcp-devops"
  description  = "gcp-gcp-devops"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "dgourillon1.joonix.net"
  members      = ["dgourillon-aliases@dgourillon1.joonix.net"]
}

 module "group_network-admins" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"

  id           = "gcp-network-admins@dgourillon1.joonix.net"
  display_name = "gcp-network-admins"
  description  = "gcp-network-admins"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "dgourillon1.joonix.net"
  members      = ["dgourillon-aliases@dgourillon1.joonix.net"]
}

module "group_security-admins" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"

  id           = "gcp-security-admins@dgourillon1.joonix.net"
  display_name = "gcp-security-admins"
  description  = "gcp-security-admins"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "dgourillon1.joonix.net"
  members      = ["dgourillon-aliases@dgourillon1.joonix.net"]
}

module "group_support" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"

  id           = "gcp-support@dgourillon1.joonix.net"
  display_name = "gcp-support"
  description  = "gcp-support"
  owners       = ["tf-cloud-sa@ci-groups-dgo1.iam.gserviceaccount.com"]
  domain       = "dgourillon1.joonix.net"
  members      = ["dgourillon-aliases@dgourillon1.joonix.net"]
}
