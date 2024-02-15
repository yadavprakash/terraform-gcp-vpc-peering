provider "google" {
  project = "local-concord-408802"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

data "google_compute_network" "my-network" {
  name = "test-vpc"
}
data "google_compute_network" "my-network1" {
  name = "test-vpc2"
}

#####==============================================================================
##### vpc-peering module call.
#####==============================================================================
module "peering" {
  source        = "../"
  vpc_1_name    = "test-vpc"
  vpc_2_name    = "test-vpc2"
  local_network = data.google_compute_network.my-network.self_link
  peer_network  = data.google_compute_network.my-network1.self_link
}