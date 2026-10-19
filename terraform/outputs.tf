output "website_url" {
  description = "Local URL of the Nginx website"
  value       = "http://127.0.0.1:8080"
}

output "container_name" {
  description = "Managed Docker container name"
  value       = docker_container.nginx.name
}

output "network_name" {
  description = "Managed Docker network name"
  value       = docker_network.iac.name
}
