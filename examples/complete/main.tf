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

module "appmesh" {
  source = "git::https://github.com/launchbynttdata/tf-aws-module_primitive-appmesh?ref=1.0.1"

  name = var.app_mesh_name
}
module "virtual_router" {
  source = "git::https://github.com/launchbynttdata/tf-aws-module_primitive-virtual_router?ref=1.0.0"

  name          = var.virtual_router_name
  app_mesh_name = var.app_mesh_name
  listeners     = var.listeners
}

module "appmesh_route" {
  source = "../.."

  name                = var.name
  app_mesh_name       = var.app_mesh_name
  virtual_router_name = var.virtual_router_name
  priority            = var.priority
  route_targets       = var.route_targets
  virtual_router_port = var.virtual_router_port
}
