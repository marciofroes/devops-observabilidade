terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "ciclosoft"

    workspaces {
      name = "marciolabs"
    }
  }
}