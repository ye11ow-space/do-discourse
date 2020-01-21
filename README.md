# Digital Ocean setup for Discourse

This repository contains **Terraform** code that allow one to create **Digital Ocean Droplet**.

## Summary

Terraform provisioner `remote-exec` used to:

1. Add a new user according to the `ssh_user` variable.
2. Add this user to the `admin` group.
3. Modify `/etc/sudoers` so that the `admin` group can execute `sudo` without a password.
4. Modify `/etc/ssh/sshd_config` to disallow `root` user login and allow `PubkeyAuthentication`.
5. Move ssh keys from `/root/.ssh/` to `/home/YOUR_SSH_USER/.ssh/`.

### Requirements

1. [Terraform](https://www.terraform.io/downloads.html).
2. A token for **Digital Ocean** that can `write`.
3. An SSH public key registered with **Digital Ocean**
4. Asociated SSH private key in the host where terraform will be executed

### Required Variables

1. `do_token`: (string) Digital Ocean API Token.
2. `do_region`: (string) Digital Ocean Region.
3. `ssh_user`: (string) Name of user that will be crearted and allowed password-less **sudo** and **ssh access**.
4. `ssh_key_path`: (string) path on local machine to SSH private key.
5. `vm_ssh_key_ids`: (list) ID(s) of SSH Key ID's according to Digital Ocean.
6. `vm_name`: (string) Droplet name to be set.

## Usage

Setup environmente variables (or provide them during execution):

```bash
export TF_VAR_do_token='DIGITAL_OCEAN_TOKEN' && \
export TF_VAR_do_region='DIGITAL_OCEAN_REGION' && \
export TF_VAR_ssh_user='ssh_user' && \
export TF_VAR_ssh_key_path='/local/path/to/private/key' && \
export TF_VAR_vm_ssh_key_ids='[12483191]'
export TF_VAR_vm_name="example.domain.com"
```

Execute terraform commands

```bash
terraform init
terraform plan
terraform apply
```

### Useful cURL calls to Digital Ocean's API

Export your [Digital Ocean API key](https://cloud.digitalocean.com/account/api/tokens):

```bash
export DIGITALOCEAN_TOKEN='DIGITAL_OCEAN_TOKEN'
```

#### Get Droplet Sizes

```bash
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer ${DIGITALOCEAN_TOKEN}" "https://api.digitalocean.com/v2/sizes" | jq
```

#### Get Digital Ocean's regions (and it's avalible sizes)

```bash
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer ${DIGITALOCEAN_TOKEN}" "https://api.digitalocean.com/v2/regions" | jq
```

#### Locate your SSH Key ID(s)

```bash
curl -H "Content-Type: application/json" -H "Authorization: Bearer ${DIGITALOCEAN_TOKEN}" "https://api.digitalocean.com/v2/account/keys" | jq
```

*Use the desired **Key ID**  from this output as the value(s) for the `vm_ssh_key_ids` variable*

## About

+ Tested with **Ubuntu 18.04**.
+ All *arguments* for the `digitalocean_droplet` **Terraform** resource are enumerated in `main.tf` and `variables.tf`.
+ All available *terraform outputs* will be printed upon completion of `terraform apply`.

## References

+ [Terraform provider documentation](https://www.terraform.io/docs/providers/do/r/droplet.html)
+ [Digital Ocean API documentation](https://developers.digitalocean.com/documentation/v2/)
+ [Example repository](https://gitlab.com/chicken231/terraform-digitalocean-droplets-ubuntu)
