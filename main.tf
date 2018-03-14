//--------------------------------------------------------------------
// Variables




//--------------------------------------------------------------------
// Modules
module "ec2_instance" {
  source  = "app.terraform.io/jgersonorg1/ec2-instance/aws"
  version = "1.0"

  ami = "ami-aa2ea6d0"
  instance_type = "t2.micro"
  name = "Jeremytestec2"
  subnet_id = "${module.vpc.private_subnets}"
  vpc_security_group_ids = "${module.security_group.this_security_group_id}"
}

module "security_group" {
  source  = "app.terraform.io/jgersonorg1/security-group/aws"
  version = "1.0"

  name = "jgsecuritygroup"
  vpc_id = "${module.vpc.vpc_id}"
}

module "vpc" {
  source  = "app.terraform.io/jgersonorg1/vpc/aws"
  version = "1.0"
}