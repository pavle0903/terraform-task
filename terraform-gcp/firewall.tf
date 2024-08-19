resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.my-vpc.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
}