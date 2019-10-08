data "aws_vpc" "Trend_vpc" {
  id = "${var.vpc_id}"
}
data "aws_subnet_ids" "Trend_subnet_ids" {
  vpc_id = "${var.vpc_id}"
}

resource "aws_instance" "instance1" {
  ami             = "${var.ami}"
  count = "${var.Trend_FTP_server_count}"
  subnet_id = "${data.aws_subnet_ids.Trend_subnet_ids.ids[count.index]}"
  instance_type   = "${var.instance_type}"
  root_block_device = {
    volume_type = "${var.volume_type}"
    volume_size = "${var.volume_size}"
  }
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.Trend_ftp_sg.id}"]
  tags {
    Name = "Trend-FTP-${count.index}"
  }
}
resource "aws_elb" "Trend-FTP" {
  name               = "${var.elb_name}"
  availability_zones = ["${var.availability_zones}"]
listener {
    instance_port     = 80
    instance_protocol = "tcp"
    lb_port           = 80
    lb_protocol       = "tcp"
  }
health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 30
  }
instances                   = ["${aws_instance.instance1.*.id}"]
  cross_zone_load_balancing   = "true"
  idle_timeout                = 60
  connection_draining         = "false"
  connection_draining_timeout = 400

  tags = {
    Name = "Trend-FTP-elb"
  }
}
