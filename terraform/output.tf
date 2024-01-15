output "aws_eip" {
    value = aws_eip.eip_terraform-ec2.public_ip
}