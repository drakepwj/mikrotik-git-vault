terraform {
  backend "s3" {
    bucket = "git-vault-360166fb"   # your actual bucket from Part 3
    key    = "terraform/state.tfstate"
    region = "us-west-2"
  }
}