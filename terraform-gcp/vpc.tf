resource "google_compute_network" "my-vpc" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my-subnet" {
  name          = "my-subnet"
  ip_cidr_range = "192.168.1.0/24"
  region        = "europe-west3"
  network       = google_compute_network.my-vpc.id
}