resource "aws_instance" "k3s_server" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.master_node_instance_type
  subnet_id                   = var.private_subnet_ids[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.k3s.id]
  key_name                    = var.key_name

  iam_instance_profile        = aws_iam_instance_profile.k3s_profile.name
  user_data                   = data.cloudinit_config.k3s_server.rendered
  user_data_replace_on_change = true

  tags = {
    Name = "k3s-master"
  }
}