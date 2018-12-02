# Terraform tutorial

Repository with basic samples of terraform usage with AWS Provider.

Repository is split into multiple directories with samples of terraform usage.

*** NOTICE ***
Remember to always clean after yourself (`terraform destroy` command) otherwise AWS may charge you for using their resources.

## Basic tutorial with samples of terraform usage

- `ec2` setups ec2, AMI is taken from data resource (it reads list of AMI images from amazon), ret of values is hardcoded
- `ec2-variables` same as `ec2` but adds variables file and possibility to control amount of created ec2's, also prints their ids
- `ec2-sec-group` same as `ec2` but adds security group which is attached to created ec2
- `ec2-remote-state` same as `ec2-variables` but this time state is saved on s3 so many people can collaborate, and file `terraform.tfstate` is no longer created on localhost.

## Running

First `cd` into directory you want to use e.g `cd 01-ec2` and then write:

```bash
terraform int
terraform apply
```

To destroy created resources

```bash
terraform destroy
```
