provider "aws" {  
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "test-trend-ftp-terraform"
    key            = "state-file"
    region = "us-west-2"
    profile = "cp-tst"
  }
}
locals {
  environment = "Trend-FTP-DEMO"
  service     = "Trend-Ftp"
}
