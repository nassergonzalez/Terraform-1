module "app1" {
  source = "./modules/app"
}

module "app2" {
  source = "./modules/app2"
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = "public-read"
}

output "app-1-output-container-id" {
  value = module.app1.container_id
}
output "app-2-output-container-id" {
  value = module.app2.container_id
}