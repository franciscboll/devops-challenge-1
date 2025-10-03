terraform {
  backend "s3" {
    bucket         = "tf-state-as-challenge-fran-us-east-1-20251003043217929400000001"  # Nombre real del bucket
    key            = "global/s3/terraform.tfstate"           
    region         = "us-east-1"
    encrypt        = true
    # dynamodb_table = "terraform-locks"                       # (opcional pero recomendado para locking)
  }
}