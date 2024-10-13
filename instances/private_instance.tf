resource "aws_instance" "private_instance" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id                   = var.private_subnet_ids[0]
  vpc_security_group_ids      = [aws_security_group.private_instance.id]
  associate_public_ip_address = false

  tags = merge(
    local.common_tags,
    {
      Name = "private-instance"
    }
  )
}
