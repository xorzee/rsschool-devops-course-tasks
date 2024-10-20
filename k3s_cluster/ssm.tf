resource "aws_ssm_parameter" "k3s_token" {
  name  = "/k3s_cluster/k3s/token"
  type  = "SecureString"
  value = "..."

  lifecycle {
    ignore_changes = [value]
  }
}