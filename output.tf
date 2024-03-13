output "websiteendpoint" {
  value = "http://${aws_s3_bucket.MyCvBucket.bucket}.s3-website.eu-west-3.amazonaws.com"
}
