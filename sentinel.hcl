module "tfplan-functions" {
  source = "../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
  source = "../common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
  source = "../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "aws-functions" {
  source = "./aws-functions/aws-functions.sentinel"
}

policy "allowed-terraform-version" {
  enforcement_level = "soft-mandatory"
}

policy "restrict-current-ec2-instance-type" {
  source = "./restrict-current-ec2-instance-type.sentinel"
  enforcement_level = "hard-mandatory"
}
