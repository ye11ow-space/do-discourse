// https://www.terraform.io/docs/providers/do/r/droplet.html#attributes-reference
output "Disk" { value = "${digitalocean_droplet.vm.*.disk}" }
output "Droplet_ID" { value = "${digitalocean_droplet.vm.*.id}" }
output "Image" { value = "${digitalocean_droplet.vm.*.image}" }
output "IPv4_Address_Public" { value = "${digitalocean_droplet.vm.*.ipv4_address}" }
output "IPv4_Address_Private" { value = "${digitalocean_droplet.vm.*.ipv4_address_private}" }
output "Locked" { value = "${digitalocean_droplet.vm.*.locked}" }
output "Name" { value = "${digitalocean_droplet.vm.*.name}" }
output "Price_Hourly" { value = "${digitalocean_droplet.vm.*.price_hourly}" }
output "Price_Monthly" { value = "${digitalocean_droplet.vm.*.price_monthly}" }
output "Private_Networking" { value = "${digitalocean_droplet.vm.*.private_networking}" }
output "Region" { value = "${digitalocean_droplet.vm.*.region}" }
output "Size" { value = "${digitalocean_droplet.vm.*.size}" }
output "Status" { value = "${digitalocean_droplet.vm.*.status}" }
// output "Tags" { value = "${digitalocean_droplet.vm.*.tags }" }
output "VCPUs" { value = "${digitalocean_droplet.vm.*.vcpus}" }
// output "Volume ID(s)" { value = "${digitalocean_droplet.vm.*.volume_ids }" }
