variable "Trend_FTP_server_count" {
description = "server count"
default     = ""
}
variable "vpc_id" {
description = "vpc-id"
default     = ""
}
variable "elb_name" {
description = "elb name"
default     = ""
}
variable "availability_zones" {
description = "availability_zones"
default     = [""]
}
variable "ami" {
description = "ami-id"
default     = ""
}
variable "instance_type" {
description = "Instance type"
default     = ""
}
variable "volume_type" {
description = "volume_type"
default     = ""
}
variable "key_name" {
description = "trend-ftp key"
default     = ""
}
variable "volume_size" {
description = "volume_size"
default     = ""
}
variable "sg" {
description = "sg_id"
default     = [""]
}
variable "cross_zone_load_balancing" {
description = "cross_zone_load_balancing"
default     = ""
}
variable "idle_timeout" {
description = "idle_timeout"
default     = "" 
}

variable "connection_draining" {
description = "connection_draining"
default     = ""
}

variable "security_group_name" {
  description = "Security group name"
}

variable "security_group_desc" {
  description = "Security group Description"
}

variable "security_group_tag" {
  description = "Security group tag"
}

variable "security_groups" {
  type        = "list"
  description = "Security groups"
}
