# complete

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0, <= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_appmesh"></a> [appmesh](#module\_appmesh) | terraform.registry.launch.nttdata.com/module_primitive/appmesh/aws | ~> 1.0 |
| <a name="module_virtual_router"></a> [virtual\_router](#module\_virtual\_router) | terraform.registry.launch.nttdata.com/module_primitive/virtual_router/aws | ~> 1.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.0.0 |
| <a name="module_private_ca"></a> [private\_ca](#module\_private\_ca) | terraform.registry.launch.nttdata.com/module_primitive/private_ca/aws | ~> 1.0 |
| <a name="module_namespace"></a> [namespace](#module\_namespace) | terraform.registry.launch.nttdata.com/module_primitive/private_dns_namespace/aws | ~> 1.0 |
| <a name="module_private_cert"></a> [private\_cert](#module\_private\_cert) | terraform.registry.launch.nttdata.com/module_primitive/acm_private_cert/aws | ~> 1.0 |
| <a name="module_virtual_node"></a> [virtual\_node](#module\_virtual\_node) | terraform.registry.launch.nttdata.com/module_primitive/virtual_node/aws | ~> 1.0 |
| <a name="module_appmesh_route"></a> [appmesh\_route](#module\_appmesh\_route) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the virtual gateway route | `string` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | Optional priority attached to the route | `number` | `0` | no |
| <a name="input_app_mesh_name"></a> [app\_mesh\_name](#input\_app\_mesh\_name) | Id of the App Mesh where the virtual gateway route will reside | `string` | n/a | yes |
| <a name="input_virtual_router_name"></a> [virtual\_router\_name](#input\_virtual\_router\_name) | Id of the Virtual Router to associated with this gateway route | `string` | n/a | yes |
| <a name="input_route_targets"></a> [route\_targets](#input\_route\_targets) | A list of targets each assigned with a weight to route traffic to | <pre>list(object({<br>    virtual_node_name = string<br>    virtual_node_port = number<br>    weight            = number<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_idle_duration"></a> [idle\_duration](#input\_idle\_duration) | Idle duration for all the listeners | <pre>object({<br>    unit  = string<br>    value = number<br>  })</pre> | `null` | no |
| <a name="input_per_request_timeout"></a> [per\_request\_timeout](#input\_per\_request\_timeout) | Per Request timeout for all the listeners | <pre>object({<br>    unit  = string<br>    value = number<br>  })</pre> | `null` | no |
| <a name="input_virtual_router_port"></a> [virtual\_router\_port](#input\_virtual\_router\_port) | Match the port for incoming traffic from Virtual router | `number` | `8080` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | An arbitrary map of tags that can be added to all resources. | `map(string)` | `{}` | no |
| <a name="input_listeners"></a> [listeners](#input\_listeners) | Listeners that the virtual router is expected to receive inbound traffic from. Currently only one listener is supported per virtual router. | `any` | `null` | no |
| <a name="input_virtual_node_name"></a> [virtual\_node\_name](#input\_virtual\_node\_name) | Name of the virtual node to be associated with the virtual gateway route | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC to be associated with the virtual gateway route | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block of the VPC to be associated with the virtual gateway route | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnets to be associated with the virtual gateway route | `list(string)` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones to be associated with the virtual gateway route | `list(string)` | n/a | yes |
| <a name="input_certificate_authority_arns"></a> [certificate\_authority\_arns](#input\_certificate\_authority\_arns) | List of certificate authority ARNs to be associated with the virtual gateway route | `list(string)` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Path to be used for health checks | `string` | n/a | yes |
| <a name="input_tls_enforce"></a> [tls\_enforce](#input\_tls\_enforce) | Flag to enforce TLS | `bool` | `false` | no |
| <a name="input_tls_mode"></a> [tls\_mode](#input\_tls\_mode) | TLS mode to be used | `string` | `"STRICT"` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | List of ports to be associated with the virtual gateway route | `list(number)` | n/a | yes |
| <a name="input_health_check_config"></a> [health\_check\_config](#input\_health\_check\_config) | Health check configuration | <pre>object({<br>    healthy_threshold   = number<br>    interval_millis     = number<br>    timeout_millis      = number<br>    unhealthy_threshold = number<br>  })</pre> | n/a | yes |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | Name of the namespace to be associated with the virtual gateway route | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the service to be associated with the virtual gateway route | `string` | n/a | yes |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | Logical product family | `string` | n/a | yes |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | Logical product service | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the AppMesh route |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the AppMesh route |
| <a name="output_name"></a> [name](#output\_name) | Name of the AppMesh route |
| <a name="output_mesh_name"></a> [mesh\_name](#output\_mesh\_name) | Name of the AppMesh |
| <a name="output_virtual_router_name"></a> [virtual\_router\_name](#output\_virtual\_router\_name) | Name of the Virtual Router |
| <a name="output_virtual_node_name"></a> [virtual\_node\_name](#output\_virtual\_node\_name) | Name of the Virtual Node |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
