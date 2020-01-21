terraform {
  required_providers {
    digitalocean = "~> 1.12"
  }
  backend "s3" {
    encrypt = true
    bucket  = "hoomans.ye11ow.space"
    region  = "eu-west-1"
    key     = "provision/do.tfstate"
  }
}