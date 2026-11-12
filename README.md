# FTP con Vagrant y Ansible

**Autor:** Antonio Jiménez Balbuena
**Repositorio:** https://github.com/Antonio2907/ftp-vagrant-ansible

## Objetivo

Desplegar de forma automatizada un entorno con tres máquinas virtuales:
un servidor DNS, un servidor web (Apache) y un servidor FTP seguro (vsftpd
con TLS), todo provisionado con Ansible desde un nodo de control.
El dominio de la práctica es `antonio.test`.

## Herramientas utilizadas

- **GitHub**: repositorio, issues y GitHub Projects para gestionar las tareas.
- **Vagrant**: creación de las máquinas virtuales (`debian/bookworm64`).
- **VirtualBox**: proveedor de virtualización de Vagrant.
- **Ansible**: provisionamiento de DNS, web y FTP.
- **BIND9**: servidor DNS.
- **Apache2**: servidor web.
- **vsftpd**: servidor FTP con TLS (FTPES).
- **FileZilla / WinSCP**: cliente FTP para las pruebas.

## Instrucciones iniciales

1. Clonar el repositorio:
   `git clone https://github.com/Antonio2907/ftp-vagrant-ansible.git`
2. Entrar en la carpeta y levantar las máquinas: `vagrant up`
3. Comprobar que están creadas: `vagrant status`
4. Conectarse al nodo de control: `vagrant ssh ansible`
5. Ejecutar los playbooks desde el nodo de control (ver cada apartado del proyecto).

## Licencia

Este proyecto se distribuye bajo licencia MIT. Ver el archivo [LICENSE](LICENSE).