data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc-name}"]
  }
}

data "aws_subnet_ids" "backend_subnets" {
  filter {
    name   = "tag:Name"
    values = "${var.subnet-names}"
  }

  vpc_id = "${data.aws_vpc.vpc.id}"
}

data "aws_security_group" "sg_expedia" {
  filter {
    name   = "tag:Name"
    values = "${var.security-group-names}"
  }
}
