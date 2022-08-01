
module "group" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.4"

  id           = "testterraform@dgourillon1.joonix.net"
  display_name = "testterraform"
  description  = "testterraform"
  domain       = "dgourillon1.joonix.net"
  members      = ["dgourillon@dgourillon1.joonix.net"]
}
