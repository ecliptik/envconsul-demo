variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI"
  default     = "ami-08fc6fb8ad2e794bb"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t4g.medium"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "vault-demo"
}

variable "project" {
  description = "demo"
  default     = "vault"
}

variable "ssm_policy_arn" {
  description = "SSM Policy ARN"
  default     = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
