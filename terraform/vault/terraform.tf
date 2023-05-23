terraform {
  cloud {
    organization = "ecliptik"

    workspaces {
      name = "vault-demo"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
