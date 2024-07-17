## Terraform-gcp-vpc-peering
## Terraform Google Cloud vpc-peering Module
## Table of Contents

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Authors](#authors)
- [License](#license)

## Introduction
This project deploys a Google Cloud infrastructure using Terraform to create vpc-peering .

## Usage

To use this module, you should have Terraform installed and configured for GCP. This module provides the necessary Terraform configuration for creating GCP resources, and you can customize the inputs as needed. Below is an example of how to use this module:
# Example: _vpc-peering_

```hcl
module "peering" {
  source        = "https://github.com/yadavprakash/terraform-gcp-vpc-peering.git"
  vpc_1_name    = "test-vpc"
  vpc_2_name    = "test-vpc2"
  local_network = data.google_compute_network.my-network.self_link
  peer_network  = data.google_compute_network.my-network1.self_link
}

```

This example demonstrates how to create various GCP resources using the provided modules. Adjust the input values to suit your specific requirements.

## Module Inputs

- `name`: The name of the application or resource.
- `environment`: The environment in which the resource exists.
- `label_order`: The order in which labels should be applied.
- `business_unit`: The business unit associated with the application.
- `attributes`: Additional attributes to add to the labels.
- `extra_tags`: Extra tags to associate with the resource.

## Module Outputs
- This module currently does not provide any outputs.

# Examples
For detailed examples on how to use this module, please refer to the [example](https://github.com/yadavprakash/terraform-gcp-vpc-peering/tree/master/_example) directory within this repository.

## Authors
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/yadavprakash/terraform-gcp-vpc-peering/blob/master/LICENSE) file for details.



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.75, < 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.75, < 5.13.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.1.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.75, < 5.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_network_peering.local_network_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering) | resource |
| [google_compute_network_peering.peer_network_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering) | resource |
| [null_resource.complete](https://registry.terraform.io/providers/hashicorp/null/3.1.0/docs/resources/resource) | resource |
| [null_resource.module_depends_on](https://registry.terraform.io/providers/hashicorp/null/3.1.0/docs/resources/resource) | resource |
| [random_string.network_peering_suffix](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_export_local_custom_routes"></a> [export\_local\_custom\_routes](#input\_export\_local\_custom\_routes) | Export custom routes to peer network from local network. | `bool` | `false` | no |
| <a name="input_export_local_subnet_routes_with_public_ip"></a> [export\_local\_subnet\_routes\_with\_public\_ip](#input\_export\_local\_subnet\_routes\_with\_public\_ip) | Export custom routes to peer network from local network (defaults to true; causes the Local Peering Connection to align with the [provider default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering#export_subnet_routes_with_public_ip), and the Remote Peering Connection to be opposite the provider default). | `bool` | `true` | no |
| <a name="input_export_peer_custom_routes"></a> [export\_peer\_custom\_routes](#input\_export\_peer\_custom\_routes) | Export custom routes to local network from peer network. | `bool` | `false` | no |
| <a name="input_export_peer_subnet_routes_with_public_ip"></a> [export\_peer\_subnet\_routes\_with\_public\_ip](#input\_export\_peer\_subnet\_routes\_with\_public\_ip) | Export custom routes to local network from peer network (defaults to false; causes the Local Peering Connection to align with the [provider default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering#import_subnet_routes_with_public_ip), and the Remote Peering Connection to be opposite the provider default). | `bool` | `false` | no |
| <a name="input_local_network"></a> [local\_network](#input\_local\_network) | Resource link of the network to add a peering to. | `string` | n/a | yes |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | List of modules or resources this module depends on. | `list(any)` | `[]` | no |
| <a name="input_peer_network"></a> [peer\_network](#input\_peer\_network) | Resource link of the peer network. | `string` | n/a | yes |
| <a name="input_peering_enabled"></a> [peering\_enabled](#input\_peering\_enabled) | peering\_enabled in true  for  resource to be created. | `bool` | `true` | no |
| <a name="input_stack_type"></a> [stack\_type](#input\_stack\_type) | Which IP version(s) of traffic and routes are allowed to be imported or exported between peer networks. Possible values: ["IPV4\_ONLY", "IPV4\_IPV6"]. | `string` | `"IPV4_ONLY"` | no |
| <a name="input_vpc_1_name"></a> [vpc\_1\_name](#input\_vpc\_1\_name) | The name of the virtual network. Changing this forces a new resource to be created. | `string` | `""` | no |
| <a name="input_vpc_2_name"></a> [vpc\_2\_name](#input\_vpc\_2\_name) | The name of the virtual network. Changing this forces a new resource to be created. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_complete"></a> [complete](#output\_complete) | Output to be used as a module dependency. |
| <a name="output_local_network_peering"></a> [local\_network\_peering](#output\_local\_network\_peering) | Network peering resource. |
| <a name="output_peer_network_peering"></a> [peer\_network\_peering](#output\_peer\_network\_peering) | Peer network peering resource. |
| <a name="output_state"></a> [state](#output\_state) | State for the peering, either ACTIVE or INACTIVE. The peering is ACTIVE when there's a matching configuration in the peer network. |
| <a name="output_state_details"></a> [state\_details](#output\_state\_details) | Details about the current state of the peering. |
<!-- END_TF_DOCS -->