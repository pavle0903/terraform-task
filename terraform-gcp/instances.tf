resource "google_compute_instance" "vm-from-image" {
  name         = "nginx-vm"
  machine_type = "e2-micro"
  zone         = "europe-west3-a"
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "projects/vitalii-task/global/images/pavles-nginx-image"
    }
  }

  network_interface {
    network    = google_compute_network.my-vpc.id
    subnetwork = google_compute_subnetwork.my-subnet.id
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
}