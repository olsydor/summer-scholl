//Configure the Google Cloud provider
provider "google"{
    credentials = "${file("service_account.json")}"
    project     = "task4-tf-1-320920"
    region      = "europe-west3"
    zone         = "europe-west3-a"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  
  metadata_startup_script = file("./apache2.sh")

  boot_disk {
    initialize_params {
      image         = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
scheduling {
    preemptible       = true
    automatic_restart = false
  }

  network_interface {
    network = "default"
    access_config {

    }

  }
}