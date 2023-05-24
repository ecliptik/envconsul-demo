output "instance_ami" {
  value = aws_instance.vault-demo.ami
}

output "instance_arn" {
  value = aws_instance.vault-demo.arn
}

output "private_ip" {
  value = aws_instance.vault-demo.private_dns
}

output "public_ip" {
  value = aws_instance.vault-demo.public_ip
}
