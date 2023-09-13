variable supernet_v4_section_id {
  type        = number
  description = "The Section ID which contains the IPv4 supernet."
}
variable supernet_v4_name {
  type        = string
  description = "The name of the IPv4 supernet."
}
variable subnet_v4_length {
  type        = number
  description = "The length of the netmask for the IPv4 network to create."
  default     = 24
}

variable supernet_v6_section_id {
  type        = number
  description = "The Section ID which contains the IPv6 supernet."
}
variable supernet_v6_name {
  type        = string
  description = "The name of the IPv6 supernet."
}
variable subnet_v6_length {
  type        = number
  description = "The length of the netmask for the IPv6 network to create."
  default     = 64
}

variable subnet_description {
  type        = string
  description = "The description to put on the Subnet within PHPIPAM."
}

variable add_gateway {
  type        = bool
  description = "Whether to create a 'gateway' address at the beginning of the subnet"
  default     = true
}
