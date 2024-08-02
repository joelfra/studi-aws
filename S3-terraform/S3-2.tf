resource "aws_s3_bucket" "s3_bucket_2" {
 bucket = "studi-react-replication"
 
 versioning {
    enabled = true
  }
  
  tags = {
    name = "studi-react-replication"
  }
 }

resource "aws_s3_bucket_public_access_block" "s3_bucket_2" {
  bucket = aws_s3_bucket.s3_bucket_2.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_2" {
  bucket = aws_s3_bucket.s3_bucket_2.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy-2" {
  depends_on = [aws_s3_bucket_public_access_block.s3_bucket_2]
  bucket = aws_s3_bucket.s3_bucket_2.id
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "PublicReadGetObject",
          "Effect" : "Allow",
          "Principal" : "*",
          "Action" : "s3:GetObject",
          "Resource" : "arn:aws:s3:::studi-react-replication/*"
      }
    ]
  })
}