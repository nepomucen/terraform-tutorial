
// Each region has different image ids that is why we are using
// "data" to read most reecent ubuntu image in given region
data aws_ami ubuntu {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] // This value comes from AWS docs they always use it as owner of their images
}

// here we are starting aws ec2 instance of type t2.micro
// base ami is provided by value found in aws_ami.ubuntu
resource aws_instance web {
  // Reference to variable defnied in varaibles.tf file
  count = "${var.ec2_count}"
  // notice that we are refernicg data resource with "data" prefix
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = "${var.tags}"
}
