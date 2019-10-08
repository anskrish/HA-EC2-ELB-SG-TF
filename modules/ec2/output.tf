output "Instance_id" {
  value = ["${aws_instance.instance1.*.id}"]
}

output "privateIds" {
  value = ["${aws_instance.instance1.*.private_ip}"]
}
output "Security_Group_Id" {
  value = "${aws_security_group.Trend_ftp_sg.id}"
}

