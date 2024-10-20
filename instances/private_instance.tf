resource "aws_instance" "private_instances" {
  count = length(var.private_subnet_ids)

  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id                   = var.private_subnet_ids[count.index]
  vpc_security_group_ids      = [aws_security_group.private_instance.id]
  associate_public_ip_address = false

  tags = {
    Name = "private-instance-${count.index}"
  }
}
