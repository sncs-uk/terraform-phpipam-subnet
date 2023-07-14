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

variable address_count {
  type        = number
  description = "The number of addresses to create in the new subnet."
  default     = 0
}
variable address_description {
  type        = list(string)
  description = "Descriptions of the addresses that are to be created."
  default     = []
}
variable address_hostname {
  type        = list(string)
  description = "Hostnames of the addresses that are to be created."
  default     = []
}
