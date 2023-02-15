# resource "aws_s3_bucket" "b" {
#   bucket = "my-tf-test-bucket"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.b.id
#   acl    = "private"
# }

# Configure the AWS Provider
  
variable "s3_bucket_names" {
  type = list
  default = ["dev-bucket.app", "uat-bucket.app", "prod-bucket.app"]
}

resource "aws_s3_bucket" "rugged_buckets" {
  count         = length(var.s3_bucket_names) //count will be 3
  bucket        = var.s3_bucket_names[count.index]
  acl           = "private"
  region        = "us-east-1"
  force_destroy = true
  tags = {
  Owner = "stackguardian"
  }
}
