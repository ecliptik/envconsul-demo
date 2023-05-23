provider "aws" {
  region = var.region
}

## Attach AmazonSSMManagedInstanceCore IAM role
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "vault" {
  name               = "vault-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "vault" {
  role       = aws_iam_role.vault.name
  policy_arn = var.ssm_policy_arn
}

resource "aws_iam_instance_profile" "vault" {
  name = "ec2_role"
  role = aws_iam_role.vault.name
}

resource "aws_instance" "vault-demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.vault.name

  tags = {
    Name = var.instance_name
    project = var.project
  }
}
