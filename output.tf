output "address_elastic_ip" {
    value = aws_eip.eip_terraform-ec2.id
}