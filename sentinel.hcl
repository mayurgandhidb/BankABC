policy "allowed-terraform-version" {
  enforcement_level = "soft-mandatory"
}
policy "aws-time" {
  enforcement_level = "hard-mandatory"
}
policy "aws-costing" {
    enforcement_level = "advisory"
}
policy "tags_enforced" {
    enforcement_level = "advisory"
}
