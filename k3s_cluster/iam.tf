resource "aws_iam_role" "k3s_role" {
  name = "k3s_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  role       = aws_iam_role.k3s_role.name
}

resource "aws_iam_instance_profile" "k3s_profile" {
  name = "k3s_profile"
  role = aws_iam_role.k3s_role.name
}
