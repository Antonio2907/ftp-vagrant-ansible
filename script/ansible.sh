#!/usr/bin/env bash
#
# Configura el servidor como un nodo de control de Ansible
#
set -xeu

# Instalar ansible
apt-get update
apt-get install -y ansible ansible-lint

# Copiar ficheros de ansible y playbooks
# Descomentar las siguientes líneas según vayamos teniendo los ficheros y
# hacer `vagrant provision ansible`
# cp -vf /vagrant/ansible.cfg .
# cp -vf /vagrant/inventory.yml .
# cp -vf /vagrant/requirements.yml .
# cp -vrf /vagrant/dns .
# cp -vrf /vagrant/web .
# cp -vrf /vagrant/ftp .
# chown vagrant:vagrant ./ftp/vars/vault.yml

# Instalar dependencias de Ansible
# ansible-galaxy collection install -r requirements.yml

# Provisionar con Ansible
# ansible-playbook dns/dns.yml
# ansible-playbook web/web.yml
# ansible-playbook ftp/ftp.yml