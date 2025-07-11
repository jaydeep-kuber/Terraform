output "ec2_public_ip"{
  value = aws_instance.TF-ec.public_ip
}

output "ec2_public_dns"{
  value = aws_instance.TF-ec.private_dns
}