
provider "aws" {
 region  = var.region
  version = "~> 4.0"
}
provider "aws" {
  alias = "us-1"
  region  = "us-east-1"
  version = "~> 4.0"
}

provider "aws" {
  alias = "us-2"
  region  = "us-east-2"
  version = "~> 4.0"
}
