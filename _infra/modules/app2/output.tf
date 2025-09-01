output "container_id" {
  value = docker_container.nginx[*].id
}

output "image_name" {
  value = docker_image.nginx.name
}