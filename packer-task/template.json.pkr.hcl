packer {
  required_plugins {
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = "~> 1"
    }
  }
}

variable "image_family" {
  type    = string
  default = "nginx-image-family"
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "project_id" {
  type    = string
  default = "vitalii-task"
}

variable "source_image" {
  type    = string
  default = "debian-12-bookworm-v20240709"
}

source "googlecompute" "nginx-image" {
  disk_size    = 50
  disk_type    = "pd-balanced"
  image_family = "${var.image_family}"
  image_name   = "pavles-nginx-image"
  machine_type = "${var.machine_type}"
  project_id   = "${var.project_id}"
  source_image = "${var.source_image}"
  ssh_username = "debian"
  zone         = "us-central1-a"
}

build {
  sources = ["source.googlecompute.nginx-image"]

  provisioner "shell" {
    script = "nginx-install.sh"
  }

}
