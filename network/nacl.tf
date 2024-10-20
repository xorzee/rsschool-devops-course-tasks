resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-nacl"
  }
}

resource "aws_network_acl_association" "main" {
  count          = length(aws_subnet.public) + length(aws_subnet.private)
  network_acl_id = aws_network_acl.main.id
  # `element(concat(public_ids, private_ids), i)` py equiv `[*public_ids, *private_ids][i]`
  subnet_id = element(concat(aws_subnet.public[*].id, aws_subnet.private[*].id), count.index)
}

resource "aws_network_acl_rule" "ingress" {
  network_acl_id = aws_network_acl.main.id
  rule_number    = 100
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "egress" {
  network_acl_id = aws_network_acl.main.id
  rule_number    = 100
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}
