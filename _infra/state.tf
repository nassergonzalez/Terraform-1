terraform {
#  backend "local" {
#    path = "terraform_state/terraform.tfstate"
#  }
  backend "http" {
    address = "http://localhost:8000/api/v1/project/12345/terraform/state/terraform.state"
    lock_address = "http://localhost:8000/api/v1/project/12345/terraform/state/lock/terraform.lock"
    unlock_address = "http://localhost:8000/api/v1/project/12345/terraform/state/unlock/terraform.lock"
    unlock_method = "DELETE"
    lock_method = "POST"
  }
}
