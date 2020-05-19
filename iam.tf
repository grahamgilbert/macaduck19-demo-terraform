resource "aws_iam_user" "practicalcicd" {
  name          = "practicalcicd"
  force_destroy = true
}

resource "aws_iam_policy_attachment" "practicalcicd" {
  name       = "practicalcicd"
  users      = ["${aws_iam_user.practicalcicd.name}"]
  policy_arn = "${aws_iam_policy.practicalcicd.arn}"
}

resource "aws_iam_policy" "practicalcicd" {
  name = "practicalcicd"

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
          "Resource": "arn:aws:s3:::practicalcicd"
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
            "arn:aws:s3:::practicalcicd/*"
          ]
        }
    ]
}
EOF
}
