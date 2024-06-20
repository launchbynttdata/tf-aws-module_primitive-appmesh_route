name                = "terratest-test-route"
app_mesh_name       = "terratest-test-appmesh"
virtual_router_name = "terratest-test-virtual-router"

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
