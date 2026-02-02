variable "ec2_instances" {
  type = map(object({
    instance_type = string
  }))

  default = {
    ec2_1 = {
      instance_type = "t2.micro"
    }
    ec2_2 = {
      instance_type = "t2.micro"
    }
  }
}
