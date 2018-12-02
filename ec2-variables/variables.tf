variable "ec2_count" {
  default = 2
  description = "defines how many ec2 instances should be created"
}

variable "tags" {
    default = {
        Purpose = "tutorial"
        Repo = "github.com/piotrjaromin/terraform-tutorial"
    }

    description = "tags that will be attached to ec2"
}