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

output "id" {
  description = "ID of the AppMesh route"
  value       = module.appmesh_route.id
}

output "arn" {
  description = "ARN of the AppMesh route"
  value       = module.appmesh_route.arn
}

output "name" {
  description = "Name of the AppMesh route"
  value       = module.appmesh_route.name
}

output "mesh_name" {
  description = "Name of the AppMesh"
  value       = module.appmesh.name
}

output "virtual_router_name" {
  description = "Name of the Virtual Router"
  value       = module.virtual_router.name
}

output "virtual_node_name" {
  description = "Name of the Virtual Node"
  value       = module.virtual_node.name
}
