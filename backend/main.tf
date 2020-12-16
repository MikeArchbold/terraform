provider "aws" { 
  profile = "personal"
  region = "us-east-1"
}

resource "aws_s3_bucket" backend {
  bucket = "terraform-backend-archie"
  
  lifecycle {
    prevent_destroy = true
  }
  
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  	}
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
	name = "terraform-locks"
	billing_mode = "PAY_PER_REQUEST"
	hash_key = "LockId"

	attribute {
	  name = "LockId"
	  type = "S"
	} 
}

#terraform {
#	backend "s3" {
#		bucket = "terraform-backend-archie"
#		key = "global/s3/terraform.tfstate"
#		region = "us-east-1"
#		dynamodb_table = "terraform-locks"
#		encrypt = true
#	}
#}
