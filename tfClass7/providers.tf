provider "aws" {
    region = var.region
    access_key = "AKIASHJMKERUOZ5R4T6W"
    secret_key = "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"
}

terraform {
  cloud {
    organization = "adilet_khasanov"

    workspaces {
      name = "dev-ec2"
    }
  }
}