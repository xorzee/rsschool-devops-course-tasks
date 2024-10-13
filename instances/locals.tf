variable "common_tags" {
  description = "Inherited from main at module initialization."
}

locals {
  common_tags = var.common_tags
}
