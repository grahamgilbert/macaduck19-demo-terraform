resource "aws_iam_user" "macaduck19" {
  name          = "macaduck19"
  force_destroy = true
}

resource "aws_iam_policy_attachment" "macaduck19" {
  name       = "macaduck19"
  users      = ["${aws_iam_user.macaduck19.name}"]
  policy_arn = "${aws_iam_policy.macaduck19.arn}"
}

resource "aws_iam_policy" "macaduck19" {
  name = "macaduck19"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
          "Effect": "Allow",
          "Action": [
            "s3:List*",
            "s3:Get*"
          ],
          "Resource": "arn:aws:s3:::macaduck19"
        },
        {
          "Effect": "Allow",
          "Action": [
            "s3:Get*",
            "s3:Put*",
            "s3:Delete*",
            "s3:ListBucket",
            "s3:RestoreObject",
            "s3:AbortMultipartUpload",
            "s3:ListMultipartUploadParts",
            "s3:PutObject"
          ],
          "Resource": [
            "arn:aws:s3:::macaduck19/*"
          ]
        }
    ]
}
EOF
}
