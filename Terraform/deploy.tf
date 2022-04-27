resource "google_compute_address" "static" {
  count = 3
  name = "bind-ip-ns${count.index}"
  region = var.region
}

resource "google_compute_instance" "bind_nodes" {
  count        = 3
  name         = var.bind_vm_names[count.index]
  machine_type = var.machine_type
  zone         = var.zones[count.index]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network    = var.network_name
    subnetwork = var.subnetwork

    access_config {
      nat_ip = google_compute_address.static[count.index].address
    }
    
  }

  metadata = {
    ssh-keys = "${"eshamaaqib"}:${file("/home/eshamaaqib/.ssh/id_rsa.pub")}"
  }

  tags = ["bind"]
  depends_on  = [google_compute_address.static]
  
}

resource "google_compute_firewall" "bind-dns" {
  name    = "bind-dns"
  network = var.network_name
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports    = ["80","443","53","853","22"]
  }
  allow {
    protocol = "udp"
    ports    = ["53"]
  }

  target_tags = ["bind"]
}

output "ip" {
  value = google_compute_instance.bind_nodes.*.network_interface.0.access_config.0.nat_ip
}


