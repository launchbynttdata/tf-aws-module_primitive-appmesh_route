name                = "terratest-test-route"
app_mesh_name       = "terratest-test-appmesh"
virtual_router_name = "terratest-test-virtual-router"
vpc_name            = "terratest-test-vpc"
namespace_name      = "terratest-test-namespace.local"
service_name        = "terratest-test-service"
virtual_node_name   = "terratest-test-virtual-node"

route_targets = [{
  virtual_node_name = "terratest-test-virtual-node"
  virtual_node_port = 8080
  weight            = 1
}]

listeners = [
  {
    port     = 8080
    protocol = "http"
  },
  {
    port     = 443
    protocol = "http"
  }
]

ports             = [8080]
health_check_path = "/"
# If this is empty, example module will create one for you. Certs provisioning fails immediately after CA creation. This is the workaround.
certificate_authority_arns = []
tls_enforce                = true
tls_mode                   = "STRICT"
logical_product_family     = "terratest"
logical_product_service    = "test"
environment                = "dev"
region                     = "us-east-2"
vpc_cidr                   = "10.1.0.0/16"
private_subnets            = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
availability_zones         = ["us-east-2a", "us-east-2b", "us-east-2c"]
health_check_config = {
  healthy_threshold   = 2
  interval_millis     = 20000
  timeout_millis      = 50000
  unhealthy_threshold = 2
}
