resource "aws_s3_bucket" "practicalcicd" {
  bucket        = "practicalcicd"
  acl           = "public-read"
  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags {
    Name = "practicalcicd"
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
