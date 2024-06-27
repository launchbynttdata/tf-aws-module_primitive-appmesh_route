// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

variable "name" {
  description = "Name of the virtual gateway route"
  type        = string
}

variable "priority" {
  description = "Optional priority attached to the route"
  type        = number
  default     = 0
}

variable "app_mesh_name" {
  description = "Id of the App Mesh where the virtual gateway route will reside"
  type        = string
}

variable "virtual_router_name" {
  description = "Id of the Virtual Router to associated with this gateway route"
  type        = string
}

variable "route_targets" {
  description = "A list of targets each assigned with a weight to route traffic to"
  type = list(object({
    virtual_node_name = string
    virtual_node_port = number
    weight            = number
    }
  ))
  default = []
}

variable "idle_duration" {
  description = "Idle duration for all the listeners"
  type = object({
    unit  = string
    value = number
  })
  default = null
}

variable "per_request_timeout" {
  description = "Per Request timeout for all the listeners"
  type = object({
    unit  = string
    value = number
  })
  default = null
}

variable "virtual_router_port" {
  description = "Match the port for incoming traffic from Virtual router"
  type        = number
  default     = 8080
}


variable "tags" {
  description = "An arbitrary map of tags that can be added to all resources."
  type        = map(string)
  default     = {}
}

# Virtual Router related variables.
variable "listeners" {
  description = "Listeners that the virtual router is expected to receive inbound traffic from. Currently only one listener is supported per virtual router."
  type        = any
  default     = null
}

# Virtual Node related variables.
variable "virtual_node_name" {
  description = "Name of the virtual node to be associated with the virtual gateway route"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC to be associated with the virtual gateway route"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC to be associated with the virtual gateway route"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets to be associated with the virtual gateway route"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to be associated with the virtual gateway route"
  type        = list(string)
}

variable "certificate_authority_arns" {
  description = "List of certificate authority ARNs to be associated with the virtual gateway route"
  type        = list(string)
}

variable "health_check_path" {
  description = "Path to be used for health checks"
  type        = string
}

variable "tls_enforce" {
  description = "Flag to enforce TLS"
  type        = bool
  default     = false
}

variable "tls_mode" {
  description = "TLS mode to be used"
  type        = string
  default     = "STRICT"
}

variable "ports" {
  description = "List of ports to be associated with the virtual gateway route"
  type        = list(number)
}

variable "health_check_config" {
  description = "Health check configuration"
  type = object({
    healthy_threshold   = number
    interval_millis     = number
    timeout_millis      = number
    unhealthy_threshold = number
  })
}

variable "namespace_name" {
  description = "Name of the namespace to be associated with the virtual gateway route"
  type        = string
}

variable "service_name" {
  description = "Name of the service to be associated with the virtual gateway route"
  type        = string
}

variable "logical_product_family" {
  description = "Logical product family"
  type        = string
}

variable "logical_product_service" {
  description = "Logical product service"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}
