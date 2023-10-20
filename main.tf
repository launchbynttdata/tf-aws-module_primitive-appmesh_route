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

resource "aws_appmesh_route" "this" {
  name                = var.name
  mesh_name           = var.app_mesh_name
  virtual_router_name = var.virtual_router_name


  spec {
    priority = var.priority
    http_route {
      action {
        dynamic "weighted_target" {
          for_each = var.route_targets
          content {
            weight       = weighted_target.value.weight
            virtual_node = weighted_target.value.virtual_node_name
            port         = weighted_target.value.virtual_node_port
          }
        }
      }

      dynamic "retry_policy" {
        for_each = var.retry_policy != null ? [1] : []
        content {
          http_retry_events = var.retry_policy.http_retry_events
          max_retries       = var.retry_policy.max_retries
          per_retry_timeout {
            unit  = var.retry_policy.unit
            value = var.retry_policy.value
          }
        }

      }

      dynamic "timeout" {
        for_each = var.idle_duration != null || var.per_request_timeout != null ? [1] : []
        content {
          dynamic "idle" {
            for_each = var.idle_duration != null ? [1] : []
            content {
              unit  = var.idle_duration.unit
              value = var.idle_duration.value
            }
          }
          dynamic "per_request" {
            for_each = var.per_request_timeout != null ? [1] : []
            content {
              unit  = var.per_request_timeout.unit
              value = var.per_request_timeout.value
            }
          }
        }
      }

      match {
        prefix = var.match_path_prefix
        port   = var.virtual_router_port
      }
    }
  }

  tags = local.tags
}
