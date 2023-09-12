# PHPIpam Subnet

Create a new subnet within PHPIpam, and optionally create some addresses within it.


## Usage
```hcl
module "example" {
  source                    = "github.com/sncs-uk/terraform-phpipam-subnet"

  subnet_description        = "New subnet created by Terraform"

  supernet_v4_section_id    = 5
  supernet_v4_name          = "myv4supernet"
  subnet_v4_length          = 24

  supernet_v6_section_id    = 6
  supernet_v6_name          = "myv6supernet"
  subnet_v6_length          = 64

  address_count             = 2
  address_description       = ["First host", "Second host"]
  address_hostname          = ["host1.example.com", "host2.example.com"]
}
```

## Requirements
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_phpipam"></a> [phpipam](#provider\_phpipam) | >= 1.5.2 |
