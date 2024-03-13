# Create S3 bucket
resource "aws_s3_bucket" "MyCvBucket" {
  bucket = var.BucketName
}

resource "aws_s3_bucket_acl" "MyCvBucket" {
  bucket = aws_s3_bucket.MyCvBucket.id
  acl    = "private"
}


resource "aws_s3_bucket_ownership_controls" "MyCvBucket" {
  bucket = aws_s3_bucket.MyCvBucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "MyCvBucket" {
  bucket = aws_s3_bucket.MyCvBucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.MyCvBucket.id
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
  bucket       = aws_s3_bucket.MyCvBucket.id
  key          = "error.html"
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "rayaneee" {
  bucket = aws_s3_bucket.MyCvBucket.id
  key    = "rayane.png"
  source = "rayane.png"
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "rayanee" {
  bucket = aws_s3_bucket.MyCvBucket.id
  key    = "cloudimg.png"
  source = "cloudimg.png"
  acl    = "public-read"
}


resource "aws_s3_bucket_website_configuration" "MyCvBucket" {
  bucket = aws_s3_bucket.MyCvBucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

