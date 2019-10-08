resource "aws_security_group" "Trend_ftp_sg" {
  name        = "${var.security_group_name}"
  description = "${var.security_group_desc}"
  vpc_id      = "${var.vpc_id}"
  ingress     = ["${var.security_groups}"]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.security_group_tag}"
  }
}

