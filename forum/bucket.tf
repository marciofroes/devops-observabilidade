
resource "aws_s3_bucket" "labtestemaq4" {
  bucket = "bucketdev04"
  
  tags = {
    Name        = "bucketdev04"
  }
}