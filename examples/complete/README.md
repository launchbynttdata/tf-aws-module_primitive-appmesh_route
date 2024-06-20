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
| <a name="module_appmesh"></a> [appmesh](#module\_appmesh) | git::https://github.com/launchbynttdata/tf-aws-module_primitive-appmesh | 1.0.1 |
| <a name="module_virtual_router"></a> [virtual\_router](#module\_virtual\_router) | git::https://github.com/launchbynttdata/tf-aws-module_primitive-virtual_router | 1.0.0 |
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
| <a name="input_retry_policy"></a> [retry\_policy](#input\_retry\_policy) | Rules for retry policies to be applied to this route | <pre>object({<br>    http_retry_events = list(string)<br>    max_retries       = number<br>    per_entry_timeout = object({<br>      unit  = string<br>      value = number<br>    })<br>    tcp_retry_events = list(string)<br>  })</pre> | `null` | no |
| <a name="input_idle_duration"></a> [idle\_duration](#input\_idle\_duration) | Idle duration for all the listeners | <pre>object({<br>    unit  = string<br>    value = number<br>  })</pre> | `null` | no |
| <a name="input_per_request_timeout"></a> [per\_request\_timeout](#input\_per\_request\_timeout) | Per Request timeout for all the listeners | <pre>object({<br>    unit  = string<br>    value = number<br>  })</pre> | `null` | no |
| <a name="input_match_path_prefix"></a> [match\_path\_prefix](#input\_match\_path\_prefix) | Gateway route match path prefix. Default is `/`. Conflicts with var.match\_path\_exact and var.match\_path\_regex | `string` | `"/"` | no |
| <a name="input_virtual_router_port"></a> [virtual\_router\_port](#input\_virtual\_router\_port) | Match the port for incoming traffic from Virtual router | `number` | `8080` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | An arbitrary map of tags that can be added to all resources. | `map(string)` | `{}` | no |
| <a name="input_listeners"></a> [listeners](#input\_listeners) | Listeners that the virtual router is expected to receive inbound traffic from. Currently only one listener is supported per virtual router. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the AppMesh route |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the AppMesh route |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
