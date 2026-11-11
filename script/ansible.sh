#!/usr/bin/env bash
#
# Configura el servidor como un nodo de control de Ansible
#
set -xeu

# Instalar ansible
apt-get update
apt-get install -y ansible ansible-lint dnsutils curl whois

# Copiar ficheros de ansible y playbooks
# Descomentar las siguientes líneas según vayamos teniendo los ficheros y
# hacer `vagrant provision ansible`
cp -vf /vagrant/ansible.cfg .
cp -vf /vagrant/inventory.yml .
cp -vf /vagrant/requirements.yml .
cp -vrf /vagrant/dns .
cp -vrf /vagrant/web .
# cp -vrf /vagrant/ftp .
chown vagrant:vagrant ./ansible.cfg ./inventory.yml ./requirements.yml
chown -R vagrant:vagrant ./dns ./web

# Instalar dependencias de Ansible
ansible-galaxy collection install -r requirements.yml

# Provisionar con Ansible
# ansible-playbook dns/dns.yml
# ansible-playbook web/web.yml
# ansible-playbook ftp/ftp.yml

# Copiar las claves privadas de Vagrant fuera de la carpeta compartida
# (en /vagrant los permisos son 0777 y SSH las rechaza)
install -d -m 700 -o vagrant -g vagrant /home/vagrant/.ssh/keys
for m in dns negocio; do
  install -m 600 -o vagrant -g vagrant \
    /vagrant/.vagrant/machines/$m/virtualbox/private_key \
    /home/vagrant/.ssh/keys/${m}_key
done