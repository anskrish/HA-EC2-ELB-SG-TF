module "ec2" {
  source = "modules/ec2"
  vpc_id = "vpc-0b74ac6d"
  elb_name = "Trend-FTP"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
  Trend_FTP_server_count = 2
  ami = "ami-09adece633e1ad66d"
  instance_type = "t3.micro"
  volume_type = "gp2"
  key_name = "cp-tst-key"
  volume_size = "25"
  security_groups = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.16.0.0/12", "10.200.200.0/23", "10.3.228.0/22", "10.3.242.0/23", "10.3.236.0/22"]
    description = ""
  },
    {
      from_port   = 23
      to_port     = 23
      protocol    = "tcp"
      cidr_blocks = ["172.16.0.0/12", "10.200.200.0/23", "10.3.228.0/22", "10.3.242.0/23", "10.3.236.0/22"]
      description = ""
    },
  ]

  security_group_name = "${format("%s-%s-SG", local.environment, local.service)}"
  security_group_desc = "Allow HTTP, HTTPS, RDP traffic"
  security_group_tag  = "${format("%s %s Security Group", local.environment, local.service)}"
}
