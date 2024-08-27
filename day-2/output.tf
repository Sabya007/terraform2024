output "publicip" {
    value = aws_instance.test.public_ip
    description = "printing the public ip"
  
}

output "privateip" {
    value = aws_instance.test.private_ip
    sensitive = true
  
}
