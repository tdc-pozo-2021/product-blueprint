variable "project_name" {
  type = string
}

variable "private_subnets_config" {
  type = list(object({
    cidr_block = string
    az         = string
  }))
}

variable "default_tags" {
  type = map
}

variable "vpc_cidr" {
    type = string
}