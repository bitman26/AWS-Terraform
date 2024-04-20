output "aws_eip" {
    value = data.aws_eip.eip_terraform-ec2.public_ip
}
