data "aws_region" "_current_region" {}


data "cloudinit_config" "k3s_server" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/cloud-init.server.yaml", {
      aws_region         = data.aws_region._current_region.name
      ssm_parameter_name = aws_ssm_parameter.k3s_token.name
    })
  }
}

data "cloudinit_config" "k3s_worker" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/cloud-init.worker.yaml", {
      master_ip          = aws_instance.k3s_server.private_ip
      aws_region         = data.aws_region._current_region.name
      server_instance_id = aws_instance.k3s_server.id
      ssm_parameter_name = aws_ssm_parameter.k3s_token.name
    })
  }
}
