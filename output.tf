
output "aws_vpc_ip"{
	value = aws_vpc.web_vpc.id
}
output "aws_security_group_id"{
	value = aws_security_group.web_allow_http_ssh.id
}
