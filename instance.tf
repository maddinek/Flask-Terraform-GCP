// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}

// A single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = "flask-vm-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone         = "europe-west3-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Make sure flask is installed on all new instances for later steps
  metadata_startup_script = data.template_file.startup.rendered

  network_interface {
    network = "default"

    access_config {
      network_tier = "STANDARD"
      // Include this section to give the VM an external ip address
    }
  }

  //adding ssh key for the instance
  metadata = {
    ssh-keys = "user:${file("~/.ssh/id_rsa.pub")}"
  }
}