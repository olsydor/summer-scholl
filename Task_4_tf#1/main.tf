//Configure the Google Cloud provider
provider "google"{
    credentials = "${file("service_account.json")}"
    project     = "task4-tf-1-320920"
    region      = "europe-west3"
    zone        = "europe-west3-a"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
//Install Apache
  metadata_startup_script = file("./apache2.sh")
//Add image: ubuntu 20.04
  boot_disk {
    initialize_params {
      image         = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
scheduling {
    preemptible       = true
    automatic_rest   
    }

  }
}
//Allow HTTP/HTTPS traffic on a NIC
resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "443"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}
 data "google_client_openid_userinfo" "me" {
}
//Provision one SSH public key for created instance
resource "google_os_login_ssh_public_key" "cache" {
  user   =  data.google_client_openid_userinfo.me.email
  key    = file("/home/olsydor/.ssh/ssh_key.pub")
}
