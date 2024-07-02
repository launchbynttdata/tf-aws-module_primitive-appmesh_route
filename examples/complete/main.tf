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
  source     = "git::https://github.com/launchbynttdata/tf-aws-module_primitive-virtual_router?ref=1.0.1"
  depends_on = [module.appmesh]

  name          = var.virtual_router_name
  app_mesh_name = var.app_mesh_name
  listeners     = var.listeners
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name                 = var.vpc_name
  cidr                 = var.vpc_cidr
  private_subnets      = var.private_subnets
  azs                  = var.availability_zones
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = var.tags
}

module "private_ca" {
  source = "git::https://github.com/launchbynttdata/tf-aws-module_primitive-private_ca?ref=1.0.1"

  count = length(var.certificate_authority_arns) == 0 ? 1 : 0

  logical_product_family  = var.logical_product_family
  logical_product_service = var.logical_product_service
  region                  = var.region
  environment             = var.environment

}

module "namespace" {
  source = "git::https://github.com/launchbynttdata/tf-aws-module_primitive-private_dns_namespace?ref=1.0.0"

  vpc_id = module.vpc.vpc_id
  name   = var.namespace_name

}

module "private_cert" {
  source = "git::https://github.com/launchbynttdata/tf-aws-module_primitive-acm_private_cert?ref=1.0.1"

  # Private CA is created if not passed as input
  private_ca_arn = length(var.certificate_authority_arns) == 0 ? module.private_ca[0].private_ca_arn : var.certificate_authority_arns[0]
  domain_name    = "test.${var.namespace_name}"
}

module "virtual_node" {
  source                     = "git::https://github.com/launchbynttdata/tf-aws-module_primitive-virtual_node?ref=1.0.1"
  depends_on                 = [module.appmesh]
  name                       = var.virtual_node_name
  app_mesh_id                = var.app_mesh_name
  acm_certificate_arn        = module.private_cert.certificate_arn
  ports                      = var.ports
  namespace_name             = var.namespace_name
  service_name               = var.service_name
  health_check_path          = var.health_check_path
  tls_enforce                = var.tls_enforce
  tls_mode                   = var.tls_mode
  certificate_authority_arns = length(var.certificate_authority_arns) > 0 ? var.certificate_authority_arns : [module.private_ca[0].private_ca_arn]
  health_check_config        = var.health_check_config
  idle_duration              = var.idle_duration
  per_request_timeout        = var.per_request_timeout
  tags                       = var.tags
}

module "appmesh_route" {
  source     = "../.."
  depends_on = [module.virtual_node, module.virtual_router]

  name                = var.name
  app_mesh_name       = var.app_mesh_name
  virtual_router_name = var.virtual_router_name
  priority            = var.priority
  route_targets       = var.route_targets
  virtual_router_port = var.virtual_router_port
}
