resource "aws_instance" "public_instances" {
  count = length(var.public_subnet_ids)

  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id                   = var.public_subnet_ids[count.index]
  vpc_security_group_ids      = [aws_security_group.public_instance.id]
  associate_public_ip_address = true

  tags = {
    Name = "public-instance-${count.index}"
  }
}
