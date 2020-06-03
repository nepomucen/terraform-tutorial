terraform {
  backend "s3" {
    bucket = "tf-state-nepomucen" # name of bucket in which we want to store data
    key    = "k8s-on-premise-state" # this is path were state will be stored inside bucket
    region = "eu-central-1" # region in which bucket exists does NOT need to be the same as in provider
    # profile = "xxxxx" # optional, profile which has access to s3 bucket, usually the same as in provider.tf
  }
}

