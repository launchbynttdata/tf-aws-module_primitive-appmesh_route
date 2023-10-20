# Replace the <> with the actual values
name                = "<name_of_the_route>"
app_mesh_name       = "<app_mesh_name>"
virtual_router_name = "<virtual-router-name>"
route_targets       = ["<route-target-lists"]
virtual_router_port = 8080

match_path_prefix = "/"
idle_duration = {
  unit  = "s"
  value = 300
}

per_request_timeout = {
  unit  = "s"
  value = "300"
}
