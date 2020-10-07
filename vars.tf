
variable "LT_name" {
  type = string
}

variable "ASG_name" {
  type = string
}

variable "SG_name" {
  type = string
}

variable "SG_CIDR_block" {
  type = list(string)
}

variable "ASG_Locations" {
  type = list(string)
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "tags" {
  type = map(string)
  description = "Tags"
}

variable "location" {
  type = string
}