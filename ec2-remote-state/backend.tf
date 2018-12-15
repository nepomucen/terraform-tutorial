terraform {
  backend "s3" {
    bucket = "terraform-state-pj-test-bucket" # name of bucket in which we want to store data
    key    = "ec2-remote-state-test" # this is path were state will be stored inside bucket
    region = "us-east-1" # region in which bucket exists does NOT need to be the same as in provider
    # profile = "xxxxx" # optional, profile which has access to s3 bucket, usually the same as in provider.tf
  }
}

