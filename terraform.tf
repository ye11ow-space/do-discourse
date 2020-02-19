terraform {
  required_providers {
    digitalocean = "~> 1.12"
  }
 backend "s3" {
   encrypt = true
   region  = "eu-west-1"
   bucket  = "hoomans.ye11ow.space"
   key     = "provision/do.tfstate"
 }
}