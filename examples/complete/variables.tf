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

variable "retry_policy" {
  description = "Rules for retry policies to be applied to this route"
  type = object({
    http_retry_events = list(string)
    max_retries       = number
    per_entry_timeout = object({
      unit  = string
      value = number
    })
    tcp_retry_events = list(string)
  })

  default = null
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

# Match related variables.
variable "match_path_prefix" {
  description = "Gateway route match path prefix. Default is `/`. Conflicts with var.match_path_exact and var.match_path_regex"
  type        = string
  default     = "/"
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
