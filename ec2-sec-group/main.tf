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

// Create securty group which allow traffic from all locations
resource "aws_security_group" "allow_all" {
  name        = "allow_all_123"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
}
