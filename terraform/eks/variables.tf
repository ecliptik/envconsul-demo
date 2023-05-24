# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_type" {
  description = "AMI type to use"
  default     = "AL2_ARM_64"
}

variable "eks_version" {
  description = "EKS Version"
  default     = "1.22"
}
