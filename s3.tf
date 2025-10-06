module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  bucket_prefix = "storage-${var.project_name}-${var.aws_region}-" 
  force_destroy = true

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  tags = {
    Project     = "as-challenge-fran"
    Environment = "dev"
    Purpose     = "storage"
    Owner       = "fran"
  }
}