locals {
  instances = {
    for instance in var.instances :
    instance.name => instance
  }
}

resource "google_compute_instance" "instance" {
  for_each     = local.instances
  name         = each.value["name"]
  machine_type = each.value["machine_type"]
  zone         = each.value["zone"]
  #   tags = ["mohit", "gce"]
  labels = each.value["labels"]

  boot_disk {
    initialize_params {
      image = each.value["image"]
    }
  }

  network_interface {
    network = each.value["network_interface"]

    access_config {
      // Ephemeral public IP
    }
  }

  metadata                = each.value["metadata"]
  metadata_startup_script = each.value["metadata_startup_script"]
}
