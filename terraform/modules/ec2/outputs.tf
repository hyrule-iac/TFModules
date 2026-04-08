output "instance_id" {
  description = "Id of the instance"
  value = aws_instance.instance1.id
}

output "public_ip" {
  description = "Public IP"
  value = aws_instance.instance1.public_ip
}