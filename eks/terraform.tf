terraform {
  backend "s3" {
    bucket = "getyourownbucket"
    key    = "yourownket.tfstate"
    region = "us-west-2"
  }
}
