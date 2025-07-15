output "ec2_public_ip"{
  value = aws_instance.TF-ec.public_ip
}

output "ec2_public_dns"{
  value = aws_instance.TF-ec.private_dns
}

output "ec2_private_ip"{
  value = [
    for id in aws_instance.TF-ec : id.private_ip
  ]
}
output "ec2_instance_id" {
  value ={
    for id in aws_instance.TF-ec : id => {
      instance_id = id.id
      public_ip   = id.public_ip
      private_ip  = id.private_ip
      public_dns  = id.public_dns
      private_dns = id.private_dns
    }
  } 
}