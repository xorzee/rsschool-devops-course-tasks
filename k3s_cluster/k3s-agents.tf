resource "aws_instance" "k3s_worker" {
  count                  = var.worker_node_instance_count
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.worker_node_instance_type
  subnet_id              = var.private_subnet_ids[count.index % length(var.private_subnet_ids)]
  vpc_security_group_ids = [aws_security_group.k3s.id]
  key_name               = var.key_name

  iam_instance_profile        = aws_iam_instance_profile.k3s_profile.name
  user_data                   = data.cloudinit_config.k3s_worker.rendered
  user_data_replace_on_change = true

  depends_on = [aws_instance.k3s_server]

  tags = {
    Name = "k3s-worker-${count.index + 1}"
  }
}
