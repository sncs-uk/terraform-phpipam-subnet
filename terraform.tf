terraform {
  required_providers {
    phpipam = {
      source  = "lord-kyron/phpipam"
    }
  }
}

data "phpipam_subnet" "supernet_v4" {
  section_id     = var.supernet_v4_section_id
  description    = var.supernet_v4_name
}

data "phpipam_subnet" "supernet_v6" {
  section_id     = var.supernet_v6_section_id
  description    = var.supernet_v6_name
}

resource "phpipam_first_free_address" "gateway_v4" {
  count         = var.add_gateway ? 1 : 0
  subnet_id     = phpipam_first_free_subnet.subnet_v4.subnet_id
  description   = "Gateway"
  is_gateway    = true

  lifecycle {
    ignore_changes = [
      subnet_id,
    ]
  }
}
resource "phpipam_first_free_address" "network_v6" {
  count         = var.add_gateway ? 1 : 0
  subnet_id     = phpipam_first_free_subnet.subnet_v6.subnet_id
  description   = "Network Address"

  lifecycle {
    ignore_changes = [
      subnet_id,
    ]
  }
}
resource "phpipam_first_free_address" "gateway_v6" {
  count         = var.add_gateway ? 1 : 0
  depends_on    = [phpipam_first_free_address.network_v6]
  subnet_id     = phpipam_first_free_subnet.subnet_v6.subnet_id
  description   = "Gateway"
  is_gateway    = true

  lifecycle {
    ignore_changes = [
      subnet_id,
    ]
  }
}

resource "phpipam_first_free_subnet" "subnet_v4" {
  parent_subnet_id  = data.phpipam_subnet.supernet_v4.subnet_id
  subnet_mask       = var.subnet_v4_length
  description       = var.subnet_description
  lifecycle {
    ignore_changes = [
      subnet_address,
    ]
  }
}

resource "phpipam_first_free_subnet" "subnet_v6" {
  parent_subnet_id  = data.phpipam_subnet.supernet_v6.subnet_id
  subnet_mask       = var.subnet_v6_length
  description       = var.subnet_description
  lifecycle {
    ignore_changes = [
      subnet_address,
    ]
  }
}

resource "phpipam_first_free_address" "addresses_v4" {
  count          = var.address_count
  depends_on     = [phpipam_first_free_address.gateway_v4]
  subnet_id      = phpipam_first_free_subnet.subnet_v4.subnet_id
  description    = length(var.address_description) > count.index ? var.address_description[count.index] : "Created by Terraform"
  hostname       = length(var.address_hostname) > count.index ? var.address_hostname[count.index] : null

  lifecycle {
    ignore_changes = [
      subnet_id,
      ip_address,
    ]
  }
}

resource "phpipam_first_free_address" "addresses_v6" {
  count          = var.address_count
  depends_on     = [phpipam_first_free_address.gateway_v6]
  subnet_id      = phpipam_first_free_subnet.subnet_v6.subnet_id
  description    = length(var.address_description) > count.index ? var.address_description[count.index] : "Created by Terraform"
  hostname       = length(var.address_hostname) > count.index ? var.address_hostname[count.index] : null

  lifecycle {
    ignore_changes = [
      subnet_id,
      ip_address,
    ]
  }
}
