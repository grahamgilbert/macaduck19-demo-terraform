resource "aws_s3_bucket" "macaduck19" {
  bucket = "macaduck19"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags {
    Name = "macaduck19"
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "delete-after-90-days"
    prefix  = ""
    enabled = true

    expiration {
      days = 90
    }
  }
}
