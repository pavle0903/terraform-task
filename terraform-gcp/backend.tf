terraform {
  backend "gcs" {
    bucket = "vitalii-task-bucket"
    prefix = "terraform/state"
  }
}
