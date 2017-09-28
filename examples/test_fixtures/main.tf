terraform {
  required_version = "~> 0.10.6"
}

provider "aws" {
  region  = "${var.region}"
  version = "1.0.0"
}

# module "vpc" {
#   source             = "terraform-aws-modules/vpc/aws"
#   name               = "my-vpc"
#   cidr               = "10.0.0.0/16"
#   private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
#   enable_nat_gateway = "false"
#   azs                = ["us-west-2a", "us-west-2b", "us-west-2c"]
# }

module "main" {
  source = "../../.."
  region = "${var.region}"

  tags {
    "Terraform" = "true"
    "Env"       = "${terraform.workspace}"
  }
}
