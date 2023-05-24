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

variable "ssh_key" {
  description = "SSH key"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDS+hhh3uFLc3W+28TJqcszr4MfdBf82KVDdi/RgyoEwCH+WjjJ/ZKGTiXmWnAGM7r4N21FSK6KdnIuFdEzJSgGHGYA7LjstzAn1KMJ5YpdlFFXmdUifxndj0joWryyyuiDQGrxjlUjOflVAmym1y2eUafF2Zm1wqaf6aRaehcQms0FHok7UZz9bez7DsVlX62VejadKTpg9G/gDBPSVvp1Wixa+Iq0YxgTx3/GRLI6A7cezwJHpPsbeQGkeyxgQxTeEJdDXL84SBT/k3RxgqxHaU9yoO9jz9LmN68SkTVBkdY7/bbdSJM8lPMYCXqDEDri2RrHbQa73+QPxKW55XHQ+ija2dEg1YXPG3wPc+oxUP6UYV3fASyUUjAGZnZAsZLzd6oosBdmwdjndOUk/OsHcOb/FznjV2FPmM6eWNiL5IMG0tbjMAOPVJqTfm6It8y4nsAg1XGU5GswskqpDfWS4B+x1CgRg9uvYP0o1dr+bTnBxFjuubkp04pFKD30sgw/bgav0OuHxpfXmeQCJqCxNa4q03wBCjoRPvul7by+P2u1maTgBt9XSRx6k7ATEI+zmdZVysikufeBdwebX8NAY0n9Ef7/9GMjr+yTkCtO2xCtpAw8lx8M5TdjZH0Kqvwgp/dzcZZmx9064Rddli+0FekjO+mbE5baQ3yEIrqlZQ== cardno:9_698_826"
}
